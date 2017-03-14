#!/bin/bash


# Replace variable in conffile

/bin/nsLookupConfUpdator elasticsearch /opt/elasticsearch/config/elasticsearch.yml.tpl /bin/docker-entrypoint.sh $*
