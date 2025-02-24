#!/bin/bash

mkdir results-folder
Rscript analysis.R
tar -czf analysis-results.tar.gz results-folder
