#!/bin/bash

if [ -d "/var/jenkins_home/log" ]; then
	echo "/var/jenkins_home/log exists"
else
	mkdir -p /var/jenkins_home/log
fi

if [ -d "/var/jenkins_home/lib" ]; then
	echo "/var/jenkins_home/lib exists"
else
	mkdir -p /var/jenkins_home/lib
fi

if [ -d "/var/jenkins_home/sysconfig" ]; then
	echo "/var/jenkins_home/sysconfig exists"
else
	mkdir -p /var/jenkins_home/sysconfig
fi

chmod 755 -R /var/jenkins_home


if [ -f "/var/jenkins_home/sysconfig/jenkins" ]; then
	# Copy local jenkins config to docker
	yes | cp -rf /var/jenkins_home/sysconfig/jenkins /etc/sysconfig/jenkins
else
	# Copy docker jenkins config to local
	yes | cp -rf /etc/sysconfig/jenkins /var/jenkins_home/sysconfig/jenkins 
fi

# start server
/usr/sbin/sshd-keygen -A

/usr/sbin/sshd

/etc/init.d/jenkins start
	 
# Cpoy docker jenkins log & lib to local
yes | cp -rf /var/log/jenkins/* /var/jenkins_home/log/
yes | cp -rf /var/lib/jenkins/* /var/jenkins_home/lib/
