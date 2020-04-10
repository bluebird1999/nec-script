#!/bin/bash

source /home/`whoami`/.profile
APP_NAME="nec-admin"
JAVA_OPTS="-Xms128m -Xmx512m -D$APP_NAME -server"

   echo "JAVA_HOME=$JAVA_HOME"
   echo "$APP_NAME trying to start ......"
   nohup $JAVA_HOME/bin/java $JAVA_OPTS -jar /usr/etc/nec-admin/bin/nec-admin-1.0.jar > /usr/etc/nec-admin/log/nec-admin.log 2>&1 &
   echo "$APP_NAME started success..."
