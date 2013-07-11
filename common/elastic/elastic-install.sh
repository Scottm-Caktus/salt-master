#!/bin/bash

cd /opt
#Download elastic search
if [ ! -d ./elasticsearch-0.90.2.tar.gz]
then
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.2.tar.gz
    tar xvzf elasticsearch-0.90.2.tar.gz
    rm elasticsearch-0.90.2.tar.gz
    sudo ln -s elasticsearch-*/ elasticsearch
fi

#Download ElasticSearch wrapper and move into place (used to run ES as a daemon)

curl -k -L http://github.com/elasticsearch/elasticsearch-servicewrapper/tarball/master | tar -xz
mv *servicewrapper*/service elasticsearch/bin/
rm -Rf *servicewrapper*

#Install ElasticSearch
/opt/elasticsearch/bin/service/elasticsearch install
sudo ln -s `readlink -f elasticsearch/bin/service/elasticsearch` /usr/bin/elasticsearch_ctl

#Create the ElasticSearch cluster
sed -i -e 's|# cluster.name: elasticsearch|cluster.name: graylog2|' /opt/elasticsearch/config/elasticsearch.yml

sudo ln -s /opt/elasticsearch-0.90.0/bin/service/elasticsearch /etc/init.d/elasticsearch

#update-rc.d?
