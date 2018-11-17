REM------------------------------------------------------------
REM Fano MVC Sample Application (https://fanoframework.github.io)
REM
REM @link      https://github.com/fanoframework/fano-mvc.git
REM @copyright Copyright (c) 2018 Zamrony P. Juhara
REM @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
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