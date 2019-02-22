(*!------------------------------------------------------------
 * Fano Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
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
    TUserModel = class(TInterfacedObject, IModelReader, IModelResultSet, IDependency)
    private
        jsonData : TJSONData;
        jsonFilename : string;
        cursorPtr : integer;
    public
        constructor create(const jsonDataSrc : string);
        destructor destroy(); override;

        function read(const params : IModelParams = nil) : IModelResultSet;
        function data() : IModelResultSet;

        (*!------------------------------------------------
         * get total data
         *-----------------------------------------------
         * @return total data
         *-----------------------------------------------*)
        function count() : int64;

        (*!------------------------------------------------
         * test if in end of result set
         *-----------------------------------------------
         * @return true if no more record
         *-----------------------------------------------*)
        function eof() : boolean;

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
        const params : IModelParams = nil
    ) : IModelResultSet;
    var fstr : TFileStream;
    begin
        fstr:= TFileStream.create(jsonFilename, fmOpenRead or fmShareDenyWrite);
        try
          jsonData := getJSON(fstr);
          cursorPtr := 0;
        finally
            fstr.free();
        end;
        result := self;
    end;

    function TUserModel.data() : IModelResultSet;
    begin
        result := self;
    end;

    (*!------------------------------------------------
     * get total data
     *-----------------------------------------------
     * @return total data
     *-----------------------------------------------*)
    function TUserModel.count() : int64;
    begin
        result := jsonData.findPath('totalRecords').asInteger;
    end;

    (*!------------------------------------------------
     * test if in end of result set
     *-----------------------------------------------
     * @return true if no more record
     *-----------------------------------------------*)
    function TUserModel.eof() : boolean;
    var totalRecord : integer;
    begin
        totalRecord := count();
        result := not (
            (cursorPtr >= 0) and
            (totalRecord > 0) and
            (cursorPtr < totalRecord)
        );
    end;

    (*!------------------------------------------------
     * move data pointer to next record
     *-----------------------------------------------
     * @return true if successful, false if no more record
     *-----------------------------------------------*)
    function TUserModel.next() : boolean;
    begin
        inc(cursorPtr);
        result := true;
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
