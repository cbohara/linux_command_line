#!/bin/bash

echo "Parent starting..."

echo "Parent: launching child script..."
# child script is launched and placed into the background
./async_child.sh &
# $! always contains the process ID of the last job put into the background
pid=$!
echo "Parent: child (PID=$pid) launched"

echo "Parent: continuing..."
sleep 2

echo "Parent: pausing to wait for child to finish..."
# wait command causes parent script to pause until a specific process is done
wait $pid

echo "Parent: child is finished. Contuining..."
echo "Parent: parent is done - Goodbye!"
