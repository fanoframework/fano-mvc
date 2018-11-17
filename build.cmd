REM------------------------------------------------------------
REM [[APP_NAME]] ([[APP_URL]])
REM
REM @link      [[APP_REPOSITORY_URL]]
REM @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
REM @license   [[LICENSE_URL]] ([[LICENSE]])
REM-------------------------------------------------------------

REM ------------------------------------
REM -- build script for Windows
REM ------------------------------------

SET FANO_DIR="vendor/fano"

IF NOT DEFINED BUILD_TYPE (SET BUILD_TYPE="prod")
IF NOT DEFINED USER_APP_DIR (SET USER_APP_DIR="src")
IF NOT DEFINED UNIT_OUTPUT_DIR (SET UNIT_OUTPUT_DIR="bin\unit")
IF NOT DEFINED EXEC_OUTPUT_DIR (SET EXEC_OUTPUT_DIR="public")
IF NOT DEFINED EXEC_OUTPUT_NAME (SET EXEC_OUTPUT_NAME="app.cgi")
IF NOT DEFINED SOURCE_PROGRAM_NAME (SET SOURCE_PROGRAM_NAME="app.pas")

fpc @vendor/fano/fano.cfg @build.cfg %USER_APP_DIR%\%SOURCE_PROGRAM_NAME%