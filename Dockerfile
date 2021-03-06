FROM node:current-buster-slim
WORKDIR /opt/elasticsearch/es-sql-site-standalone/site-server
RUN rm -f /etc/apt/sources.list \
&&echo "deb http://mirrors.163.com/debian/ buster main non-free contrib" >/etc/apt/sources.list \
&&echo "deb http://mirrors.163.com/debian/ buster-proposed-updates main non-free contrib" >>/etc/apt/sources.list \
&&echo "deb-src http://mirrors.163.com/debian/ buster main non-free contrib" >>/etc/apt/sources.list \
&&echo "deb-src http://mirrors.163.com/debian/ buster-proposed-updates main non-free contrib" >>/etc/apt/sources.list \
&&apt-get clean \
&&apt-get update \
&&apt-get install -y wget unzip\
&&cd /opt/elasticsearch/es-sql-site-standalone \
&& wget https://github.com/NLPchina/elasticsearch-sql/releases/download/5.4.1.0/es-sql-site-standalone.zip \
&& unzip es-sql-site-standalone.zip \
&& rm -f es-sql-site-standalone.zip \
&& cd /opt/elasticsearch/es-sql-site-standalone/site-server \
&& npm config set registry "http://registry.npm.taobao.org/" \
&& npm install express --save
EXPOSE 8080
CMD node /opt/elasticsearch/es-sql-site-standalone/site-server/node-server.js
