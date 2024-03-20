#!/bin/bash

rm -rf /app/ezyplatform/admin/.runtime/* /app/ezyplatform/socket/.runtime/*  /app/ezyplatform/web/.runtime/*
service mysql start
bash cli.sh "start admin"
while [ ! -f /app/ezyplatform/logs/admin-server.log ]; do
    sleep 1
done
tail -f /app/ezyplatform/logs/admin-server.log
