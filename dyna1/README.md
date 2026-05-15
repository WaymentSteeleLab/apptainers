# Dyna1 Apptainer Build & Run

## Building the Container

Start an interactive build node via HTCondor:

```bash
condor_submit -i build.sub
```

Then build the Apptainer image:

```bash
apptainer build dyna1.sif dyna1.def
```

## Testing

First, export your Hugging Face token:

```bash
export HF_TOKEN=<MY_TOKEN>
```

Then run the container:

```bash
apptainer run --env HF_TOKEN=$HF_TOKEN dyna1.sif dyna1.py \
  --pdb 1UBQ \
  --chain A \
  --name ubiquitin_test \
  --use_pdb_seq
```
Note: the build node has a read-only file system, so the run will fail with:

```
OSError: [Errno 30] Read-only file system: './ubiquitin_test-Dyna1.csv'
```

This error is expected on the build node — the job runs successfully up to the point where it tries to write output. 

Copy your .sif file to your staging dir:

```
cp dyna1.sif /staging/myusername/
```

## Running

Fill in your HuggingFace token in `run.sub`

If running on existing PDBs: `pdb_list.txt` with one 4-letter code per line:

```
1UBQ
2KGF
8UBH
```

Note: `run.sh` hardcodes `--chain A`. If any of your PDBs use a different chain, you'd need to adjust (e.g. make it a second column in the list)

Then submit:

```
condor_submit run.sub
```

Each PDB becomes its own job, and the output CSV and PDB files transfer back when each job finishes.
