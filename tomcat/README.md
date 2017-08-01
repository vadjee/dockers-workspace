Apache Tomcat docker container
=====

Build tomcat container
-----
```sh
docker build -f tomcat/Dockerfile . -t vadjee/tomcat:7.0.79-jre8
docker push vadjee/tomcat:7.0.79-jre8
```

Run tomcat container
-----
```sh
docker run --rm --name tomcat -v ~/work/opt/apache-tomcat-7/conf/dev_$PROJECT_NAME-operational.properties:/opt/tomcat/conf/$PROJECT_NAME-operational.properties -v ~/work/opt/$PROJECT_NAME/tomcat/webapps:/opt/tomcat/webapps/ --net=host vadjee/tomcat
```


