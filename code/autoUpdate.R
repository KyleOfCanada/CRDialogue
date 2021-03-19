library(here)

reticulate::py_run_file(here('data', 'tojson.py'))
source(here('code', 'wrangleData.R')) 
1 # to select google account to read in critrolestats tables
runC2Guests <- FALSE # set to TRUE to run code for guests in C2
source(here('code', 'wordCloudsC2.R'))
source(here('code', 'sentiments.R'))
rmarkdown::render(here('docs', 'wordCloudsC2.Rmd'))
rmarkdown::render(here('docs', 'sentiments.Rmd'))
rmarkdown::render(here('README.Rmd'))