## The latest Centos 7 & SSH Server & Jenkins & PHP

* Common packages : dos2unix,net-tools,vixie-cron,crontabs,telnet,screen,wget,unzip,tar,passwd,vim,git,curl
* openssh-server
* java-1.8.0-openjdk
* Jenkins 2.46.2
* PHP 7.1
* PHPUnit 6.1.2
* The size of the image is about 1.6G
* The default password of root is test123

## Centos7最新版本,基本套件及SSH Server

* 常用基本套件 : dos2unix,net-tools,vixie-cron,crontabs,telnet,screen,wget,unzip,tar,passwd,vim,git,curl
* openssh-server
* java-1.8.0-openjdk
* Jenkins 2.46.2
* PHP 7.1
* PHPUnit 6.1.2
* 映像檔大小約 1.6G
* root預設登入密碼為 test123


## Install

docker pull burgess/centos_jenkins_php7:latest

docker run -tid -p 8088:8080 -p 2022:22 -v ~/jenkins:/var/jenkins_home burgess/centos_jenkins_php7:latest bash
