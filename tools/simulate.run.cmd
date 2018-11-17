REM------------------------------------------------------------
REM [[APP_NAME]] ([[APP_URL]])
REM
REM @link      [[APP_REPOSITORY_URL]]
REM @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
REM @license   [[LICENSE_URL]] ([[LICENSE]])
REM-------------------------------------------------------------

REM------------------------------------------------------
REM Scripts to simulate run CGI app in shell for Windows
REM------------------------------------------------------

SET %CURRDIR%=%cd%

REM change current working dir, to simulate how cgi
REM app executed by web server
cd public

IF NOT DEFINED REQUEST_METHOD (SET REQUEST_METHOD="GET")
IF NOT DEFINED REQUEST_URI (SET REQUEST_URI="/")

app.cgi

cd %CURRDIR%