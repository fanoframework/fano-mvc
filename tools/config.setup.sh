#------------------------------------------------------------
# Fano MVC Sample Application (https://fanoframework.github.io)
#
# @link      https://github.com/fanoframework/fano-mvc.git
# @copyright Copyright (c) 2018 Zamrony P. Juhara
# @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
#--------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Scripts to setup configuration files
#------------------------------------------------------

cp src/config/config.json.sample src/config/config.json
cp build.prod.cfg.sample build.prod.cfg
cp build.dev.cfg.sample build.dev.cfg
cp build.cfg.sample build.cfg