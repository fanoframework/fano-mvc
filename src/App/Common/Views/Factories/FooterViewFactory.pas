(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit FooterViewFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for header view
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TFooterViewFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    SysUtils;

    function TFooterViewFactory.build(const container : IDependencyContainer) : IDependency;
    var fileReader : IFileReader;
    begin
        fileReader := container.get('fileReader') as IFileReader;
        result := TView.create(
            container.get('templateParser') as ITemplateParser,
            fileReader.readFile(
                extractFileDir(getCurrentDir()) + '/src/Templates/footer.html'
            )
        );
    end;
end.
