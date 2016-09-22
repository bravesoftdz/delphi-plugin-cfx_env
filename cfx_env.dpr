library cfx_env;

uses
  Windows,
  SysUtils,
  StrUtils,
  Classes,
  cfxapid;

function GetEnv(const Name: string): string;
var
Len: integer;
W : String;
begin
Result := '';
SetLength(W,1);
Len := Windows.GetEnvironmentVariable(PChar(Name), PChar(W), 1);
if Len > 0 then
begin
SetLength(Result, Len - 1);
Windows.GetEnvironmentVariable(PChar(Name), PChar(Result), Len);
end;
end;

procedure ProcessTagRequest(CF: TCFXRequest); export; cdecl;
var
  list: TCFXStringSet;
  i: integer;
  key: string;
  val: string;
begin
  list := CF.GetAttributeList;

  CF.SetVariable(pchar('env.currentdir'),pchar(GetCurrentDir()));

  for i:=1 to list.GetCount do begin
    key := strpas(list.GetString(i));
    if (key<>'') and (not AnsiStartsText('_',key)) then begin
      CF.SetVariable(pchar('env.'+key),pchar(getenv(key)));
    end;
    val := CF.GetAttribute(pchar(key));

    // if val is not 'true', then set env var to val
    if ( StrComp(pchar(val),pchar('true'))<>0 ) then begin
      SetEnvironmentVariable(pchar(key), pchar(val));
      CF.SetVariable(pchar('env.'+key),pchar(getenv(key)));
    end;

  end;

  // TODO : if no attributes, then get all, GetEnvironmentStrings
  //        actually, that's not right

end;

exports ProcessTagRequest;

begin
end.
