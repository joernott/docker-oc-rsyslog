#!/bin/bash
set -e

docker build -t registry.ott-consult.de/oc/rsyslog:latest .
docker push registry.ott-consult.de/oc/rsyslog:latest
