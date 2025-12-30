FROM rocker/tidyverse

RUN apt-get update && \
    apt-get install -y \
        libudunits2-dev \
        libgdal-dev \
        libgeos-dev \
        libproj-dev

RUN sed -i '/es_ES.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen es_ES.UTF-8

ADD . /project
WORKDIR /project

RUN R -e "install.packages(c( \
      'kableExtra', \
      'ggridges', \
      'janitor', \
      'mapSpain', \
      'fuzzyjoin' \
      'ggdist', \
    ))"

CMD ["./render.sh"]
