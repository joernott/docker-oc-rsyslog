#!/bin/bash
set -e
set -x
chmod a+rwx /tmp
source /tmp/install/functions.sh

install_software rsyslog
sed -i /etc/rsyslog.conf \
    -e 's|#$ModLoad imudp|$ModLoad imudp|' -e 's|#$UDPServerRun 514|$UDPServerRun 514|' \
    -e 's|#$ModLoad imtcp|$ModLoad imtcp|' -e 's|#$InputTCPServerRun 514|$InputTCPServerRun 514|'

cleanup
