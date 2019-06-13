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
docker exec -it -u root dockerName bash
--> apt install mc 
#docker commit firefox
docker exec -it dockerName bash
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

Got permission denied while trying to connect to the Docker daemon socket at
-----
```sh
sudo chmod 777 /var/run/docker.sock
```

Docker repositories
-----
```sh
https://hub.docker.com/u/vadjee/
```

Clean disk space 
-----
```sh
#!/usr/bin/env bash

# Stop all containers
docker stop `docker ps -qa`

# Remove all containers
docker rm `docker ps -qa`

# Remove all images
docker rmi -f `docker images -qa`

# Remove all volumes
docker volume rm $(docker volume ls -qf)

# Remove all networks
docker network rm `docker network ls -q`

# Your installation should now be all fresh and clean.

# The following commands should not output any items:
# docker ps -a
# docker images -a
# docker volume ls

# The following command show only show the default networks:
# docker network ls
```

