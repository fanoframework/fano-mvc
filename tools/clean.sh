#------------------------------------------------------------
# [[APP_NAME]] ([[APP_URL]])
#
# @link      [[APP_REPOSITORY_URL]]
# @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
# @license   [[LICENSE_URL]] ([[LICENSE]])
#--------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Scripts to delete all compiled unit files
#------------------------------------------------------

find bin/unit ! -name 'README.md' -type f -exec rm -f {} +