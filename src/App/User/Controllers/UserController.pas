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
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TUserController = class(TController, IDependency)
    private
        userList : IModelReader;
    public
        constructor create(
            const beforeMiddlewares : IMiddlewareCollection;
            const afterMiddlewares : IMiddlewareCollection;
            const viewInst : IView;
            const viewParamsInst : IViewParameters;
            const userListModel : IModelReader
        );
        destructor destroy(); override;

        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

    constructor TUserController.create(
        const beforeMiddlewares : IMiddlewareCollection;
        const afterMiddlewares : IMiddlewareCollection;
        const viewInst : IView;
        const viewParamsInst : IViewParameters;
        const userListModel : IModelReader
    );
    begin
        inherited create(beforeMiddlewares, afterMiddlewares, viewInst, viewParamsInst);
        userList := userListModel;
    end;

    destructor TUserController.destroy();
    begin
        inherited destroy();
        userList := nil;
    end;

    function TUserController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    begin
        //request user listing from storage
        userList.read();
        result := inherited handleRequest(request, response);
    end;

end.
