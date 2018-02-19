#!/bin/bash
set -e
set -x
chmod a+rwx /tmp
source /tmp/install/functions.sh

install_software rsyslog logrotate

cat >/etc/rsyslog.conf <<EOF
# rsyslog configuration file

#### MODULES ####

\$ModLoad imuxsock # provides support for local system logging (e.g. via logger command)
\$ModLoad imjournal # provides access to the systemd journal
#\$ModLoad immark  # provides --MARK-- message capability

\$ModLoad imudp
\$UDPServerRun 514
\$ModLoad imtcp
\$InputTCPServerRun 514

#### GLOBAL DIRECTIVES ####
\$WorkDirectory /var/lib/rsyslog
\$ActionFileDefaultTemplate RSYSLOG_TraditionalFileFormat
#\$ActionFileEnableSync on
\$IncludeConfig /etc/rsyslog.d/*.conf
\$OmitLocalLogging on
\$IMJournalStateFile imjournal.state
\$CreateDirs on

#### RULES ####
\$template perHostMessages,"/var/log/%HOSTNAME%/messages"
*.info;mail.none;authpriv.none;cron.none -?perHostMessages

\$template perHostSecure,"/var/log/%HOSTNAME%/secure"
authpriv.* -?perHostSecure

\$template perHostMaillog,"/var/log/%HOSTNAME%/maillog"
mail.* -?perHostMaillog

\$template perHostCron,"/var/log/%HOSTNAME%/cron"
cron.* -?perHostCron

EOF
cleanup
