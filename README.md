## The latest Centos 7 & SSH Server & Jenkins & PHP & PHPUnit

* Common packages : dos2unix,net-tools,vixie-cron,crontabs,telnet,screen,wget,unzip,tar,passwd,vim,git,curl,ant
* openssh-server
* java-1.8.0-openjdk
* Jenkins 2.46.2
* PHP 7.1
* PHPUnit 6.1.2
* The size of the image is about 1.6G
* The default password of root is test123


## Install

1. Docker exec :

* docker pull burgess/centos_jenkins_php7:latest

* docker run -tid -p 8088:8080 -p 2022:22 -v ~/jenkins:/var/jenkins_home burgess/centos_jenkins_php7:latest bash


2. Kitematic :

* Search burgess/centos_jenkins_php7 and create it


## Volumes

* /var/jenkins_home/log : copy from inside the container directory '/var/log/jenkins/' when you enter or restart the container

* /var/jenkins_home/sysconfig/jenkins : jenkins config, you can modify it. '/etc/sysconfig/jenkins' would be replaced with '/var/jenkins_home/sysconfig/jenkins' when you enter or restart the container

* /var/jenkins_home/lib : copy from inside the container directory '/var/lib/jenkins/' when you enter or restart the container


---


## Centos7最新版本,基本套件及SSH Server & Jenkins & PHP & PHPUnit

* 常用基本套件 : dos2unix,net-tools,vixie-cron,crontabs,telnet,screen,wget,unzip,tar,passwd,vim,git,curl,ant
* openssh-server
* java-1.8.0-openjdk
* Jenkins 2.46.2
* PHP 7.1
* PHPUnit 6.1.2
* 映像檔大小約 1.6G
* root預設登入密碼為 test123


## 安裝

1. Docker 指令 :

* docker pull burgess/centos_jenkins_php7:latest

* docker run -tid -p 8088:8080 -p 2022:22 -v ~/jenkins:/var/jenkins_home burgess/centos_jenkins_php7:latest bash


2. 使用 Kitematic :

* 搜尋 burgess/centos_jenkins_php7 之後 CREATE


## Volumes

* /var/jenkins_home/log : 每當進入或重啟容器時, 將會複製容器內 /var/log/jenkins/ 目錄下的檔案

* /var/jenkins_home/sysconfig/jenkins : jenkins設定檔, 您可以修改它. 每當你進入或重啟容器時, /var/jenkins_home/sysconfig/jenkins 將取代容器內的 /etc/sysconfig/jenkins

* /var/jenkins_home/lib : 每當進入或重啟容器時, 將會複製容器內 /var/lib/jenkins/ 目錄下的檔案



