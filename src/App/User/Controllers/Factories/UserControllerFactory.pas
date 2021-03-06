(*!------------------------------------------------------------
 * Fano MVC Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc.git
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit UserControllerFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller TUserController
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
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
    var config : IAppConfiguration;
        viewParams : IViewParameters;
    begin
        config := container.get('config') as IAppConfiguration;
        viewParams := container.get('viewParams') as IViewParameters;
        viewParams
            .setVar('baseUrl', config.getString('baseUrl'))
            .setVar('appName', config.getString('appName'));
        result := TUserController.create(
            container.get('userListingView') as IView,
            viewParams,
            container.get('user.list') as IModelReader
        );
    end;
end.
