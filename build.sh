#!/bin/bash
docker build -t myreactimg .
docker compose down || true
docker compose up -d

