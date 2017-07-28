FROM java:8-jre
MAINTAINER Vadym Shapka <vadym.shapka@gmail.com>

ENV LIBREOFFICE_PORT 8100
ENV LIBREOFFICE_HOME /opt/libreoffice
ENV LIBREOFFICE_VERSION 4.4.7.2

RUN ( wget -O /tmp/libreoffice.tar.gz https://downloadarchive.documentfoundation.org/libreoffice/old/${LIBREOFFICE_VERSION}/deb/x86_64/LibreOffice_${LIBREOFFICE_VERSION}_Linux_x86-64_deb.tar.gz && \
  cd /tmp && \
  tar zxf /tmp/libreoffice.tar.gz && \
  groupadd -g 9000 libreoffice && \
  useradd -d $LIBREOFFICE_HOME -r -s /bin/false -g 9000 -u 9000 libreoffice && \
  chown -R libreoffice:libreoffice /opt && \
  chown -R libreoffice:libreoffice /etc/ssl/certs/java/cacerts && \
  rm /tmp/libreoffice.tar.gz && \
  apt update && \
  apt upgrade -y && \
  apt install -y libglu1-mesa libxinerama1 libdbus-glib-1-2 locate && \
  dpkg -i /tmp/LibreOffice_4.4.7.2_Linux_x86-64_deb/DEBS/*.deb && \
  mv /opt/libreoffice4.4/ $LIBREOFFICE_HOME && \
  chown -R libreoffice:libreoffice $LIBREOFFICE_HOME && \
  updatedb && \
  rm -rf /var/log/*.log /var/log/apt/*.log /var/lib/apt/lists/* )
EXPOSE 8100
USER libreoffice
ADD libreoffice/run.sh /usr/local/bin/office
CMD ["/usr/local/bin/office"]
