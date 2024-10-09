#!/bin/bash

node server.js &

PID=$!
echo "Node server.js is running with PID: $PID"
echo ""