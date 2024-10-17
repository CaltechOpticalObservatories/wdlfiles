#!/usr/bin/env python

import sys
import os
import subprocess
import re

# Set the correct gpp path
GPP = subprocess.check_output(["which", "gpp"]).decode('utf-8').strip()

CURDIR = os.path.dirname(os.path.abspath(__file__))
WDLPATH = f"{CURDIR}/../wdl/wdl"
PLOT = "False"  # Default, set to True to show waveform plots
GFLAGS = '+c "/*" "*/" +c "//" "\\n"'

SEQPARSER = f"{WDLPATH}/seqParserDriver.py"
INCPARSER = f"{WDLPATH}/incParserDriver.py"
WDLPARSER = f"{WDLPATH}/wdlParserDriver.py"
MODPARSER = f"{WDLPATH}/modParserDriver.py"
WAVGEN = f"{WDLPATH}/wavgenDriver.py"
MODEGEN = f"{WDLPATH}/modegenDriver.py"
I2A = f"{WDLPATH}/ini2acf.pl"

def read_config_variables(file_path):
    variables = {}
    
    # Define the regex pattern to match lines with variable assignments
    pattern = re.compile(r'(\w+)\s*=\s*"([^"]+)"')

    # Open the file and read line by line
    with open(file_path, 'r') as file:
        for line in file:
            # Match the pattern
            match = pattern.search(line)
            if match:
                # Extract the variable name and value
                variable_name = match.group(1)
                variable_value = match.group(2)
                variables[variable_name] = variable_value

    return variables

def get_src_dir(target):
    return f'{CURDIR}/../src/{target}'

def scan_file_for_key(target, key):
    try:
        config_variables = read_config_variables(f"{get_src_dir(target)}/{target}.conf")
        return f"{get_src_dir(target)}/{config_variables[key]}"
    except FileNotFoundError:
        print(f"{target}.conf does not exist")
        return None


def run_command(command):
    result = subprocess.run(command, shell=True, capture_output=True, text=True)
    if result.returncode != 0:
        print(f"Error: {result.stderr}")
        exit(1)
    return result.stdout


def build_acf(target):
    f_tmp = f"{get_src_dir(target)}/{target}_TMP"
    
    # Scan for MODULE_FILE
    modfile = scan_file_for_key(target, "MODULE_FILE")
    print(f"Looking for MODULE_FILE = {modfile} ...")
    if not modfile or not os.path.isfile(modfile):
        print(f"{modfile} does not exist")
        return

    print(f"Making {f_tmp}.wdl from {target}.conf ...")
    run_command(f"cat {get_src_dir(target)}/{target}.conf | {SEQPARSER} - | {GPP} {GFLAGS} -I{get_src_dir(target)} | {WDLPARSER} - > {f_tmp}.wdl")

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
                f"cat - {f_tmp}.script {f_tmp}.modules {f_tmp}.states {f_tmp}.system | {I2A} - > {get_src_dir(target)}/{target}.acf")

    # Scan for MODE_FILE
    modefile = scan_file_for_key(target, "MODE_FILE")
    run_command(f"{MODEGEN} {modefile} {get_src_dir(target)}/{target}.acf")

    print(f"Removing {get_src_dir(target)}/{target}_TMP files ...")
    run_command(f"rm -f {get_src_dir(target)}/{target}_TMP.*")

    print(f"Moving {get_src_dir(target)}/{target}.acf file to acf folder ...")
    run_command(f"mv {get_src_dir(target)}/{target}.acf {CURDIR}/../acf/")

    print("Done")

if __name__ == "__main__":
    if len(sys.argv) > 1:
        build_acf(sys.argv[1])
    else:
        print("No target argument provided.")
