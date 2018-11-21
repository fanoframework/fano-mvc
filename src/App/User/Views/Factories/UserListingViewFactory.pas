(*!------------------------------------------------------------
 * Fano MVC Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc.git
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit UserListingViewFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for view TUserListingView
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    TUserListingViewFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    SysUtils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    UserListingView;

    function TUserListingViewFactory.build(const container : IDependencyContainer) : IDependency;
    var headerAndContentView : IView;
    begin
        //TCompositeView can only compose from two views
        //We need to display three views: header part, main content, and footer
        //so we need to daisy-chained two composite view
        headerAndContentView := TCompositeView.create(
            container.get('headerView') as IView,
            TUserListingView.create(container.get('user.list') as IModelReader)
        );
        result := TCompositeView.create(
            headerAndContentView,
            container.get('footerView') as IView
        );
    end;
end.
