# run-service.sh
#!/bin/bash

# 기존 컨테이너 종료 및 삭제
docker stop service-container
docker rm service-container

# PostgreSQL 관련 환경 변수 설정
export POSTGRES_CONTAINER_NAME=service-postgres

# Gogs 관련 환경 변수 설정
export GOGS_CONTAINER_NAME=service-gogs

# service 컨테이너 관련 환경 변수
export SERVICE_CONTAINER_NAME=service-container
export AIRFLOW_UI_PORT=5601
export AIRFLOW_LOCAL_MOUNT=/data/mlsapp/mls
export AIRFLOW_CONTAINER_MOUNT=/home/mlsapp/mls

# Jupyterhub 관련 환경 변수
export JUPYTER_UI_PORT=8000

# service 컨테이너 실행
docker run -itd --name $SERVICE_CONTAINER_NAME \
  -p $AIRFLOW_UI_PORT:8080 \
  -p $JUPYTER_UI_PORT:8000 \
  --link $GOGS_CONTAINER_NAME:gogs \
  --link $POSTGRES_CONTAINER_NAME:postgresql \
  -v $AIRFLOW_LOCAL_MOUNT:$AIRFLOW_CONTAINER_MOUNT \
  service/anaconda3

# MLS용 소스코드 폴더
docker exec -it service-container mkdir -p $AIRFLOW_CONTAINER_MOUNT

# Airflow를 위한 PostgreSQL DB 초기화
docker exec -it $SERVICE_CONTAINER_NAME airflow initdb

# Airflow 웹 서버 실행
docker exec -it -d $SERVICE_CONTAINER_NAME airflow webserver

# Airflow scheduler 실행
docker exec -it -d $SERVICE_CONTAINER_NAME airflow scheduler

docker logs $SERVICE_CONTAINER_NAME