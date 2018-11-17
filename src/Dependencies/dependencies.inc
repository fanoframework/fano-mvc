(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)

{$INCLUDE main.dependencies.inc}

{---put your dependencies registration here---}
{ container.add('db', TMySqlDbFactory.create()); }
{$INCLUDE controllers.dependencies.inc}
