PostgreSQL docker container
=====

Build postgres container
-----
```sh
docker build -f postgres/Dockerfile . -t vadjee/postgres:9.6.3
docker push vadjee/postgres:9.6.3
```

Run postgres container
-----
```sh
docker run --name postgres -v ~/work/opt/$PROJECT_NAME/postgresql/pgdata:/var/lib/postgresql/data -v ~/work/opt/$PROJECT_NAME/postgresql/tmp:/tmp -p 8432:5432 -d vadjee/postgres
docker run --rm --name postgres -v ~/work/opt/$PROJECT_NAME/postgresql/pgdata:/var/lib/postgresql/data -v ~/work/opt/$PROJECT_NAME/postgresql/tmp:/tmp -p 8432:5432 -d vadjee/postgres
```

Go into container
-----
```sh
docker exec -it postgres bash

psql -U postgres
#change postgres password 
\password postgres
```



