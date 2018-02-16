FROM registry.ott-consult.de/oc/base:latest
MAINTAINER Joern Ott <joern.ott@ott-consult.de>

ENV SYSLOGD_OPTIONS="" \
    GIT_COMMIT=x \
    IMAGE_HISTORY=""

COPY src /

RUN /tmp/install/oc-rsyslog.sh

EXPOSE 514
EXPOSE 514/udp
