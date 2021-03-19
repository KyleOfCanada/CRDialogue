library(reticulate)
library(rmarkdown)
library(here)

py_run_file(here('data', 'tojson.py'))
source(here('code', 'wrangleData.R')) 
1 # to select google account to read in critrolestats tables
source(here('code', 'wordCloudsC2.R'))
source(here('code', 'sentiments.R'))
render(here('docs', 'wordCloudsC2.Rmd'))
render(here('docs', 'sentiments.Rmd'))
render(here('README.Rmd'))
