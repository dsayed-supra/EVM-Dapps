#!/bin/bash

pids=$(pgrep node)

if [ -z "$pids" ]; then
    echo "No node processes to kill."
else

    killall node
    echo "Killed node process IDs: $pids"
fi
