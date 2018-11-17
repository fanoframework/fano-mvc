REM------------------------------------------------------------
REM Fano MVC Sample Application (https://fanoframework.github.io)
REM
REM @link      https://github.com/fanoframework/fano-mvc.git
REM @copyright Copyright (c) 2018 Zamrony P. Juhara
REM @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
REM-------------------------------------------------------------

REM------------------------------------------------------
REM Scripts to setup configuration files
REM------------------------------------------------------

copy src\config\config.json.sample src\config\config.json
copy build.prod.cfg.sample build.prod.cfg
copy build.dev.cfg.sample build.dev.cfg
copy build.cfg.sample build.cfg