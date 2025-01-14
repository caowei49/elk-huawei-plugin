# **elk-huawei-plugin**

## **Overview**
the huawei plugin for elk to collect and process information from huawei devices

## **Installation**
### **Prerequisites**

- OS : Ubuntu, CentOS, Suse, Red Hat
- Java : 1.8 
- Python : 3.6
- Ruby :2.7


### Build From Source

1. new folder in dir /usr:
   ```
   cd /usr
   rm -rf elk
   mkdir elk
   ```
2. download elkfiles,then put these in dir /usr/elk:   
elasticsearch: https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.5.0.tar.gz  
logstash: https://artifacts.elastic.co/downloads/logstash/logstash-5.5.0.tar.gz  
kibana: https://artifacts.elastic.co/downloads/kibana/kibana-5.5.0-linux-x86_64.tar.gz  
Platform-0.4.2.gem: https://rubygems.org/downloads/Platform-0.4.2.gem  
protoc-2.6.1.gem: https://rubygems.org/downloads/protoc-2.6.1.gem  
ruby-protocol-buffers-1.6.1.gem: https://rubygems.org/downloads/ruby-protocol-buffers-1.6.1.gem    
google-protobuf-3.5.0.pre-java.gem: https://rubygems.org/downloads/google-protobuf-3.5.0.pre-java.gem  
glibc-2.14.tar.gz: https://ftp.gnu.org/gnu/libc/glibc-2.14.tar.gz  
grpcio-1.4.0-cp36-cp36m-manylinux1_x86_64.whl: https://files.pythonhosted.org/packages/2a/91/d82cba0a0f725d59c18641d58a5f3b41e930dfb007e8ca20756370c7d3cc/grpcio-1.4.0-cp36-cp36m-manylinux1_x86_64.whl  
grpcio-1.4.0-cp35-cp35m-manylinux1_x86_64.whl: https://files.pythonhosted.org/packages/9f/60/5f882f38e4a2a1d557d0d9f7e1d57db53c0b2f26ad04aa3de364a7a8c5ec/grpcio-1.33.1-cp35-cp35m-manylinux2010_x86_64.whl    
six-1.10.0-py2.py3-none-any.whl: https://files.pythonhosted.org/packages/c8/0a/b6723e1bc4c516cb687841499455a8505b44607ab535be01091c0f24f079/six-1.10.0-py2.py3-none-any.whl  
protobuf-3.3.0.tar.gz: https://files.pythonhosted.org/packages/56/28/6263d846f60dad93939fd3a22d712d6bae3bf3484332d22bd5933dec8c99/protobuf-3.3.0.tar.gz  
logstash-codec-bigmuddy-network-telemetry-gpb-master.zip: https://github.com/HuaweiDatacomm/elk-plugin/blob/668472c7b37b1b69a56aaca24d8a110d682b4196/open_source/logstash-codec-bigmuddy-network-telemetry-gpb-master.zip  
logstash-input-unix-master.zip: https://github.com/HuaweiDatacomm/elk-plugin/blob/668472c7b37b1b69a56aaca24d8a110d682b4196/open_source/logstash-input-unix-master.zip  


4. extract elk:
   ```
   cd /usr/elk
   tar -zxvf elasticsearch-5.5.0.tar.gz
   tar -zxvf logstash-5.5.0.tar.gz
   tar -zxvf kibana-5.5.0-linux-x86_64.tar.gz
   ```
5. install gems:
   ```
   cd /usr/elk
   vim /etc/profile
   export GEM_HOME=/usr/elk/logstash-5.5.0/vendor/bundle/jruby/1.9/
   export PATH=$GEM_HOME:$PATH
   source /etc/profile
   gem install Platform-0.4.2.gem
   gem install protoc-2.6.1.gem
   gem install ruby-protocol-buffers-1.6.1.gem
   mv google-protobuf-3.5.0.pre-java.gem google-protobuf-3.5.0.pre.gem
   gem install google-protobuf-3.5.0.pre.gem
   ruby-protoc -v
   ```
