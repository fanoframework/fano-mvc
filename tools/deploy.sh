#------------------------------------------------------------
# Fano MVC Sample Application (https://fanoframework.github.io)
#
# @link      https://github.com/fanoframework/fano-mvc.git
# @copyright Copyright (c) 2018 Zamrony P. Juhara
# @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
#--------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Scripts to deploy application for Linux
#------------------------------------------------------

rsync \
--archive \
--compress \
--exclude=".git" \
--exclude="bin" \
--exclude="vendor" \
--exclude="tools" \
--exclude="src/App" \
--exclude="src/Dependencies" \
--exclude="src/Routes" \
--exclude="*.pas" \
--exclude="*.inc" \
--exclude="build.cfg" \
--exclude="build.dev.cfg" \
--exclude="build.prod.cfg" \
--exclude="*.cfg.sample" \
--exclude=".git*" \
--exclude="LICENSE" \
--exclude="README.md" \
--exclude="*.sh" \
--exclude="*.cmd" \
./ \
$TARGET