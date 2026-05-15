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

## Known Issues

### Read-only file system error

The build node has a read-only file system, so the run will fail with:

```
OSError: [Errno 30] Read-only file system: './ubiquitin_test-Dyna1.csv'
```

This error is expected on the build node — the job runs successfully up to the point where it tries to write output. To get full output, run on a node with a writable file system, or bind-mount a writable directory:

```bash
apptainer run --bind /path/to/writable/dir:/output --env HF_TOKEN=$HF_TOKEN dyna1.sif dyna1.py \
  --pdb 1UBQ \
  --chain A \
  --name ubiquitin_test \
  --use_pdb_seq
```
