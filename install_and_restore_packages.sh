#Install renv and restore dependencies
#'https://cloud.r-projects.org/'
RUN R -e "install.packages('renv', repos='https://packagemanager.posit.co/cran/latest')"
RUN R -e "renv::restore()"


