FROM gitpod/workspace-full:latest


# Install R
USER root
RUN apt-get update && apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev pandoc texlive r-base r-base-dev
RUN pip3 install -U radian
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('caret')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('HSAUR')"
RUN Rscript -e "install.packages('purrr')"
RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('markdown')"
RUN Rscript -e "install.packages('stringr')"
RUN Rscript -e "install.packages('lubridate')"
RUN Rscript -e "install.packages('tidyverse')"
RUN Rscript -e "install.packages('tidyquant')"
RUN Rscript -e "install.packages('tidyr')"
RUN Rscript -e "install.packages('magrittr')"
RUN Rscript -e "install.packages('data.table')"
RUN Rscript -e "install.packages('scales')"
RUN Rscript -e "install.packages('timetk')"
RUN Rscript -e "install.packages('tibbletime')"
RUN Rscript -e "install.packages('PerformanceAnalytics')"