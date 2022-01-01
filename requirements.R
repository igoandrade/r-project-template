# Package names
packages <- c("ggplot2", "readxl", "dplyr", "tidyr", "caret", "data.table", "mlr3", "knitr", "plotly", "shiny", "tidyr", "car", "tidyverse", "tidyquant", "xgboost", "markdown", "MASS",  "magrittr")

# Install packages not yet installed
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])
}
