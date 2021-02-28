FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends build-essential r-base r-cran-randomforest python3.6 python3-pip python3-setuptools python3-dev

COPY requirements.txt /requirements.txt

RUN pip3 install -r requirements.txt

RUN Rscript -e "install.packages('renv')"

RUN Rscript -e "renv::restore()"