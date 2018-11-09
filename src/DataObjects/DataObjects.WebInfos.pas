unit DataObjects.WebInfos;

interface

type
  /// <summary>Web���N���X�B</summary>
  TWebInfo = class
  private
    FURL: string;
    FContent: string;
    procedure SetURL(const Value: string);
    procedure SetContent(const Value: string);
  public
    /// <summary>URL�B</summary>
    property URL: string read FURL write SetURL;
    /// <summary>�R���e���c������B</summary>
    property Content: string read FContent write SetContent;
  end;

implementation

procedure TWebInfo.SetContent(const Value: string);
begin
  FContent := Value;
end;

procedure TWebInfo.SetURL(const Value: string);
begin
  FURL := Value;
end;

end.
