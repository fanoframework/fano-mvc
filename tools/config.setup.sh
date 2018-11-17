#------------------------------------------------------------
# [[APP_NAME]] ([[APP_URL]])
#
# @link      [[APP_REPOSITORY_URL]]
# @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
# @license   [[LICENSE_URL]] ([[LICENSE]])
#--------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Scripts to setup configuration files
#------------------------------------------------------

cp src/config/config.json.sample src/config/config.json
cp build.prod.cfg.sample build.prod.cfg
cp build.dev.cfg.sample build.dev.cfg
cp build.cfg.sample build.cfg