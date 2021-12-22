This repo demonstrates an issue or misunderstanding with nextflow workflows.

The workflow in main.nf runs an imported workflow three times, with inputs `inputs/a`, `inputs/b`, and `inputs/c`

Each instance of the workflow is applied to a single input, i.e. `inputs/a`. I would expect each process called by `foo` to be given the same input (since that is exactly how it is defined in the workflow). However when `p3` executes, taking `p1.out` and `p2.out` as inputs, it receives inputs from different instances of the `foo` workflow. 

I.e. one instance of foo is given `inputs/a`, but calls `p3` with some random combination of `inputs/a`, `inputs/b`, and `inputs/c`. 

The instance of foo called with `inputs/a` as input should never have access to the files `inputs/b` or `inputs/c`

To see it in action, run `nextflow run main.nf` multiple times and check the contents of the workdir for p3. The subdirs `output_p3/output_p1` and `output_p3/output_p2` should both contain the same file - `a`, `b` or `c`. Instead there is a random combination that changes each time nextflow runs.
