(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
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
    appInstance := TBootstrapApp.create(
        TDependencyContainer.create(TDependencyList.create()),
        TCGIEnvironment.create(),
        TErrorHandler.create()
    );
    appInstance.run();
end.