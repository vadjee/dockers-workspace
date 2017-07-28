Firefox docker image
=====

Build firefox
-----
```sh
docker build -f firefox/Dockerfile . -t vadjee/firefox
docker push vadjee/firefox:latest

#xhost +
#xhost localhost
docker run --name firefox -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix vadjee/firefox
#xhost -
#xhost
```
