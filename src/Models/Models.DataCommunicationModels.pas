unit Models.DataCommunicationModels;

interface

uses
  System.SysUtils,
  IdIOHandler,
  IdSSLOpenSSL,
  IdHTTP,
  IdCompressorZLib;

type
  /// <summary>�f�[�^�ʐM�pModel�B</summary>
  TDataCommunicationModel = class
  public
    /// <summary>�R���e���c���擾����B</summary>
    /// <param name="URL">URL������B</param>
    /// <returns>�R���e���c�̕������Ԃ��B</returns>
    class function GetContent(URL: string): string;
  end;

implementation

class function TDataCommunicationModel.GetContent(URL: string): string;
var
  http: TIdHTTP;
  sslIoHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
  Result := '';

  http := TIdHTTP.Create;
  sslIoHandler := TIdSSLIOHandlerSocketOpenSSL.Create(http);
  try
    sslIoHandler.SSLOptions.SSLVersions := [sslvTLSv1_1, sslvTLSv1_2];
    sslIoHandler.SSLOptions.Method := sslvTLSv1_2;

    http.IOHandler := sslIoHandler;

    http.Compressor := TIdCompressorZLib.Create(http);

    http.HandleRedirects := True;

    Result := http.Get(URL);
  finally
    FreeAndNil(http);
  end;
end;

end.
