# Docker ML Docker 개발환경
```
JupyerLab, Airflow, Gogs, Postgres, ML(Tensorflow ...)
```


## - Postgres, Gogs 설치
```
$ docker pull postgres          # Postgres 설치
$ docker pull gogs              # gogs 설치
```

## - Dockerfile 빌드(메인 이미지)
```
$ docker build -t service-container:0.1 .                      # Dockerfile이 존재하는 폴더에서 실행.
```


## - Postgres, Gogs, Main 도커이미지 Run 스크립트
```
순서대로 실행 (상황에 따라 커스텀)
$ ./run-postgresql.sh
$ ./run-gogs.sh
$ ./run-service.sh
```
