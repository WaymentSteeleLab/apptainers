#!/bin/bash
set -e

PDB_ID=1UBQ
wget -q https://files.rcsb.org/download/${PDB_ID}.pdb -O ${PDB_ID}.pdb

afnmr ${PDB_ID}

echo "AFNMR test completed successfully!"
