FROM centos:7

ENV ES_PKG_NAME elasticsearch-1.5.0

RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm"

RUN yum update -y

RUN rpm -ivh jdk-8u45-linux-x64.rpm


RUN yum install vim net-tools wget logstash -y



# Install Elasticsearch.
RUN \
  cd / && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch

#RUN wget https://download.elastic.co/kibana/kibana/kibana-4.5.3-linux-x64.tar.gz && \
#    tar -zxvf kibana-4.5.3-linux-x64.tar.gz && \
#    rm kibana-4.5.3-linux-x64.tar.gz

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml
ADD config/kibana.repo /etc/yum.repos.d/kibana.repo
ADD config/logstash.repo /etc/yum.repos.d/logstash.repo

RUN yum -y install logstash kibana


# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
