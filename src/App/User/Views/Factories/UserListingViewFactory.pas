(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit UserListingViewFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller TUserListingView
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
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
    CompositeView,
    UserListingView;

    function TUserListingViewFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := TCompositeView.create(
            container.get('headerView') as IView,
            TUserListingView.create(container.get('user.list') as IModelReader),
            container.get('footerView') as IView
        );
    end;
end.
