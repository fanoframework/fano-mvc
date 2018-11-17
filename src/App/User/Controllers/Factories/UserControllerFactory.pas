(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit UserControllerFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller TUserController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TUserControllerFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    UserController;

    function TUserControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var routeMiddlewares : IMiddlewareCollectionAware;
        config : IAppConfiguration;
        viewParams : IViewParameters;
    begin
        routeMiddlewares := container.get('routeMiddlewares') as IMiddlewareCollectionAware;
        try
            config := container.get('config') as IAppConfiguration;
            viewParams := container.get('viewParams') as IViewParameters;
            viewParams
                .setVar('baseUrl', config.getString('baseUrl'))
                .setVar('appName', config.getString('appName'));
            result := TUserController.create(
                routeMiddlewares.getBefore(),
                routeMiddlewares.getAfter(),
                container.get('userListingView') as IView,
                viewParams,
                container.get('user.list') as IModelReader
            );
        finally
            routeMiddlewares := nil;
        end;
    end;
end.
