FROM gitpod/workspace-full:latest


# Install R
USER root
RUN apt-get update && apt-get install -y libcurl4-openssl-dev libssl-dev libxml2-dev pandoc texlive r-base r-base-dev
