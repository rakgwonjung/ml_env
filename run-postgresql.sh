# run-postgresql.sh
#!/bin/bash

# PostgreSQL 관련 환경 변수 설정
export POSTGRES_CONTAINER_NAME=service-postgres
export POSTGRES_PORT=5432
export POSTGRES_LOCAL_MOUNT=/data/pgdata
export POSTGRES_CONTAINER_MOUNT=/var/lib/postgresql/data

# PostgreSQL 컨테이너 실행
docker run --rm -it -d --name $POSTGRES_CONTAINER_NAME \
  -p $POSTGRES_PORT:5432 \
  -v $POSTGRES_LOCAL_MOUNT:$POSTGRES_CONTAINER_MOUNT \
  postgres

docker logs $POSTGRES_CONTAINER_NAME