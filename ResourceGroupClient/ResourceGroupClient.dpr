program ResourceGroupClient;

uses
  Vcl.Forms,
  uResourceGroupClient in 'uResourceGroupClient.pas' {fResGroup},
  ResourceGroupFind in 'ResourceGroupFind.pas' {fResGrpSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfResGroup, fResGroup);
  Application.CreateForm(TfResGroup, fResGroup);
  Application.CreateForm(TfResGrpSearch, fResGrpSearch);
  Application.Run;
end.
