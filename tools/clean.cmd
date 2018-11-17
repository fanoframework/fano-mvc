REM------------------------------------------------------------
REM [[APP_NAME]] ([[APP_URL]])
REM
REM @link      [[APP_REPOSITORY_URL]]
REM @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
REM @license   [[LICENSE_URL]] ([[LICENSE]])
REM-------------------------------------------------------------

REM------------------------------------------------------
REM Scripts to delete all compiled unit files
REM------------------------------------------------------

FOR /R bin\unit %i IN (*) DO IF NOT %i == README.md del %i