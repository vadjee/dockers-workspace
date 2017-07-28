FROM java:7-jre
MAINTAINER Vadym Shapka <vadym.shapka@gmail.com>
COPY jboss-fuse/jboss-fuse-6.1.0.redhat-379 /opt/fuse
RUN ( apt-get update && \
apt-get install pwgen vim gedit locate lnav mc -y && \
apt-get clean && \
updatedb )
