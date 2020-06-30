@echo off
rem Author Liaojl
title ZUI

if exist "%JAVA8_HOME%\bin\java.exe" (set JAVA_HOME=%JAVA8_HOME%)
if not exist "%JAVA_HOME%\bin\java.exe" echo Please set the JAVA_HOME variable in your environment, We need java(x64)! jdk8 or later is better! & EXIT /B 1
set BASE_DIR=%~dp0
set BASE_DIR_BAK=%~dp0
rem added double quotation marks to avoid the issue caused by the folder names containing spaces.
rem removed the last 5 chars(which means \bin\) to get the base DIR.
set BASE_DIR=%BASE_DIR:~0,-5%
set "JAVA=%JAVA_HOME%\bin\java.exe"
set DEFAULT_SEARCH_LOCATIONS="classpath:/,classpath:/config/,file:./,file:./config/"
set CUSTOM_SEARCH_LOCATIONS=%DEFAULT_SEARCH_LOCATIONS%,file:%BASE_DIR%/conf/
set BASE_DIR=%~dp0
rem added double quotation marks to avoid the issue caused by the folder names containing spaces.
rem removed the last 5 chars(which means \bin\) to get the base DIR.
set BASE_DIR="%BASE_DIR:~0,-5%"
set SERVER=zoo-inspector-0.1-SNAPSHOT

set JAVA_OPT="%JAVA_OPT% -Djava.ext.dirs=%JAVA_HOME%/jre/lib/ext;%JAVA_HOME%/lib/ext;%BASE_DIR%/lib"

set "JAVA_OPT=%JAVA_OPT% -Xms512m -Xmx512m -Xmn256m"
set "JAVA_OPT=%JAVA_OPT% -jar %BASE_DIR%\target\%SERVER%.jar"
set BASE_DIR=%BASE_DIR_BAK%
set ZUI_ROOT_PATH=%BASE_DIR%
call "%JAVA%" %JAVA_OPT%