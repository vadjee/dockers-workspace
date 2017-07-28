JBoss-Fuse docker container
=====

Build jboss-fuse container
-----
```sh
docker build -f jboss-fuse/Dockerfile . -t vadjee/jboss-fuse:6.1.0.redhat.379-jre7
docker push vadjee/jboss-fuse:6.1.0.redhat.379-jre7
docker tag vadjee/jboss-fuse:latest vadjee/jboss-fuse:6.1.0.redhat.379-jre7
```

Run server
-----
```sh
docker run -it --name jboss-fuse -p 8080:8080 -p 8181:8181 -v /${path_to_conf}/confname.cfg:/opt/fuse/etc/confname.cfg -v /home/.../.m2:/home/.../.m2 -e FUSE_USER=fuse -e FUSE_PASS=fuse --net=host /opt/fuse/bin/fuse debug
```

Logs on server
-----
```sh
ls /opt/fuse/data/log/
lnav /opt/fuse/data/log/fuse.log
```

