#!/bin/bash

set -e

if test -z "$PUBLIC_KEY"
then
  echo "PUBLIC_KEY variable is empty, skip SSH public key setting!"
else  
  echo "$PUBLIC_KEY" > /root/.ssh/authorized_keys
  echo "SSH public key setup completed!"
fi

exec /usr/sbin/sshd -e -D
