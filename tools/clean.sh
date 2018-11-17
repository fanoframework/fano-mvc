#------------------------------------------------------------
# Fano MVC Sample Application (https://fanoframework.github.io)
#
# @link      https://github.com/fanoframework/fano-mvc.git
# @copyright Copyright (c) 2018 Zamrony P. Juhara
# @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
#--------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Scripts to delete all compiled unit files
#------------------------------------------------------

find bin/unit ! -name 'README.md' -type f -exec rm -f {} +