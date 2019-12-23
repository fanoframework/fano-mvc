(*!------------------------------------------------------------
 * Fano MVC Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc.git
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
program app;

uses

    fano,
    bootstrap;

var
    appInstance : IWebApplication;

begin
    (*!-----------------------------------------------
     * Bootstrap application
     *
     * @author AUTHOR_NAME <author@email.tld>
     *------------------------------------------------*)
    appInstance := TCgiWebApplication.create(
        TAppServiceProvider.create(),
        TAppRoutes.create()
    );
    appInstance.run();
end.
