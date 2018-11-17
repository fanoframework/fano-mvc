(*!------------------------------------------------------------
 * Fano Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-app-views
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-app-views/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit UserModel;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano,
    fpjson;

type

    (*!-----------------------------------------------
     * model that load data from static json file
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    TUserModel = class(TInterfacedObject, IModelReader, IModelReadOnlyData, IDependency)
    private
        jsonData : TJSONData;
        jsonFilename : string;
        cursorPtr : integer;
    public
        constructor create(const jsonDataSrc : string);
        destructor destroy(); override;

        function read(const params : IModelWriteOnlyData = nil) : IModelReadOnlyData;
        function data() : IModelReadOnlyData;

        (*!------------------------------------------------
         * get total data
         *-----------------------------------------------
         * @return total data
         *-----------------------------------------------*)
        function count() : integer;

        (*!------------------------------------------------
         * move data pointer to next record
         *-----------------------------------------------
         * @return true if successful, false if no more record
         *-----------------------------------------------*)
        function next() : boolean;

        (*!------------------------------------------------
         * read data from current active record by its name
         *-----------------------------------------------
         * @return value in record
         *-----------------------------------------------*)
        function readString(const key : string) : string;
    end;

implementation

uses

    Classes,
    SysUtils,
    jsonparser;

    constructor TUserModel.create(const jsonDataSrc : string);
    begin
        jsonData := nil;
        jsonFilename := jsonDataSrc;
        cursorPtr := -1;
    end;

    destructor TUserModel.destroy();
    begin
        inherited destroy();
        jsonData.free();
    end;

    function TUserModel.read(
        const params : IModelWriteOnlyData = nil
    ) : IModelReadOnlyData;
    var fstr : TFileStream;
    begin
        fstr:= TFileStream.create(jsonFilename, fmOpenRead or fmShareDenyWrite);
        try
          jsonData := getJSON(fstr);
          cursorPtr := -1;
        finally
            fstr.free();
        end;
        result := self;
    end;

    function TUserModel.data() : IModelReadOnlyData;
    begin
        result := self;
    end;

    (*!------------------------------------------------
     * get total data
     *-----------------------------------------------
     * @return total data
     *-----------------------------------------------*)
    function TUserModel.count() : integer;
    begin
        result := jsonData.findPath('totalRecords').asInteger;
    end;

    (*!------------------------------------------------
     * move data pointer to next record
     *-----------------------------------------------
     * @return true if successful, false if no more record
     *-----------------------------------------------*)
    function TUserModel.next() : boolean;
    var totalRecord : integer;
    begin
        result := false;
        totalRecord := count();
        if ((totalRecord > 0) and (cursorPtr < totalRecord-1)) then
        begin
            inc(cursorPtr);
            result := true;
        end;
    end;

    (*!------------------------------------------------
     * read data from current active record by its name
     *-----------------------------------------------
     * @return value in record
     *-----------------------------------------------*)
    function TUserModel.readString(const key : string) : string;
    begin
        result := jsonData.findPath('records['+ intToStr(cursorPtr)+ '].' + key).asString;
    end;
end.
