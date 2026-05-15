#!/bin/bash
PDB=$1

apptainer run \
    --env HF_TOKEN=<YOUR_HF_TOKEN> \
    /staging/$(USER)/dyna1.sif \
    /opt/dyna1/dyna1.py \
    --pdb $PDB \
    --chain A \
    --name $PDB \
    --use_pdb_seq \
    --write_to_pdb \
    --save_dir $PWD
