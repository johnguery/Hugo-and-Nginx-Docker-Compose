#!/bin/bash
docker-compose -f hugo/docker-compose.yml up -d
docker-compose -f nginx/docker-compose.yml up -d
docker ps