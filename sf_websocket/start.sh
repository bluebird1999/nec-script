#!/bin/sh

APP_NAME="nec-websocket"
JAVA_OPTS="-Xms128m -Xmx512m -D$APP_NAME -server"

   echo "JAVA_HOME=$JAVA_HOME"
   echo "$APP_NAME trying to start ......"
   nohup $JAVA_HOME/bin/java $JAVA_OPTS -jar /usr/etc/nec-websocket/bin/nec-restful-1.0.jar > /usr/etc/nec-restful/log/nec-websocket.log 2>&1 &
   echo "$APP_NAME started success..."