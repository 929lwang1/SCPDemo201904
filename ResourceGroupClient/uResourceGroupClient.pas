unit uResourceGroupClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.DBCtrls, Datasnap.Provider, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Mask, Datasnap.DBClient;

type
  TForm7 = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    New1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    Save1: TMenuItem;
    Cancel1: TMenuItem;
    N2: TMenuItem;
    Exit1: TMenuItem;
    Search1: TMenuItem;
    Find1: TMenuItem;
    N3: TMenuItem;
    OrderBy1: TMenuItem;
    Goto1: TMenuItem;
    First1: TMenuItem;
    Prior1: TMenuItem;
    Next1: TMenuItem;
    Last1: TMenuItem;
    ActionList1: TActionList;
    ImageList1: TImageList;
    qryRES_GRP_MSTR: TADOQuery;
    ADOConnection1: TADOConnection;
    dspRES_GRP_MSTR: TDataSetProvider;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Panel2: TPanel;
    Label6: TLabel;
    Label4: TLabel;
    DBComboBox1: TDBComboBox;
    Defaults: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    cdsRES_GRP_MSTR: TClientDataSet;
    dsRES_GRP_MSTR_cds: TDataSource;
    qryUTL_TYPE_MSTR: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

end.
