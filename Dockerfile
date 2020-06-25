FROM ashish1981/s390x-rbase-rjava-rplumber
MAINTAINER Docker User <docker@user.org>


RUN R -e "install.packages(c('httr', 'jsonlite','stringr','DBI','RJDBC'), repos='http://cran.rstudio.com/')"

COPY /app /srv/

CMD ["/srv/myRapiv4.R"]
