#!/usr/bin/env python

import sys
import os
import subprocess
import json

GPP = "/usr/bin/gpp"
WDLPATH = "../../wdl/wdl"
PLOT = "False"  # Default, set to True to show waveform plots
GFLAGS = '+c "/*" "*/" +c "//" "\\n"'

SEQPARSER = f"{WDLPATH}/seqParserDriver.py"
INCPARSER = f"{WDLPATH}/incParserDriver.py"
WDLPARSER = f"{WDLPATH}/wdlParserDriver.py"
MODPARSER = f"{WDLPATH}/modParserDriver.py"
WAVGEN = f"{WDLPATH}/wavgenDriver.py"
MODEGEN = f"{WDLPATH}/modegenDriver.py"
I2A = f"{WDLPATH}/ini2acf.pl"

def get_src_dir(target):
    return f'./src/{target}'

def scan_file_for_key(file_name, key):
    try:
        with open(f"{file_name}.conf.json") as f:
            content = f.read()
            js = json.loads(content)
            return js[key]
    except FileNotFoundError:
        print(f"{file_name}.conf.json does not exist")
        return None


def run_command(command):
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error: {result.stderr}")
        exit(1)
    return result.stdout


def build_acf(target):
    f_tmp = f"{target}_TMP"
    
    # Scan for MODULE_FILE
    modfile = scan_file_for_key(target, "MODULE_FILE")
    print(f"Looking for MODULE_FILE = {modfile} ...")
    if not modfile or not os.path.isfile(modfile):
        print(f"{modfile} does not exist")
        return

    print(f"Making {f_tmp}.wdl from {target}.conf ...")
    run_command(f"cat {target}.conf | {SEQPARSER} - | {GPP} {GFLAGS} -I{get_src_dir(target)} | {WDLPARSER} - > {f_tmp}.wdl")

    print(f"Making {f_tmp}.script, {f_tmp}.states from {f_tmp}.wdl ...")
    run_command(f"echo {f_tmp} | cat  - {modfile} | {GPP} {GFLAGS} -I{get_src_dir(target)} | {MODPARSER} -")
    
    print(f"Running WAVGEN for {f_tmp} ...")
    run_command(f"{WAVGEN} {f_tmp} {PLOT}")

    print(f"Assembling {target}.acf ...")
    
    # Scan for CDS_FILE
    cdsfile = scan_file_for_key(target, "CDS_FILE")
    print(f"Looking for CDS_FILE = {cdsfile} ...")
    if not cdsfile or not os.path.isfile(cdsfile):
        print(f"{cdsfile} does not exist")
        return

    run_command(f"cat {target}.conf | {INCPARSER} - | cat - {cdsfile} | {GPP} {GFLAGS} -I{get_src_dir(target)} | "
                f"cat - {f_tmp}.script {f_tmp}.modules {f_tmp}.states {f_tmp}.system | {I2A} - > {target}.acf")

    # Scan for MODE_FILE
    modefile = scan_file_for_key(target, "MODE_FILE")
    run_command(f"{MODEGEN} {modefile} {target}.acf")

    # Insert REV keyword if in git
    if os.path.isdir(".git"):
        print("Inserting REV keyword ...")
        run_command(f"{WDLPATH}/insert_hash {target}.acf")
    else:
        print("Not a git archive, skipping REV keyword")

    print(f"Removing {target}_TMP files ...")
    run_command(f"rm -f {target}_TMP.*")

    print(f"Moving {target}.acf file to acf folder ...")
    run_command(f"mv {target}.acf ../../acf/")

    print("Done")


if __name__ == "__main__":
    if len(sys.argv) > 1:
        build_acf(sys.argv[1])
    else:
        print("No target argument provided.")
