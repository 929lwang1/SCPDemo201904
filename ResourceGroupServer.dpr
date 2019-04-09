program ResourceGroupServer;

uses
  Vcl.Forms,
  uResourceGroupServer in 'C:\Users\lwang1\Documents\Embarcadero\Studio\Projects\uResourceGroupServer.pas' {Form7},
  ResourceGroupServer_TLB in 'ResourceGroupServer_TLB.pas',
  uResourceGroupModule in 'C:\Users\lwang1\Documents\Embarcadero\Studio\Projects\uResourceGroupModule.pas' {ResourceGroup: TRemoteDataModule} {ResourceGroup: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
