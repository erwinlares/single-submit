FROM rocker/r-ver:4.4.2
WORKDIR /home
COPY renv.lock /home/renv.lock
COPY renv/library /home/app/renv/library
#Install renv and restore dependencies
#'https://cloud.r-projects.org/'
RUN R -e "install.packages('renv', repos='https://packagemanager.posit.co/cran/latest')"
RUN R -e "renv::restore()"


