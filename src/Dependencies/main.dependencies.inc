(*!------------------------------------------------------------
 * Fano MVC Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc.git
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)

 {-----------------------------------------------
   register middleware list for each routes that
   does nothing,
   need to be use factory so each route will have
   different middleware list
   Replace with TMiddlewareCollectionAwareFactory to support middleware
   or replace with your own implementation if required
 ------------------------------------------------}
 container.factory('routeMiddlewares', TNullMiddlewareCollectionAwareFactory.create());

 {-----------------------------------------------
   register application configuration
 ------------------------------------------------}
 container.add(
     'config',
     TJsonFileConfigFactory.create(
         extractFileDir(getCurrentDir()) + '/src/config/config.json'
     )
 );
