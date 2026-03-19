# Compilation instructions

Instructions for compiling and running the software used in this study on your local machine.
All experiments were run on Mac or Linux-based operating systems.

You will need a C++ compiler that supports C++20.
We used g++14 for all local compilations.

You will also need Python to run graph generation and analysis.
Python dependencies are listed in the `requirements.txt` at the root of [this repository](https://github.com/amlalejini/2026-alife-mutualism-constrains-evolution).

Statistical analyses and data visualizations were conducted using R.

Experiments were conducted using the Symbulation software platform.
The specific version of Symbulation used for these experiments can be found here: <https://github.com/amlalejini/SymbulationEmp/tree/sgp-mode-refactor> (commit hash: `476bd8a4c0e6390942ede46ee9cd1bbe5ab8ec70`).
This supplemental repository has the correct Symbulation version pinned as a git submodule (in `third-party/`).

## Instructions

First, clone the `2026-alife-mutualism-constrains-evolution` repository (<https://github.com/amlalejini/2026-alife-mutualism-constrains-evolution>) to your local machine.
Then, initialize and update the git submodules inside the repository.
From inside the repository, run:

```
git submodule update --init --recursive
```

This will download the correct version of Symbulation along with all of its necessary dependencies.

To compile Symbulation, navigate to the `third-party/SymbulationEmp` directory, and run `make sgp-mode`.
The compiled executable will be placed inside the `third-party/SymbulationEmp` directory.

The Symbulation configuration files used for each of experiments can be found in the `experiments/` directory (within the `hpc/config/` subdirectory for any given experiment).

