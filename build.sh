#------------------------------------------------------------
# [[APP_NAME]] ([[APP_URL]])
#
# @link      [[APP_REPOSITORY_URL]]
# @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
# @license   [[LICENSE_URL]] ([[LICENSE]])
#--------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Build script for Linux
#------------------------------------------------------

export FANO_DIR="vendor/fano"

if [[ -z "${BUILD_TYPE}" ]]; then
export BUILD_TYPE="prod"
fi

if [[ -z "${USER_APP_DIR}" ]]; then
export USER_APP_DIR="src"
fi

if [[ -z "${UNIT_OUTPUT_DIR}" ]]; then
    export UNIT_OUTPUT_DIR="bin/unit"
fi

if [[ -z "${EXEC_OUTPUT_DIR}" ]]; then
export EXEC_OUTPUT_DIR="public"
fi

if [[ -z "${EXEC_OUTPUT_NAME}" ]]; then
export EXEC_OUTPUT_NAME="app.cgi"
fi

if [[ -z "${SOURCE_PROGRAM_NAME}" ]]; then
SOURCE_PROGRAM_NAME="app.pas"
fi

fpc @vendor/fano/fano.cfg @build.cfg ${USER_APP_DIR}/${SOURCE_PROGRAM_NAME}