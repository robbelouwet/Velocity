#!/bin/bash

echo "JVM_ARGS: ${JVM_ARGS}"

# Inject velocity secret
echo "$VELOCITY_SECRET" > /forwarding.secret

# Run the server
java $JVM_ARGS -XX:+UseG1GC -XX:G1HeapRegionSize=4M -XX:+UnlockExperimentalVMOptions -XX:+ParallelRefProcEnabled -XX:+AlwaysPreTouch -XX:MaxInlineLevel=15 -jar /velocity*.jar