#!/bin/bash
#TOMCAT_USER=${TOMCAT_USER:-tetra}
#TOMCAT_PASS=${TOMCAT_PASS:-$(pwgen -s 128 1)}
TOMCAT_USER=${TOMCAT_USER:-tomcat}
TOMCAT_PASS=${TOMCAT_PASS:-tomcat}

MAX_UPLOAD_SIZE=${MAX_UPLOAD_SIZE:-52428800}
EXPOSE_PORT=${EXPOSE_PORT:-8088}
CATALINA_OPTS=${CATALINA_OPTS:-"-Djava.net.preferIPv4Stack=true -Dfile.encoding=UTF-8 -Xms256m -Xmx3000m -XX:PermSize=256m -XX:MaxPermSize=512m -Djava.security.egd=file:/dev/./urandom"}

echo "* Tomcat EXPOSE_PORT: $EXPOSE_PORT"
echo "* Tomcat TOMCAT_USER: $TOMCAT_USER"
echo "* Tomcat TOMCAT_PASS: $TOMCAT_PASS"

export CATALINA_OPTS="${CATALINA_OPTS}"

cat << EOF > $CATALINA_BASE/conf/tomcat-users.xml
<?xml version='1.0' encoding='utf-8'?>
<tomcat-users>
	<user username="${TOMCAT_USER}" password="${TOMCAT_PASS}" roles="admin-gui,manager-gui,tomcat,manager-script"/>
</tomcat-users>
EOF

if [ -f "$CATALINA_BASE/webapps/manager/WEB-INF/web.xml" ]
then
	sed -i "s#.*max-file-size.*#\t<max-file-size>${MAX_UPLOAD_SIZE}</max-file-size>#g" $CATALINA_BASE/webapps/manager/WEB-INF/web.xml
	sed -i "s#.*max-request-size.*#\t<max-request-size>${MAX_UPLOAD_SIZE}</max-request-size>#g" $CATALINA_BASE/webapps/manager/WEB-INF/web.xml
fi

if [ -f "$CATALINA_BASE/conf/server.xml" ]
then
	sed -i "s#port=\"8080\"#port=\"$EXPOSE_PORT\"#g" $CATALINA_BASE/conf/server.xml
fi

exec $CATALINA_BASE/bin/catalina.sh run
