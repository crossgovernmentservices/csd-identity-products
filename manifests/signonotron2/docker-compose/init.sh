#!/bin/sh

CID=$(docker ps -qf "name=signonotron2_web")
docker exec $CID rake db:migrate
docker exec $CID rake applications:create name=ClientName description="What does this app do" home_uri="https://myapp.com" redirect_uri="https://myapp.com/auth/gds/callback"
docker exec $CID rake users:create name='First Last' email=user@example.com applications=ClientName
