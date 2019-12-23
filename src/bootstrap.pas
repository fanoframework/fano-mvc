(*!------------------------------------------------------------
 * Fano MVC Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc.git
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit bootstrap;

interface

uses

    fano;

type

    TAppServiceProvider = class(TBasicAppServiceProvider)
    public
        procedure register(const container : IDependencyContainer); override;
    end;

    TAppRoutes = class(TRouteBuilder)
    public
        procedure buildRoutes(
            const container : IDependencyContainer;
            const router : IRouter
        ); override;
    end;

implementation

uses
    sysutils

    (*! -------------------------------
     *   controllers factory
     *----------------------------------- *)
    {---- put your controller factory here ---},
    ResponseFactoryImpl,
    UserControllerFactory,
    UserModelFactory,
    UserListingViewFactory,
    HeaderViewFactory,
    FooterViewFactory;


    procedure TAppServiceProvider.register(const container : IDependencyContainer);
    begin
        {$INCLUDE Dependencies/dependencies.inc}
    end;

    procedure TAppRoutes.buildRoutes(
        const container : IDependencyContainer;
        const router : IRouter
    );
    begin
        {$INCLUDE Routes/routes.inc}
    end;
end.
