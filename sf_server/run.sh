#!/bin/bash

source /home/`whoami`/.profile
APP_NAME="nec-server"
MAIN_CLASS="com.globe_sh.cloudplatform.server.ServerMain"
JAVA_OPTS="-Xms128m -Xmx512m -D$APP_NAME -server"
CLASSPATH=.:./nec-server-1.0.jar
for i in ../lib/*.jar; do
	CLASSPATH=$CLASSPATH:$i
done

export CLASSPATH

echo $CLASSPATH

check() {
    ERROR=0
    if [ "1" -eq $ERROR ]; then
        echo
        exit 1
    fi
}

start() {
    echo "JAVA_HOME=$JAVA_HOME"
    echo "CLASSPATH=$CLASSPATH"
    echo "MAIN_CLASS=$MAIN_CLASS"
    echo "$APP_NAME trying to start ......"
    check || exit 1
    nohup $JAVA_HOME/bin/java $JAVA_OPTS $MAIN_CLASS > /usr/etc/nec-server${2}/log/nec-server.log 2>&1 &
    echo "$APP_NAME started success..."
}

stop() {
    echo "Stopping $APP_NAME ......"
    kill -9 $(ps -ef | grep ServerMain | grep -v grep | awk '{print $2}')
}

case "$1" in
    start) 
         start
         ;;
    stop)
         stop
         ;;
    restart)
         stop
         start
         ;;
    *)
         echo $"Usage: $0 {start|stop|restart}"
         exit 1
esac



