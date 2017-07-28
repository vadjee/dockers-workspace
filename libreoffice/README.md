Libre Office docker image
=====

Build libreo-ffice container
-----
```sh
docker build -f libreoffice/Dockerfile . -t vadjee/libreoffice
docker push vadjee/libreoffice:latest
```

Run container
-----
```sh
docker run --rm --name libreoffice -p 127.0.0.1:8100:8100 -d vadjee/libreoffice
```

Stop/Start container
-----
```sh
docker run -it --name libreoffice -p 127.0.0.1:8100:8100 -d vadjee/libreoffice
docker stop libreoffice
docker start libreoffice
```
Remove container
-----
```sh
docker rm libreoffice
```

Show open ports
-----
```sh
docker port libreoffice
nmap localhost -p 8100
or
telnet localhost 8100
```

