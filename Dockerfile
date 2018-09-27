FROM ubuntu:18.04

# Install software
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        apache2 \
        awstats \
        gettext && \
    rm -rf /var/lib/apt/lists/*

COPY awstats.conf.template /etc/awstats
COPY run.sh /

RUN chmod a+x /run.sh
RUN a2enmod cgi

EXPOSE 80

CMD ["/run.sh"]