6. clone elk-huawei-plugin:
   ```
   git clone https://github.com/HuaweiDatacomm/elk-huawei-plugin.git
   ```
7. install elk-huawei-plugin(warning: run install.sh only once):
   ```
   cd /elk-huawei-plugin
   chmod +x install.sh
   ./install.sh
   ```
8. put protos in dir elk-huawei-plugin and transfer protos,then generate the file of proto, put these in dir /usr/elk/logstash-5.5.0/huawei-test/protos  
   proto files:https://github.com/HuaweiDatacomm/proto
   ```
   cd /elk-huawei-plugin
   java -Dfile.encoding=utf-8 -jar proto3to2.jar *.proto
   ruby-protoc *.proto
   cp -f *.proto *.pb.rb /usr/elk/logstash-5.5.0/huawei-test/protos/
   ```
10. add elasticsearch's configuration(warning:pay attention to the spaces):
   ```
   cd /usr/elk/elasticsearch-5.5.0/config
   vim elasticsearch.yml
   network.host: 127.0.0.1
   http.port: 9200
   bootstrap.system_call_filter: false
   ```
11. add kibana's configuration(warning: pay attention to the spaces):
    ```
    cd /usr/elk/kibana-5.5.0-linux-x86_64/config
    vim kibana.yml
    server.port: "5601"
    server.host: "127.0.0.1"
    elasticsearch.url: "http://127.0.0.1:9200"
    ```
12. download grpcio and protobuf
    ```
    pip3 install grpcio
    pip3 install protobuf
    ```

## Getting Used
  
ELK is the acronym for three open-source projects: Elasticsearch, Logstash, and Kibana. 
The ELK tool is an open-source O&M tool and can be installed on multiple platforms, such as Linux . 
Details about Elasticsearch, Logstash, and Kibana are as follows:  
 - Elasticsearch is developed based on Java. It is a real-time full-text search and analytics engine and provides three functions: collection, analysis, and storage of data.  
 - Logstash is developed based on Ruby and is a tool for collecting, analyzing, and filtering data. It works based on plug-ins and does not have the capability to receive or 
convert telemetry data. Modules running on Logstash provide the capability to receive or convert telemetry data.
 - Kibana is a web-based graphical user interface (GUI) developed for search purposes. It can analyze and visualize data stored on Elasticsearch. It uses the REST interface of
Elasticsearch to retrieve data.  

1. start elasticsearch:
   ```
   groupadd elkgroup
   useradd elkuser -g elkgroup
   mkdir /home/elkuser
   chown -R elkuser:elkgroup /usr/elk/elasticsearch-5.5.0
   cd /usr/elk/elasticsearch-5.5.0/bin
   su elkuser
   ./elasticsearch
   ```
2. start kibana:
   ```
   cd /usr/elk/kibana-5.5.0-linux-x86_64/bin
   ./kibana
   ``` 
3. start logstash:
   ```
   cd /usr/elk/logstash-5.5.0
   rm -rf data
   cd /usr/elk/logstash-5.5.0/huawei-test
   touch UNIX.d
   cd /usr/elk/logstash-5.5.0/bin
   ./logstash -f ../huawei-test/unix_test.conf
   ```
4. modify HuaweiDialGrpc's config:
   ```
   cd HuaweiDialGrpc/conf
   vim config.json
   ####################elk-huawei-dialin#############################################
   ## username: device's name
   ## password: device's password
   ## sample_interval: sampling interval
   ## path: sampling path. such as "huawei-debug:debug/cpu-infos/cpu-info"
   ## depth: sampling depth
   ```
5. start HuaweiDialGrpc:
   ```
   cd /usr/elk/HuaweiDialGrpc
   python3 huawei_dialin_subcribe.py
   python3 huawei_dialout_server.py ip:port
   ```
6. use kibana
 - Open the browser and enter the following URL
   http://127.0.0.1:5601
 - Management => Index Patterns
 - Index name or pattern : logstash_* 
 - Time Filter field name : @timestamp
 - Create
 - Discover
   






