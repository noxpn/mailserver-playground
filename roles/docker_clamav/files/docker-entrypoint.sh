#!/bin/bash

if [ ! -s /var/lib/clamav/main.cvd  ];then
    /usr/bin/freshclam
fi

/etc/init.d/clamsmtp start

while [ 1 ]; do
  /usr/local/sbin/clamav-unofficial-sigs.sh -s 1>/dev/null
  sleep 3600
done &

/usr/bin/freshclam -d --check 24
exec /usr/sbin/clamd --foreground=true


