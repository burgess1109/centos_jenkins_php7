#The Base Images
FROM centos:latest

MAINTAINER Burgess Chen <loveshe76119@gmail.com>

ENV SSH_PASSWORD=test123
ENV JENKINS_HOME=/var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT=50000

RUN yum -y update

#install base tools
RUN yum -y install dos2unix net-tools vixie-cron crontabs telnet screen wget unzip tar vim

#install ssh service
RUN yum -y install openssh-server passwd
RUN echo "${SSH_PASSWORD}" | passwd "root" --stdin


#install java
RUN yum -y install java-1.8.0-openjdk
RUN echo "#set java environment" >> /etc/profile && \
	echo "JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.75.x86_64" >> /etc/profile && \
	echo "JRE_HOME=$JAVA_HOME/jre" >> /etc/profile && \
	echo "CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib" >> /etc/profile && \
	echo "PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin" >> /etc/profile && \
	echo "export JAVA_HOME JRE_HOME CLASS_PATH PATH " >> /etc/profile
RUN source /etc/profile

#install Jenkins (rpm from http://mirrors.jenkins-ci.org/redhat/)
ARG JENKINS_VERSION

RUN yum -y install git curl curl-devel
RUN wget -c http://mirrors.jenkins-ci.org/redhat/jenkins-${JENKINS_VERSION:-2.57}-1.1.noarch.rpm
RUN rpm -ivh jenkins-${JENKINS_VERSION:-2.57}-1.1.noarch.rpm

#install php 7.1
RUN yum -y install yum-utils
RUN wget -q http://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN wget -q https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh epel-release-latest-7.noarch.rpm
RUN rpm -Uvh remi-release-7.rpm
RUN yum-config-manager –enable remi-php71

RUN yum -y install php php-fpm php-mbstring php-xml php-mysql php-pdo php-gd php-pecl-imagick php-opcache php-pecl-memcache php-pecl-xdebug php-ldap php-odbc php-pear php-xmlrpc php-snmp php-soap php-mcrypt

#PHPUnit
RUN wget https://phar.phpunit.de/phpunit.phar
RUN chmod +x phpunit.phar
RUN mv phpunit.phar /usr/local/bin/phpunit


#set soft link of jenkins_home
RUN mkdir -p /var/jenkins_home/sysconfig
RUN ln -s /etc/sysconfig/jenkins /var/jenkins_home/sysconfig/jenkins

RUN mkdir -p /var/jenkins_home/logs
RUN ln -s /var/log/jenkins/ /var/jenkins_home/logs

#ssh
EXPOSE 22

#jenkins web interface
EXPOSE 8080

#slave agents
EXPOSE 50000

#Set Valume
VOLUME /var/jenkins_home

#Copy init-bashrc.sh to Images
COPY init-bashrc.sh /init-bashrc.sh
RUN dos2unix /init-bashrc.sh
RUN /usr/sbin/sshd-keygen -A


# Create Base Enter Cont Command
RUN chmod 755 /init-bashrc.sh && echo "/init-bashrc.sh" >> /root/.bashrc && \
    echo 'export PATH="/root/.composer/vendor/bin:$PATH"' >> /root/.bashrc


# Start run shell
CMD ["bash"]

