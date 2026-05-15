#!/bin/bash
PDB_FILE=$1
PDB_BASE=$(basename $PDB_FILE .pdb)

apptainer run \
    --env HF_TOKEN=<YOUR_HF_TOKEN> \
    /staging/waymentsteel/dyna1.sif \
    /opt/dyna1/dyna1.py \
    --pdb $PWD/$PDB_FILE \
    --chain A \
    --name $PDB_BASE \
    --use_pdb_seq \
    --write_to_pdb \
    --save_dir $PWD
