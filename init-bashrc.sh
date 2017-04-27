#!/bin/bash

# Setting SSH Password By ENV
echo "${SSH_PASSWORD}" | passwd "root" --stdin

# start server
/usr/sbin/sshd-keygen -A

/usr/sbin/sshd

/etc/init.d/jenkins start

#for SERVICE in sshd
#do
#    if ! (ps ax | grep -v grep | grep $SERVICE > /dev/null)
#    then
#       service $SERVICE start;
#    fi
#done
	 


