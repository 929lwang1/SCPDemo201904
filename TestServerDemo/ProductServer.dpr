program ProductServer;

uses
  Vcl.Forms,
  uProductServer in 'uProductServer.pas' {Form6},
  ProductServer_TLB in 'ProductServer_TLB.pas',
  uProductModule in 'uProductModule.pas' {Product: TRemoteDataModule} {Product: CoClass};

{$R *.TLB}

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
