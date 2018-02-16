# Docker image: CentOS 7 with rsyslog server
Running a central loghost as docker container.

This container provides rsyslog listening on port 514 (TCP and UDP) and logrotate. Logrotate must be triggered from the outside (see example)

## Usage:
```
docker run -d -p 514:514 -p 514:514/udp \
    -v /data/rsyslog/var/log:/var/log \
    -v /data/rsyslog/etc/rsyslog.d:/etc/rsyslog.d \
    -v /data/rsyslog/etc/logrotate.d:/etc/logrotate.d \
    registry.ott-consult.de/oc/rsyslog:latest
```
