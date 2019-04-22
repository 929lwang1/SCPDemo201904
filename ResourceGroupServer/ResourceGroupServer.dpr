program ResourceGroupServer;

uses
  Vcl.Forms,MidasLib,
  uResourceGroupServer in 'uResourceGroupServer.pas' {Form9},
  ResourceGroupServer_TLB in 'ResourceGroupServer_TLB.pas',
  uServer in 'uServer.pas' {RGS: TRemoteDataModule} {RGS: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
