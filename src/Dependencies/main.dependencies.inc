(*!------------------------------------------------------------
 * Fano MVC Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc.git
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)

 {-----------------------------------------------
   register application configuration
 ------------------------------------------------}
 container.add(
     'config',
     TJsonFileConfigFactory.create(
         extractFileDir(getCurrentDir()) + '/src/config/config.json'
     )
 );
