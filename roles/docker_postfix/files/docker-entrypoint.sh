#!/bin/bash

FILE=/var/spool/postfix/etc/resolv.conf

if [ -f "$FILE" ]; then
    echo "$(date):> $FILE exists. Process normal start."
    
else 
    echo "$(date):> $FILE does not exist. making postfix chroot workaround"
    /etc/init.d/postfix start
    /etc/init.d/postfix stop
fi
echo "$(date):> Postmap acls."
/usr/sbin/postmap /etc/postfix/acl/acl_spamlist
/usr/sbin/postmap /etc/postfix/acl/acl_whitelist_helo
/usr/sbin/postmap /etc/postfix/acl/acl_whitelist_sender
/usr/sbin/postmap /etc/postfix/acl/acl_whitelist_client

/usr/sbin/postfix -c /etc/postfix start-fg
# sleep 360000