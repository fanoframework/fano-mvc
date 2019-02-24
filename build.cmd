REM------------------------------------------------------------
REM Fano MVC Sample Application (https://fanoframework.github.io)
REM
REM @link      https://github.com/fanoframework/fano-mvc.git
REM @copyright Copyright (c) 2018 Zamrony P. Juhara
REM @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
REM-------------------------------------------------------------

REM ------------------------------------
REM -- build script for Windows
REM ------------------------------------


IF NOT DEFINED FANO_DIR (SET FANO_DIR="vendor/fano")
IF NOT DEFINED BUILD_TYPE (SET BUILD_TYPE="prod")
IF NOT DEFINED USER_APP_DIR (SET USER_APP_DIR="src")
IF NOT DEFINED UNIT_OUTPUT_DIR (SET UNIT_OUTPUT_DIR="bin\unit")
IF NOT DEFINED EXEC_OUTPUT_DIR (SET EXEC_OUTPUT_DIR="public")
IF NOT DEFINED EXEC_OUTPUT_NAME (SET EXEC_OUTPUT_NAME="app.cgi")
IF NOT DEFINED SOURCE_PROGRAM_NAME (SET SOURCE_PROGRAM_NAME="app.pas")
IF NOT DEFINED FPC_BIN (SET FPC_BIN="fpc")

%FPC_BIN% @vendor/fano/fano.cfg @build.cfg %USER_APP_DIR%\%SOURCE_PROGRAM_NAME%
