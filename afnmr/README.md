#AF-NMR: chemical shift predictor from structure based on quantum chemistry

This apptainer contains code to reproduce running afnmr with simplest options (i.e., `afnmr 1UBQ.pdb`).

The publicly-available apptainer is hosted at `oras://ghcr.io/hwaymentsteele/afnmr:0.1`.

Re-build apptainer: `apptainer build afnmr.sif afnmr.def` (on CHTC, get interactive job using `condor_submit -i build.sub`)

Run afnmr on CHTC: `condor_submit afnmr.sub`, ensuring `run_afnmr.sh` is in the same dir unless you've modified to account for that.


