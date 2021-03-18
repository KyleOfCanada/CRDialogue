library(reticulate)
library(rmarkdown)
library(here)

py_run_file(here('data', 'tojson.py'))
source(here('code', 'wrangleData.R')) # will likely need to select google account
source(here('code', 'wordClouds.R'))
source(here('code', 'sentiments.R'))
render(here('docs', 'wordCloudsC2.Rmd'))
render(here('docs', 'sentiments.Rmd'))
render(here('README.Rmd'))
