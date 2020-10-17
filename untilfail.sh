#!/bin/bash
# Runs a command repeatedly until it fails
# Usage: ./untilfail command
#https://stackoverflow.com/q/12967232
$@
while [ $? -eq 0 ]; do
    $@
done
