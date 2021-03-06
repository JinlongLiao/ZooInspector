#!/bin/sh

# Copyright 1998-2019 KOAL Group Holding Ltd.
# Author Liaojl

cygwin=false
darwin=false
os400=false
case "$(uname)" in
CYGWIN*) cygwin=true ;;
Darwin*) darwin=true ;;
OS400*) os400=true ;;
esac
error_exit() {
  echo "ERROR: $1 !!"
  exit 1
}
[ -e "$JAVA8_HOME/bin/java" ] && JAVA_HOME=$JAVA8_HOME
[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=$HOME/jdk/java
[ ! -e "$JAVA_HOME/bin/java" ] && JAVA_HOME=/usr/java
[ ! -e "$JAVA_HOME/bin/java" ] && unset JAVA_HOME

if [ -z "$JAVA_HOME" ]; then
  if $darwin; then

    if [ -x '/usr/libexec/java_home' ]; then
      export JAVA_HOME=$(/usr/libexec/java_home)

    elif [ -d "/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home" ]; then
      export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home"
    fi
  else
    JAVA_PATH=$(dirname $(readlink -f $(which javac)))
    if [ "x$JAVA_PATH" != "x" ]; then
      export JAVA_HOME=$(dirname $JAVA_PATH 2>/dev/null)
    fi
  fi
  if [ -z "$JAVA_HOME" ]; then
    error_exit "Please set the JAVA_HOME variable in your environment, We need java(x64)! jdk8 or later is better!"
  fi
fi

export SERVER="zoo-inspector-0.1-SNAPSHOT"

export JAVA_HOME
export JAVA="$JAVA_HOME/bin/java"
export BASE_DIR=$(
  cd $(dirname $0)/..
  pwd
)
export DEFAULT_SEARCH_LOCATIONS="classpath:/,classpath:/config/,file:./,file:./config/"
export CUSTOM_SEARCH_LOCATIONS=${DEFAULT_SEARCH_LOCATIONS},file:${BASE_DIR}/conf/

#===========================================================================================
# JVM Configuration
#===========================================================================================
JAVA_OPT="${JAVA_OPT} -Xms512m -Xmx512m -Xmn256m "
JAVA_MAJOR_VERSION=$($JAVA -version 2>&1 | sed -E -n 's/.* version "([0-9]*).*$/\1/p')
if [[ "$JAVA_MAJOR_VERSION" -ge "9" ]]; then
  JAVA_OPT="${JAVA_OPT}  --add-modules java.sql --illegal-access=warn"
  JAVA_OPT="${JAVA_OPT} -cp .:${BASE_DIR}/lib"
  JAVA_OPT="${JAVA_OPT} -Xlog:gc*:file=${BASE_DIR}/logs/zui_gc.log:time,tags:filecount=10,filesize=102400"
else
  JAVA_OPT="${JAVA_OPT} -Djava.ext.dirs=${JAVA_HOME}/jre/lib/ext:${JAVA_HOME}/lib/ext:${BASE_DIR}/lib"
  JAVA_OPT="${JAVA_OPT} -Xloggc:${BASE_DIR}/logs/zui_gc.log -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -XX:+UseGCLogFileRotation -XX:NumberOfGCLogFiles=10 -XX:GCLogFileSize=100M"
fi

JAVA_OPT="${JAVA_OPT} -jar ${BASE_DIR}/target/${SERVER}.jar"
JAVA_OPT="${JAVA_OPT} ${JAVA_OPT_EXT}"
JAVA_OPT="${JAVA_OPT} -Dlog4j.configuration=file:${BASE_DIR}/conf/log4j.properties"

if [ ! -d "${BASE_DIR}/logs" ]; then
  mkdir ${BASE_DIR}/logs
fi

#echo "$JAVA ${JAVA_OPT}"

# check the start.out log output file
#if [ ! -f "${BASE_DIR}/logs/start.out" ]; then
#  touch "${BASE_DIR}/logs/start.out"
#fi
# start
export ZUI_ROOT_PATH=${BASE_DIR}

#echo "$JAVA ${JAVA_OPT}" >${BASE_DIR}/logs/start.out 2>&1 &
nohup $JAVA ${JAVA_OPT} >${BASE_DIR}/logs/start.out 2>&1 &
echo "ZUI is starting，you can check the ${BASE_DIR}/log/"
