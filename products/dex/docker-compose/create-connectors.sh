#!/bin/sh

docker-compose run dex-overlord \
    /opt/dex/bin/dexctl \
    --db-url=postgres://user:password@postgres:5432/user?sslmode=disable \
    set-connector-configs /opt/dex/connectors/connectors.json
