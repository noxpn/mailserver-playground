#!/bin/bash

# FILE=/etc/dovecot/dh.pem

# if [ -f "$FILE" ]; then
#     echo "$FILE exists."
    
# else 
#     echo "$FILE does not exist. Generating..."
#     openssl dhparam -out /etc/dovecot/dh.pem 4096
# fi

# /usr/bin/tini -- /usr/sbin/dovecot -F
/usr/sbin/dovecot -F
# sleep 36000
