# run-gogs.sh
#!/bin/bash

# Gogs 관련 환경 변수 설정
export GOGS_CONTAINER_NAME=service-gogs
export GOGS_UI_PORT=10080
export GOGS_LOCAL_MOUNT=/data/gogs
export GOGS_CONTAINER_MOUNT=/data

# Gogs 컨테이너 실행
docker run --rm -it -d --name $GOGS_CONTAINER_NAME \
  -p 10022:22 \
  -p $GOGS_UI_PORT:3000 \
  -v $GOGS_LOCAL_MOUNT:$GOGS_CONTAINER_MOUNT \
  gogs/gogs

docker logs $GOGS_CONTAINER_NAME