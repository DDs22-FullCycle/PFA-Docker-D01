#!/usr/bin/env bash

docker exec -it node-container npx prisma generate --schema app/prisma/schema.prisma