(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
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
   register application simple router instance
   Replace with your own implementation if required
 ------------------------------------------------}
 container.add('router', TSimpleRouteCollectionFactory.create());

 {-----------------------------------------------
   setup application request dispatcher
   replace with TDispatcherDispatcherFactory if middleware support is requred
 ------------------------------------------------}
 container.add(
     'dispatcher',
     TSimpleDispatcherFactory.create(
         container.get('router') as IRouteMatcher
     )
 );
