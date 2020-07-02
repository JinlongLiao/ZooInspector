@echo off
rem 可以在这里指定JAVA_HOME，如：set JAVA_HOME="D:\Program Files\Java\jdk1.6.0"
if "%JAVA_HOME%" == "" goto ERROR
if exist "%JAVA8_HOME%\bin\java.exe" (set JAVA_HOME=%JAVA8_HOME%)

if exist "%JAVA_HOME%"\jre\bin\server\jvm.dll (
	set JVMDIR="%JAVA_HOME%"\jre\bin\server
) else (
  if exist "%JAVA_HOME%"\jre\bin\server\jvm.dll (
  	set JVMDIR="%JAVA_HOME%"\bin\server
  ) else (
  	 goto ERROR1
  )
)

set BASE_DIR=%~dp0
set BASE_DIR=%BASE_DIR:~0,-5%/
set ZUI_ROOT_PATH=%BASE_DIR%

set JAVA_OPT="%JAVA_OPT% -Djava.ext.dirs=%JAVA_HOME%/jre/lib/ext;%JAVA_HOME%/lib/ext;%BASE_DIR%/lib"


rem 设置服务名
set SERVICE_NAME=ZUI
rem 设置启动类
set STRAT_CLASS=org.zui.inspector.ZooInspector

rem 设置JMX，如果不启用JMX，可以直接设置为 set JMX_SETTING=""
rem set JMX_SETTING="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=8004 -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
rem 指定主类的classpath
set CLASSPATH=%BASE_DIR%\lib\*;%BASE_DIR%\start\*;
rem 通过for循环lib目录下的所有jar及zip文件名来组成classpath
rem if exist .\WebContent\WEB-INF\lib\ (
	rem 如果是该文件在WebContent之上，即为独立包部署模式
rem for %%i in (".\lib\*.jar") do call ".\cpappend.bat" %%i
rem for %%i in (".\WebContent\WEB-INF\lib\*.jar") do call ".\cpappend.bat" %%i
rem ) else (
	rem 否则应该为war包部署方式，该命令在WEB-INF\bin目录
rem for %%i in ("..\lib\*.jar") do call ".\cpappend.bat" %%i
rem )


start java -server -cp %CLASSPATH% %STRAT_CLASS% %1 %2 %3 %4
goto END


:ERROR
echo "系统中没有设置JAVA_HOME，请在环境变量中设置JAVA_HOME或者在这个文件的开头部份设置......................"
goto END

:ERROR1
echo "你所指定的JAVA_HOME路径不正确"
goto END

:END
set CLASSPATH=