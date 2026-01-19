#!/usr/bin/env bash

SERVER_PATH="/home/<your_user>/hytale-server/Server"
cd "$SERVER_PATH"

/usr/bin/java -Xmx<ram_amount>M -Xms<ram_amount>M -jar HytaleServer.jar --assets ../Assets.zip &

echo $! > /home/<your_user>/hytale-server/server.pid
