#!/bin/bash

# Setting SSH Password By ENV
#echo "${SSH_PASSWORD}" | passwd "root" --stdin

# start server
/usr/sbin/sshd-keygen -A

/usr/sbin/sshd

/etc/init.d/jenkins start
	 


