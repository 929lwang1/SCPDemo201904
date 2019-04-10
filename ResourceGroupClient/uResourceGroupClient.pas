unit uResourceGroupClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.DBCtrls, Datasnap.Provider, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Mask, Datasnap.DBClient;

type
  TfResGroup = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    menuNew: TMenuItem;
    menuDelete: TMenuItem;
    N1: TMenuItem;
    menuSave: TMenuItem;
    menuCancel: TMenuItem;
    N2: TMenuItem;
    menuExit: TMenuItem;
    Search1: TMenuItem;
    menuFind: TMenuItem;
    N3: TMenuItem;
    menuOrderBy: TMenuItem;
    menuGoto: TMenuItem;
    menuFirst: TMenuItem;
    menuPrior: TMenuItem;
    menuNext: TMenuItem;
    menuLast: TMenuItem;
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
    actNew: TAction;
    actDelete: TAction;
    actSave: TAction;
    actCancel: TAction;
    actExit: TAction;
    menuName: TMenuItem;
    menuDesc: TMenuItem;
    actFind: TAction;
    actOrdByName: TAction;
    actOrdByDesc: TAction;
    actFirst: TAction;
    actPrior: TAction;
    actNext: TAction;
    actLast: TAction;
    procedure actNewExecute(Sender: TObject);
    procedure actNewUpdate(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actDeleteUpdate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actSaveUpdate(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actCancelUpdate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actOrdByNameExecute(Sender: TObject);
    procedure actOrdByDescExecute(Sender: TObject);
    procedure actLastExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actFirstExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fResGroup: TfResGroup;

implementation

{$R *.dfm}

procedure TfResGroup.actCancelExecute(Sender: TObject);
begin
   ShowMessage('Cancel update.');
end;

procedure TfResGroup.actCancelUpdate(Sender: TObject);
begin
   //ShowMessage('Set when Cancel button is enabled.');
end;

procedure TfResGroup.actDeleteExecute(Sender: TObject);
begin
   ShowMessage('prepare to delete a record.');
end;

procedure TfResGroup.actDeleteUpdate(Sender: TObject);
begin
   //ShowMessage('Set when DELETE button is enabled.');
end;

procedure TfResGroup.actExitExecute(Sender: TObject);
begin
   fResGroup.Close;
end;

procedure TfResGroup.actFindExecute(Sender: TObject);
begin
   ShowMessage('Go to a subscreen to search a record.');
end;

procedure TfResGroup.actFirstExecute(Sender: TObject);
begin
   ShowMessage('Find FIRST record.');
end;

procedure TfResGroup.actLastExecute(Sender: TObject);
begin
   ShowMessage('Find last record.');
end;

procedure TfResGroup.actNewExecute(Sender: TObject);
begin
   ShowMessage('Create a new record.');
end;

procedure TfResGroup.actNewUpdate(Sender: TObject);
begin
   //ShowMessage('Set when New button is enabled.');
end;

procedure TfResGroup.actNextExecute(Sender: TObject);
begin
   ShowMessage('Find NEXT record.');
end;

procedure TfResGroup.actOrdByDescExecute(Sender: TObject);
begin
   ShowMessage('set query order by Descrition for navigation');
end;

procedure TfResGroup.actOrdByNameExecute(Sender: TObject);
begin
   ShowMessage('set query order by name for navigation');
end;

procedure TfResGroup.actPriorExecute(Sender: TObject);
begin
   ShowMessage('Find PRIOR record.');
end;

procedure TfResGroup.actSaveExecute(Sender: TObject);
begin
   ShowMessage('Save update.');
end;

procedure TfResGroup.actSaveUpdate(Sender: TObject);
begin
   //ShowMessage('Set when Save button is enabled.');
end;

end.
