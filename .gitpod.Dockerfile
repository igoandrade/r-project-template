FROM gitpod/workspace-full:latest


# Install R
USER root
RUN apt-get update && apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev pandoc texlive r-base r-base-dev
RUN pip3 install -U radian
RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e requirements.R

