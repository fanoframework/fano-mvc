(*!------------------------------------------------------------
 * Fano MVC Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc.git
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit UserController;

interface

uses

    fano;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /user
     *
     * See Routes/User/routes.inc
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    TUserController = class(TController)
    private
        userList : IModelReader;
    public
        constructor create(
            const viewInst : IView;
            const viewParamsInst : IViewParameters;
            const userListModel : IModelReader
        );
        destructor destroy(); override;

        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader
        ) : IResponse; override;
    end;

implementation

    constructor TUserController.create(
        const viewInst : IView;
        const viewParamsInst : IViewParameters;
        const userListModel : IModelReader
    );
    begin
        inherited create(viewInst, viewParamsInst);
        userList := userListModel;
    end;

    destructor TUserController.destroy();
    begin
        inherited destroy();
        userList := nil;
    end;

    function TUserController.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader
    ) : IResponse;
    begin
        //request user listing from storage
        userList.read();
        result := inherited handleRequest(request, response, args);
    end;

end.
