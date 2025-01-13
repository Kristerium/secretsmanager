#!/bin/bash
# Script created by cyteon

APP_NAME="secret-frontend"
DEFAULT_PORT=35267
PORT=${1:-$DEFAULT_PORT}

echo "Starting $APP_NAME on port $PORT..."

npm run build

export PORT=$PORT

pm2 delete "$APP_NAME"
pm2 start build/index.js --name "$APP_NAME"
pm2 save

echo "Running on port $PORT"