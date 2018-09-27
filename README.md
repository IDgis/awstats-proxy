# awstats-proxy
Docker image for awstats with conf for multiple domains

## Awstats
Om awstats met meerdere site te configureren kun je dit met omgevingsvariabelen ``AWSTATS_CONF_DOMAIN_[0-9]`` opgeven in de docker-compose file.

Bijvoorbeeld:
```
services:
  awstats:
    image: idgis/awstats-proxy
    restart: always
    environment:
      LOG_FILE_LOCATION: /var/log/nginx
      AWSTATS_CONF_DOMAIN_0: "www.idgis.nl"
      AWSTATS_CONF_DOMAIN_1: "www.test.nl"
    volumes:
      - nginx_logs:/var/log/nginx
      - awstats_result:/usr/lib/cgi-bin
```
