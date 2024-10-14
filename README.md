# wdlfiles

## Overview

The `wdlfiles` repository is dedicated to storing and archiving WDL (Waveform Definition Language) source files. These files are used to generate `.acf` files, which are firmware files for the STA Archon camera controller. This repository facilitates the conversion of WDL source files to `.acf` files using scripts from the [CaltechOpticalObservatories/wdl](https://github.com/CaltechOpticalObservatories/wdl) repository.

Additionally, CI workflows are set up to automate the conversion process, ensuring that the stored WDL files can be successfully converted to `.acf` files.

## Key Features

- **WDL File Storage:** Store and archive multiple versions of WDL source files.
- **Automated Conversion:** Use scripts from the [wdl](https://github.com/CaltechOpticalObservatories/wdl) repository to convert WDL files to `.acf` firmware files.
- **CI Integration:** Continuous Integration (CI) is implemented to automatically run the conversion process and verify that the WDL files are valid and can be compiled into `.acf` files.

## Repository Structure

The repository is structured as follows:

```
wdlfiles/ 
├── src/ # Folder containing the WDL source files 
├── acf/ # Folder for storing generated .acf files 
├── .github/ # CI workflows for automating conversion 
└── README.md # This documentation file
```

## How to Use

### Prerequisites

- Ensure you have the necessary dependencies and environment to run the ACF build script (refer to the [wdl repository](https://github.com/CaltechOpticalObservatories/wdl) for setup instructions).

### Steps to Convert WDL to ACF

1. Place the WDL source files in the `src/` directory of this repository.
2. Run the ACF build script in the `bin` folder to generate `.acf` files.
```
    bin/build_acf.py {target}
```
3. The `.acf` files will be stored in the `acf/` directory for further use.

### CI Workflow

The CI pipeline is configured to:

- Trigger on every push to the repository.
- Automatically run the ACF build script for the WDL files stored in the `src/` folder.
- Report success or failure based on whether the conversion process completes successfully.

## Contributing

Feel free to submit pull requests with new WDL source files or improvements to the conversion process. Please ensure that all new files are compatible with the CI pipeline.
