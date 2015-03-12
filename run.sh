#!/usr/bin/env bash

set -e

echo "${minion_id}" > /etc/salt/minion_id

/usr/bin/salt-master -d --log-file=/var/log/salt-master.log --log-file-level=info
/usr/bin/salt-minion -d --log-file=/var/log/salt-minion.log --log-file-level=info

tail -f /var/log/salt-master.log /var/log/salt-minion.log
