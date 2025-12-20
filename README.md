# Publicly-available apptainers

Last updated Dec 2025

Hannah's general recipe for building an apptainer and pushing it to get hosted publicly.

(Bare bones instructions, details to be filled in)

1. Build the apptainer:

get an interactive job on chtc with `condor_submit -i build.sub`. Modify `build.sub` to upload with it a .def file if you have it locally, if you want to.

Build with `apptainer build <my>.sif <my>.def`.

2. Push the apptainer to ORAS.

You'll need to set up a PAT at your github to allow pushing to ORAS.
`apptainer remote login --username hwaymentsteele oras://ghcr.io`

3. Go to github and change visibility from private to public.
