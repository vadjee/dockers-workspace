Docker Images
=====

Build container
-----
```sh
docker build -f dockerName/Dockerfile . -t vadjee/dockerName
docker push vadjee/dockerName:latest
docker tag vadjee/dockerName:latest vadjee/jboss-fuse:version
```

Run container
-----
```sh
docker run --rm --name dockerName -d vadjee/dockerName
docker run -it --name dockerName -d vadjee/dockerName
```

Run container with params
-----
```sh
docker run ... 
-e ${PARAM_NAME}=${PARAM_VALUE}
-p ${localPort}:${exposeContainerPort} 
-v /${path_to_local_folder}/:/${path_to_container_folder}/
-v /${path_to_local_conf}/conf_name.cfg:/${path_to_container_conf}/conf_name.cfg
#should connect to local ports/services
docker run ... --net=host ...
```

Go into container
-----
```sh
docker exec -it dockerName bash
```
Go into container as root
-----
```sh
docker exec --user root -it dockerName bash
```

Stop/Start container
-----
```sh
docker stop dockerName
docker start dockerName
```
Remove container
-----
```sh
docker rm dockerName
```

Show logs
-----
```sh
docker logs dockerName
```

Show open ports
-----
```sh
docker port dockerName
nmap localhost -p 8100
or
telnet localhost 8100
or
netstat -lntu
netstat -lntu | grep ..
```

See images
-----
```sh
docker images
docker ps
```

Delete all 'untagged/dangling' (<none>) images
```sh
docker rmi $(docker images -q -f dangling=true)
```
Delete images
-----
```sh
docker images
docker rmi vadjee/dockerName
docker rmi -f vadjee/dockerName
```
