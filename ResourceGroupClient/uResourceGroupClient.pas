unit uResourceGroupClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.DBCtrls, Datasnap.Provider, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Mask, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.Samples.Spin;

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
    btnDelete: TToolButton;
    ToolButton3: TToolButton;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    ToolButton6: TToolButton;
    btnExit: TToolButton;
    ToolButton8: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Panel2: TPanel;
    cdsRES_GRP_MSTR: TClientDataSet;
    dsRES_GRP_MSTR_cds: TDataSource;
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
    dsUTL_TYPE_MSTR_cds: TDataSource;
    dspRES_MSTR: TDataSetProvider;
    qryRES_MSTR: TADOQuery;
    qryRES_GRP: TADOQuery;
    cdsRES_GRP: TClientDataSet;
    qryUTL_TYPE_MSTR: TADOQuery;
    DBLookupComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    dsRES_GRP_cds: TDataSource;
    qryRES_GRPRESOURCE_GROUP_ID: TIntegerField;
    qryRES_GRPRESOURCE_ID: TIntegerField;
    qryRES_GRPUSE_GROUP_SETTINGS_IND: TWideStringField;
    qryRES_GRPPRIORITY_INDEX: TIntegerField;
    cdsRES_GRPRESOURCE_GROUP_ID: TIntegerField;
    cdsRES_GRPRESOURCE_ID: TIntegerField;
    cdsRES_GRPResouceName: TStringField;
    cdsRES_GRPUSE_GROUP_SETTINGS_IND2: TWideStringField;
    cdsRES_GRPPRIORITY_INDEX: TIntegerField;
    cdsRES_GRPResourceDescription: TStringField;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label4: TLabel;
    dbeditPRE_TIME: TDBEdit;
    Label6: TLabel;
    dbeditCLEANUP_TIME: TDBEdit;
    dbeditDAILY_PRE_TIME: TDBEdit;
    Label8: TLabel;
    dbeditDAILY_CLEANUP_TIME: TDBEdit;
    seditOPER_COST: TSpinEdit;
    btnFirst: TToolButton;
    btnPrior: TToolButton;
    btnNext: TToolButton;
    btnLast: TToolButton;
    ToolButton13: TToolButton;
    StatusBar1: TStatusBar;
    DBNavigator1: TDBNavigator;
    dsRES_GRP_MSTR: TDataSource;
    qryRES_GRP_MSTRRESOURCE_GROUP_ID: TIntegerField;
    qryRES_GRP_MSTRRESOURCE_GROUP_NAME: TWideStringField;
    qryRES_GRP_MSTRRESOURCE_TYPE_CD: TSmallintField;
    qryRES_GRP_MSTRRESOURCE_GROUP_DESC: TWideStringField;
    qryRES_GRP_MSTRUTILIZATION_TYPE_CD: TSmallintField;
    qryRES_GRP_MSTROPERATION_COST: TFMTBCDField;
    qryRES_GRP_MSTRPREP_TIME: TFMTBCDField;
    qryRES_GRP_MSTRCLEANUP_TIME: TFMTBCDField;
    qryRES_GRP_MSTRDAILY_STARTUP_TIME: TFMTBCDField;
    qryRES_GRP_MSTRDAILY_CLEANUP_TIME: TFMTBCDField;
    cdsRES_GRP_MSTRRESOURCE_GROUP_ID: TIntegerField;
    cdsRES_GRP_MSTRRESOURCE_GROUP_NAME: TWideStringField;
    cdsRES_GRP_MSTRRESOURCE_TYPE_CD: TSmallintField;
    cdsRES_GRP_MSTRRESOURCE_GROUP_DESC: TWideStringField;
    cdsRES_GRP_MSTRUTILIZATION_TYPE_CD: TSmallintField;
    cdsRES_GRP_MSTROPERATION_COST: TFMTBCDField;
    cdsRES_GRP_MSTRPREP_TIME: TFMTBCDField;
    cdsRES_GRP_MSTRCLEANUP_TIME: TFMTBCDField;
    cdsRES_GRP_MSTRDAILY_STARTUP_TIME: TFMTBCDField;
    cdsRES_GRP_MSTRDAILY_CLEANUP_TIME: TFMTBCDField;
    cdsRES_GRP_MSTRqryRES_GRP: TDataSetField;
    btnSearch: TToolButton;
    btnOrderBy: TToolButton;
    cbxPRE_TIME: TComboBox;
    ComboBox2: TComboBox;
    cbxDAILY_CLEANUP_TIME: TComboBox;
    cbxDAILY_PRE_TIME: TComboBox;
    PopupMenu1: TPopupMenu;
    btnName: TMenuItem;
    btnDescription: TMenuItem;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    btnAdd: TButton;
    btnRemove: TButton;
    cdsRES_GRPLOC_ID: TIntegerField;
    cdsRES_GRPRESOURCE_TYPE_CD: TIntegerField;
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
    procedure qryRES_GRP_MSTRAfterScroll(DataSet: TDataSet);
    procedure menuNameClick(Sender: TObject);
    procedure menuDescClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fResGroup: TfResGroup;

implementation

{$R *.dfm}
uses AddResource,ResourceGroupFind;

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
   fResGrpSearch.Show;
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


procedure TfResGroup.btnAddClick(Sender: TObject);
var strResId: TArray<string>;
    i :Integer;
begin
   frmAddresource :=  TfrmAddresource.Create(self);
   if cdsRES_GRP.RecordCount > 0 then
   begin
      frmAddresource.cdsAddResource.Close;
      frmAddresource.qryAddResource.Parameters[0].Value := cdsRES_GRP.FieldByName('LOC_ID').Value;
      frmAddresource.qryAddResource.Parameters[1].Value := cdsRES_GRP.FieldByName('RESOURCE_TYPE_CD').Value;
      frmAddresource.cdsAddResource.Open;
   end;
   try
      frmAddresource.ShowModal;
   finally
      strResId :=  frmAddresource.strResourceId.Split(['^']);
      for i := 0 to High(strResId) do
         cdsRES_GRP.AppendRecord(['','','0','',strResId[i],cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').value,'','']);
      frmAddresource.Free;
   end;
end;

procedure TfResGroup.menuDescClick(Sender: TObject);
var RecNo:Integer;
begin
   RecNo := cdsRES_GRP_MSTR.RecNo;
   cdsRES_GRP_MSTR.Close;
   cdsRES_GRP_MSTR.IndexFieldNames := 'RESOURCE_GROUP_DESC';
   cdsRES_GRP_MSTR.Open;
   cdsRES_GRP_MSTR.MoveBy(RecNo);
end;
procedure TfResGroup.menuNameClick(Sender: TObject);
var RecNo:Integer;
begin
   RecNo := cdsRES_GRP_MSTR.RecNo;
   cdsRES_GRP_MSTR.Close;
   cdsRES_GRP_MSTR.IndexFieldNames := 'RESOURCE_GROUP_NAME';
   cdsRES_GRP_MSTR.Open;
   cdsRES_GRP_MSTR.MoveBy(RecNo);
end;

procedure TfResGroup.qryRES_GRP_MSTRAfterScroll(DataSet: TDataSet);
begin
  if qryRES_GRP.Active then qryRES_GRP.Close;
  qryRES_GRP.Parameters[0].Value := qryRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').Value;
  qryRES_GRP.Open;
end;
end.
