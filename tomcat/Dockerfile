FROM java:8-jre
MAINTAINER Vadym Shapka <vadym.shapka@gmail.com>

ENV TOMCAT_VERSION 7.0.79
ENV CATALINA_BASE /opt/tomcat
RUN (apt-get update && \
  apt-get install -y pwgen locate htop vim gedit nmap mc lnav && \
  wget -O /tmp/tomcat7.tar.gz http://archive.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz && \
  cd /opt && \
  tar zxf /tmp/tomcat7.tar.gz && \
  mv /opt/apache-tomcat* $CATALINA_BASE && \
  groupadd -g 9000 tomcat && \
  useradd -d $CATALINA_BASE -r -s /bin/false -g 9000 -u 9000 tomcat && \
  chown -R tomcat:tomcat /opt/tomcat && \
  chown -R tomcat:tomcat /etc/ssl/certs/java/cacerts && \
  rm /tmp/tomcat7.tar.gz && \
  rm -rf $CATALINA_BASE/webapps/docs && \
  rm -rf $CATALINA_BASE/webapps/examples && \
  updatedb)
ADD tomcat/run.sh /usr/local/bin/run
EXPOSE 8088
USER root
CMD ["/usr/local/bin/run"]
