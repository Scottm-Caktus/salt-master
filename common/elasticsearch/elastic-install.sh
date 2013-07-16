#!/bin/bash

cd /opt/graylog2
#Download elastic search
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.2.tar.gz
tar xvzf elasticsearch-0.90.2.tar.gz
rm elasticsearch-0.90.2.tar.gz
sudo ln -s elasticsearch-*/ elasticsearch


#Download ElasticSearch wrapper and move into place (used to run ES as a daemon)

curl -k -L http://github.com/elasticsearch/elasticsearch-servicewrapper/tarball/master | tar -xz
mv *servicewrapper*/service elasticsearch/bin/
rm -Rf *servicewrapper*

#Install ElasticSearch
sudo /opt/graylog2/elasticsearch/bin/service/elasticsearch install
sudo ln -s `readlink -f elasticsearch/bin/service/elasticsearch` /usr/bin/elasticsearch_ctl

#Create the ElasticSearch cluster
sed -i -e 's|# cluster.name: elasticsearch|cluster.name: graylog2|' /opt/graylog2/elasticsearch/config/elasticsearch.yml

#sudo ln -s /opt/graylog2/elasticsearch-0.90.0/bin/service/elasticsearch /etc/init.d/elasticsearch

#update-rc.d?
