FROM ashish1981/rjava-plumber-ashish
MAINTAINER Docker User <docker@user.org>


RUN R -e "install.packages(c('httr', 'jsonlite','stringr','DBI','RJDBC'), repos='http://cran.rstudio.com/')"

COPY /app /srv/

CMD ["/srv/myRapiv3.R"]
