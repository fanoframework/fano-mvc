(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit UserModelFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for model TUserModel
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TUserModelFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    SysUtils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    UserModel;

    function TUserModelFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        result := TUserModel.create(extractFileDir(getCurrentDir()) + '/src/App/User/Models/users.json');
    end;
end.
