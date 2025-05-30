# From the Notebook to the Cluster 
## Single Submit

### A step-by-step guide to submit your analysis to CHTCH's HTC cluster

This workflow helps you submit an analysis contained within a qmd/Rmd files to CHTC's HTC submit notes. This is the first iteration of this workflow. It will guide you through the *simplest* type of job submission you can do, i.e., you will submit a single job. 


### What you have to have in place for this workflow to work

This workflow assumes the following:

- Your analysis is contained inside a Quarto file called `analysis.qmd`.
- `analysis.qmd` does two things: it calculates measures tendency and it renders a plot for the data contained in `data.csv`.
- `analysis.qmd` is contained inside an R project.
- The R projects uses the `renv` package to manage package dependencies. There is a `renv.lock` inside the project that enumerates packages and their dependencies.
- `Docker` is running on the local machine.
- The person using the workflow has a valid NetID.
- The person using the workflow has an associated repo on UW-Madison's GitLab instance. The repo has the `Container Registry` function enabled.
- The person has a CHTC account.

### The workflow step by step

1. Start with `analysis.qmd`
2. Generate `analysis.R`
3. Generate Dockerfile with current `R` version and `renv.lock` specifications
4. Build container image
5. Push container image to `registry.doit.wisc.edu`
6. Generate submit file with vanilla specifications
7. Generate executable file
8. Copy `analysis.R`, `data.csv`, `analysis.sub`, and `analysis.sh` over to CHTC
9. User needs to log in to CHTC submit server and run `condor_submit analysis.sub`
10. Copy the output files back into the local machine

