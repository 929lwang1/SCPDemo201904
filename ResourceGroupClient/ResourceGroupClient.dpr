program ResourceGroupClient;

uses
  Vcl.Forms,
  uResourceGroupClient in 'uResourceGroupClient.pas' {fResGroup};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfResGroup, fResGroup);
  Application.Run;
end.
