program ResourceGroupServer;

uses
  Vcl.Forms,
  uResourceGroupServer in 'uResourceGroupServer.pas' {Form7},
  ResourceGroupServer_TLB in 'ResourceGroupServer_TLB.pas',
  uResourceGroupBuild in 'uResourceGroupBuild.pas' {ResourceGroup: TRemoteDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
