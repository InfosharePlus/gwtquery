@echo off
cd %~dp0
set JAVA_HOME=C:\Program Files\Eclipse Adoptium\jdk-17.0.14.7-hotspot

title Gwt Query
echo Gwt Query > _log.txt

:: Tool for checking the status of the dependencies.
if 1 == 0 (
call mvn versions:display-dependency-updates >> _log.txt
call mvn versions:display-plugin-updates >> _log.txt
call mvn versions:display-property-updates >> _log.txt

call mvn dependency:tree >> _log.txt
call mvn dependency:resolve >> _log.txt
call mvn dependency:analyze >> _log.txt
)

call mvn clean >> _log.txt
call mvn install >> _log.txt

pause
