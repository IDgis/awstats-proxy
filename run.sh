#!/bin/bash

all_environment_values() {
    ( set -o posix ; set ) \
        | grep $1 \
        | cut -d = -f 2
}

for DOMAIN in $(all_environment_values AWSTATS_CONF_DOMAIN); do
    export DOMAIN=$DOMAIN
    envsubst < /etc/awstats/awstats.conf.template > /etc/awstats/awstats.$DOMAIN.conf
done

service apache2 start

while [ true ];
do
    for DOMAIN in $(all_environment_values AWSTATS_CONF_DOMAIN); do
        /usr/bin/perl /usr/lib/cgi-bin/awstats.pl -config=$DOMAIN -update
    done
    sleep 600
done
