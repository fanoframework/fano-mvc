(*!------------------------------------------------------------
 * Fano MVC Sample Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-mvc.git
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-mvc/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit FooterViewFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for footer view
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
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
