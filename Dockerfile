FROM node

WORKDIR /opt/elasticsearch/es-sql-site-standalone/site-server

RUN cd /opt/elasticsearch/es-sql-site-standalone \
&& wget https://github.com/NLPchina/elasticsearch-sql/releases/download/5.4.1.0/es-sql-site-standalone.zip \
&& unzip es-sql-site-standalone.zip \
&& rm -f es-sql-site-standalone.zip \
&& cd /armstrong/elasticsearch/es-sql-site-standalone/site-server \
&& npm config set registry "http://registry.npm.taobao.org/" \
&& npm install express --save

EXPOSE 8080
CMD node /opt/elasticsearch/es-sql-site-standalone/site-server/node-server.js
