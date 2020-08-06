#!/bin/bash

source /home/`whoami`/.profile
APP_NAME="nec-websocket"
JAVA_OPTS="-Xms128m -Xmx512m -D$APP_NAME -server -Dfile.encoding=UTF-8"

   echo "JAVA_HOME=$JAVA_HOME"
   echo "$APP_NAME trying to start ......"
   nohup $JAVA_HOME/bin/java $JAVA_OPTS -jar /usr/etc/nec-websocket/bin/nec-websocket-1.0.jar > /dev/null 2>&1 &
   echo "$APP_NAME started success..."
