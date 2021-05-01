#!/usr/bin/env bash

docker build --force-rm --label=fcpfa --tag=dds22/nginx ./nginx 
#docker build --force-rm --no-cache --label=fcpfa --tag=dds22/laravel ./laravel 
docker build --force-rm --label=fcpfa --tag=dds22/node ./node 
docker build --force-rm --label=fcpfa --tag=dds22/mysql ./mysql 
