﻿unit uResourceGroupClient;

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
    actList: TActionList;
    ImageEnable: TImageList;
    qryRES_GRP_MSTR: TADOQuery;
    ADOConnection1: TADOConnection;
    dspRES_GRP_MSTR: TDataSetProvider;
    ToolBar1: TToolBar;
    btnNew: TToolButton;
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
    cdsRES_GRPUSE_GROUP_DEFAULTS: TBooleanField;
    qryRES_GRP_ID: TADOQuery;
    ImageDisable: TImageList;
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
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsRES_GRPCalcFields(DataSet: TDataSet);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1ColEnter(Sender: TObject);
    procedure DBGrid1ColExit(Sender: TObject);
    procedure actFirstUpdate(Sender: TObject);
    procedure actPriorUpdate(Sender: TObject);
    procedure seditOPER_COSTChange(Sender: TObject);
    procedure seditOPER_COSTEnter(Sender: TObject);
    procedure RepRecs(ipResGrpID: Integer);
    procedure btnNameClick(Sender: TObject);
    procedure btnDescriptionClick(Sender: TObject);
  private
    { Private declarations }
    OriginalOptions:TDBGridOptions;
    procedure SaveBoolean;
  public
    { Public declarations }
    procedure refreshrecord;
  end;

var
  fResGroup: TfResGroup;

implementation

{$R *.dfm}
uses AddResource,ResourceGroupFind;

procedure TfResGroup.actCancelExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.Cancel;
  btnSave.Enabled := false;
  btnCancel.Enabled := false;
  btnNew.Enabled := true;
  btnDelete.Enabled := true;
  btnFirst.Enabled := true;
  btnPrior.Enabled := true;
  btnNext.Enabled := true;
  btnLast.Enabled := true;
  btnSearch.Enabled := true;
end;

procedure TfResGroup.actCancelUpdate(Sender: TObject);
begin
  actCancel.Enabled :=cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.Modified;
end;

procedure TfResGroup.actDeleteExecute(Sender: TObject);
var
  idDelete:integer;
