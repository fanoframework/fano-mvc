(*!------------------------------------------------------------
 * Fano MVC Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc.git
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit CompositeView;

interface

uses

    fano;

type

    (*!-----------------------------------------------
     * view that is compose from several view
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    TCompositeView = class(TInterfacedObject, IView, IDependency)
    private
        headerView : IView;
        contentView : IView;
        footerView : IView;
    public
        constructor create(
            const headerViewInst : IView;
            const contentViewInst : IView;
            const footerViewInst : IView
        );
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

    constructor TCompositeView.create(
        const headerViewInst : IView;
        const contentViewInst : IView;
        const footerViewInst : IView
    );
    begin
        headerView := headerViewInst;
        contentView := contentViewInst;
        footerView := footerViewInst;
    end;

    destructor TCompositeView.destroy();
    begin
        inherited destroy();
        headerView := nil;
        contentView := nil;
        footerView := nil;
    end;

    (*!------------------------------------------------
     * render view
     *------------------------------------------------
     * @param viewParams view parameters
     * @param response response instance
     * @return response
     *-----------------------------------------------*)
    function TCompositeView.render(
        const viewParams : IViewParameters;
        const response : IResponse
    ) : IResponse;
    var resp :IResponse;
    begin
        resp := headerView.render(viewParams, response);
        resp := contentView.render(viewParams, resp);
        result := footerView.render(viewParams, resp);
    end;

end.
