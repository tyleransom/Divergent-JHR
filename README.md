# Replication instructions

This repository contains data and code to replicate results in "Divergent: The Time Path of Legacy and Athlete Admissions at Harvard" by Arcidiacono, Kinsler and Ransom published in *Journal of Human Resources.*

## Software requirements

- Matlab R2019a or above

## Replication procedure

To replicate all results, simply clone the repository, open Matlab and run `master_replication_file.m`. This file is a script that calls various scripts, which in turn call various functions. Scripts are contained in `Scripts/` and functions are contained in `Functions/`. Output will be posted in the `Logs/` (Matlab diary format) and `FiguresAndTables/` (PDF or TeX format) folders.

Data come from *SFFA v. Harvard* trial exhibits, as well as NCES IPEDS, but have already been converted into Matlab format. Data files are contained in the `Data/` folder.
