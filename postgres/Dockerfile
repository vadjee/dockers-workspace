FROM postgres:9.6.3
MAINTAINER Vadym Shapka <vadym.shapka@gmail.com>
RUN ( apt-get update && \
apt-get install vim gedit locate mc lnav -y && \
apt-get clean && \
updatedb )
