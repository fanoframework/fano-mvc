(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit UserListingView;

interface

uses

    fano;

type

    (*!-----------------------------------------------
     * View instance for user listing page
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    TUserListingView = class(TInterfacedObject, IView)
    private
        userModel : IModelReader;
    public
        constructor create(const usr : IModelReader);
        destructor destroy(); override;

        (*!------------------------------------------------
         * render view
         *------------------------------------------------
         * @param viewParams view parameters
         * @param response response instance
         * @return response
         *-----------------------------------------------*)
        function render(
            const viewParams : IViewParameters;
            const response : IResponse
        ) : IResponse;
    end;

implementation

    constructor TUserListingView.create(const usr : IModelReader);
    begin
        userModel := usr;
    end;

    destructor TUserListingView.destroy();
    begin
        inherited destroy();
        userModel := nil;
    end;

    (*!------------------------------------------------
     * render view
     *------------------------------------------------
     * @param viewParams view parameters
     * @param response response instance
     * @return response
     *-----------------------------------------------*)
    function TUserListingView.render(
        const viewParams : IViewParameters;
        const response : IResponse
    ) : IResponse;
    var userData : IModelResultSet;
        respBody : IResponseStream;
    begin
        userData := userModel.data();
        respBody := response.body();
        if (userData.count() > 0) then
        begin
            respBody.write(
                '<div class="container has-text-centered">' +
                '<div class="column">' +
                '<table class="table is-fullwidth is-hoverable">' +
                '<thead>' +
                  '<tr>' +
                  '  <th>No</th>' +
                  '  <th>Name</th>' +
                  '  <th>Email</th>' +
                  '</tr>' +
                '</thead><tbody>'
            );
            while not userData.eof() do
            begin
                respBody.write(
                    '<tr>' +
                    '<td>' + userData.readString('id') + '</td>' +
                    '<td>' + userData.readString('name') + '</td>' +
                    '<td>' + userData.readString('email') + '</td>' +
                    '</tr>'
                );
                userData.next();
            end;
            respBody.write('</tbody></table></div></div>');
        end;
        result := response;
    end;

end.