begin
  idDelete := Application.MessageBox(PWideChar('Are you sure you want to delete ' + cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_NAME').AsString + '?'), 'Confirm', MB_YESNO);
  //  YES - 6 NO-7
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
  //ShowMessage('Go to a subscreen to search a record.');
  fResGrpSearch.Show;
end;

procedure TfResGroup.actFirstExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.First;
end;

procedure TfResGroup.actFirstUpdate(Sender: TObject);
begin
 // disable
end;

procedure TfResGroup.actLastExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.Last;
end;

procedure TfResGroup.actNewExecute(Sender: TObject);
var
  nextid:integer;
begin
  btnSave.Enabled := true;
  btnCancel.Enabled := true;
  btnNew.Enabled := false;
  btnDelete.Enabled := false;
  btnFirst.Enabled := false;
  btnPrior.Enabled := false;
  btnNext.Enabled := false;
  btnLast.Enabled := false;
  btnSearch.Enabled := false;
  qryRES_GRP_ID.Last;
  nextid := qryRES_GRP_ID.FieldByName('RESOURCE_GROUP_ID').AsInteger + 1;
  cdsRES_GRP_MSTR.insert;
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_TYPE_CD').AsInteger := 1;
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsInteger := nextid;
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_NAME').AsString := 'New Group ' + inttostr(nextid);

end;

procedure TfResGroup.actNewUpdate(Sender: TObject);
begin
   //
end;

procedure TfResGroup.actNextExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.Next;
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
  cdsRES_GRP_MSTR.Prior;
end;

procedure TfResGroup.actPriorUpdate(Sender: TObject);
begin
  //
end;

procedure TfResGroup.actSaveExecute(Sender: TObject);
begin
  if cdsRES_GRP.RecordCount = 0 then
  begin
    ShowMessage('A group mustRecordCount contain at least one resource.');
  end
  else if cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.Modified then
  begin
    cdsRES_GRP_MSTR.ApplyUpdates(0);
    btnSave.Enabled := false;
    btnCancel.Enabled := false;
    btnNew.Enabled := true;
    btnDelete.Enabled := true;
    btnFirst.Enabled := true;
    btnPrior.Enabled := true;
    btnNext.Enabled := true;
    btnLast.Enabled := true;
    btnSearch.Enabled := true;
  end;
end;

procedure TfResGroup.actSaveUpdate(Sender: TObject);
begin
  actSave.Enabled :=cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.Modified;
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
  end
  else
  begin
    frmAddresource.cdsAddResource.Close;
    frmAddresource.qryAddResource.SQL.Clear;
    frmAddresource.qryAddResource.SQL.Add('SELECT * from RESOURCE_MSTR where RESOURCE_TYPE_CD > 0;');
    frmAddresource.cdsAddResource.Open;
  end;
  try
    frmAddresource.ShowModal;
  finally
    strResId :=  frmAddresource.strResourceId.Split(['^']);
    for i := 0 to High(strResId) do
      cdsRES_GRP.AppendRecord(['','','0','N','',strResId[i],cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').value,'','']);
    frmAddresource.Free;
  end;
end;

procedure TfResGroup.btnDescriptionClick(Sender: TObject);
begin
  cdsRES_GRP_MSTR.IndexFieldNames := 'RESOURCE_GROUP_DESC';
end;

procedure TfResGroup.btnNameClick(Sender: TObject);
begin
  cdsRES_GRP_MSTR.IndexFieldNames := 'RESOURCE_GROUP_NAME';
end;

procedure TfResGroup.cdsRES_GRPCalcFields(DataSet: TDataSet);
begin
  with cdsRES_GRP do
  begin
    if Fields[4].Value = NULL then Fields[4].AsBoolean := Fields[3].AsBoolean;
  end;
end;

procedure TfResGroup.DBGrid1CellClick(Column: TColumn);
begin
  if DBGrid1.SelectedField.FieldName = 'USE_GROUP_DEFAULTS' then
    SaveBoolean();
end;

procedure TfResGroup.DBGrid1ColEnter(Sender: TObject);
begin
  if DBGrid1.SelectedField.FieldName = 'USE_GROUP_DEFAULTS' then
  begin
    OriginalOptions := DBGrid1.Options;
    DBGrid1.Options := DBGrid1.Options - [dgEditing];
  end;
end;

procedure TfResGroup.DBGrid1ColExit(Sender: TObject);
begin
  if DBGrid1.SelectedField.FieldName = 'USE_GROUP_DEFAULTS' then
    DBGrid1.Options := OriginalOptions;
end;

procedure TfResGroup.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  if Column.Field.FieldName = 'USE_GROUP_DEFAULTS' then
  begin
    DBGrid1.Canvas.FillRect(Rect);
    DrawFrameControl(DBGrid1.Canvas.Handle,Rect,DFC_BUTTON,CtrlState[Column.Field.AsBoolean]);
  end;
end;

procedure TfResGroup.menuDescClick(Sender: TObject);
begin
   cdsRES_GRP_MSTR.IndexFieldNames := 'RESOURCE_GROUP_DESC';
end;
procedure TfResGroup.menuNameClick(Sender: TObject);
begin
   cdsRES_GRP_MSTR.IndexFieldNames := 'RESOURCE_GROUP_NAME';
end;

procedure TfResGroup.qryRES_GRP_MSTRAfterScroll(DataSet: TDataSet);
{var
  i:integer;}
begin
  if qryRES_GRP.Active then qryRES_GRP.Close;
  qryRES_GRP.Parameters[0].Value := qryRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').Value;
  qryRES_GRP.Open;
  {for i := 0 to DBGrid1.DataSource.DataSet.RecordCount do
  begin
    DBGrid1.Fields[6].DataSet.edit;
    DBGrid1.Fields[6].AsBoolean := DBGrid1.Fields[3].AsBoolean;
    DBGrid1.Fields[6].DataSet.post;
    DBGrid1.DataSource.DataSet.Next;
  end;  }
end;

procedure TfResGroup.SaveBoolean;
begin
  DBGrid1.SelectedField.DataSet.Edit;
  DBGrid1.SelectedField.AsBoolean := NOT DBGrid1.SelectedField.AsBoolean;
  DBGrid1.SelectedField.DataSet.Post;
end;

procedure TfResGroup.seditOPER_COSTChange(Sender: TObject);
begin
//  showmessage(inttostr(seditOPER_COST.Value));
//  cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').asFloat := seditOPER_COST.Value;

end;

procedure TfResGroup.seditOPER_COSTEnter(Sender: TObject);
//var
//  opercost:real;
begin
//  showmessage(inttostr(seditOPER_COST.Value));
end;

procedure TfResGroup.RepRecs(ipResGrpID: Integer);
begin
  ShowMessage('back in main form with ID:' + IntToStr(ipResGrpID) + ', CURRENT RecNo:' + cdsRES_GRP_MSTR.RecNo.ToString);
  if not cdsRES_GRP_MSTR.Active then
    cdsRES_GRP_MSTR.Open;
   //cdsRES_GRP_MSTR.Locate('RESOURCE_GROUP_ID',ipResGrpID,[]);
  cdsRES_GRP_MSTR.Locate('RESOURCE_GROUP_ID',24, [loCaseInsensitive]);

  ShowMessage('locate with ID:' + IntToStr(ipResGrpID) + ', CURRENT RecNo:' +  cdsRES_GRP_MSTR.RecNo.ToString);
  seditOPER_COST.Value := 888;
  fResGroup.Refresh;
   //cdsRES_GRP_MSTR.MoveBy(cdsRES_GRP_MSTR.RecNo);

   //cdsRES_GRP_MSTR.GotoCurrent();
end;

procedure TfResGroup.refreshrecord();
begin
  //with cdsRES_GRP_MSTR do

  cdsRES_GRP_MSTR.Locate('RESOURCE_GROUP_ID',24,[]);
  ShowMessage('call refreshrecord == suceed:');
end;
end.
