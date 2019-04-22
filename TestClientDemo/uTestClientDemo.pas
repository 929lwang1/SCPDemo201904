unit uTestClientDemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Datasnap.Win.MConnect, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TForm4 = class(TForm)
    dcomconnMain: TDCOMConnection;
    DBGrid1: TDBGrid;
    dsRES_GRP_MSTR_cds: TDataSource;
    cdsRES_GRP_MSTR: TClientDataSet;
    DBNavigator1: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

end.
