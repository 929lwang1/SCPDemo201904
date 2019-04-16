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
    actList: TActionList;
    ImageEnable: TImageList;
    qryRES_GRP_MSTR: TADOQuery;
    ADOConnection1: TADOConnection;
    dspRES_GRP_MSTR: TDataSetProvider;
    tbarTop: TToolBar;
    btnNew: TToolButton;
    btnDelete: TToolButton;
    btnSave: TToolButton;
    btnCancel: TToolButton;
    separator2: TToolButton;
    btnExit: TToolButton;
    separator3: TToolButton;
    panelMainDesc: TPanel;
    lblName: TLabel;
    dbeName: TDBEdit;
    lblDesc: TLabel;
    dbeDesc: TDBEdit;
    lblUtilType: TLabel;
    panelTimeParam: TPanel;
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
    dblkcbxUtilType: TDBLookupComboBox;
    dbgridResource: TDBGrid;
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
    grpbxTimeParam: TGroupBox;
    lblOperCost: TLabel;
    lblPrepTime: TLabel;
    lblCleanTime: TLabel;
    lblDailyCleanTime: TLabel;
    seditOPER_COST: TSpinEdit;
    btnFirst: TToolButton;
    btnPrior: TToolButton;
    btnNext: TToolButton;
    btnLast: TToolButton;
    sbarBottom: TStatusBar;
    dsRES_GRP_MSTR: TDataSource;
    qryRES_GRP_MSTRRESOURCE_GROUP_ID: TIntegerField;
    qryRES_GRP_MSTRRESOURCE_GROUP_NAME: TWideStringField;
    qryRES_GRP_MSTRRESOURCE_TYPE_CD: TSmallintField;
    qryRES_GRP_MSTRRESOURCE_GROUP_DESC: TWideStringField;
    qryRES_GRP_MSTRUTILIZATION_TYPE_CD: TSmallintField;
    qryRES_GRP_MSTROPERATION_COST: TFloatField;
    qryRES_GRP_MSTRPREP_TIME: TFloatField;
    qryRES_GRP_MSTRCLEANUP_TIME: TFloatField;
    qryRES_GRP_MSTRDAILY_STARTUP_TIME: TFloatField;
    qryRES_GRP_MSTRDAILY_CLEANUP_TIME: TFloatField;
    cdsRES_GRP_MSTRRESOURCE_GROUP_ID: TIntegerField;
    cdsRES_GRP_MSTRRESOURCE_GROUP_NAME: TWideStringField;
    cdsRES_GRP_MSTRRESOURCE_TYPE_CD: TSmallintField;
    cdsRES_GRP_MSTRRESOURCE_GROUP_DESC: TWideStringField;
    cdsRES_GRP_MSTRUTILIZATION_TYPE_CD: TSmallintField;
    cdsRES_GRP_MSTROPERATION_COST: TFloatField;
    cdsRES_GRP_MSTRPREP_TIME: TFloatField;
    cdsRES_GRP_MSTRCLEANUP_TIME: TFloatField;
    cdsRES_GRP_MSTRDAILY_STARTUP_TIME: TFloatField;
    cdsRES_GRP_MSTRDAILY_CLEANUP_TIME: TFloatField;
    cdsRES_GRP_MSTRqryRES_GRP: TDataSetField;
    btnSearch: TToolButton;
    btnOrderBy: TToolButton;
    cbxCLEANUP_TIME: TComboBox;
    cbxDAILY_CLEANUP_TIME: TComboBox;
    cbxDAILY_PRE_TIME: TComboBox;
    pMenuOrdBy: TPopupMenu;
    btnName: TMenuItem;
    btnDescription: TMenuItem;
    separator6: TToolButton;
    cdsRES_GRPLOC_ID: TIntegerField;
    cdsRES_GRPRESOURCE_TYPE_CD: TIntegerField;
    cdsRES_GRPUSE_GROUP_DEFAULTS: TBooleanField;
    qryRES_GRP_ID: TADOQuery;
    ImageDisable: TImageList;
    txtCLEANUP_TIME: TEdit;
    txtDAILY_CLEANUP_TIME: TEdit;
    actAdd: TAction;
    actRemove: TAction;
    lblDailyPrepTime: TLabel;
    separator1: TToolButton;
    separator4: TToolButton;
    separator5: TToolButton;
    txtDAILY_STARTUP_TIME: TEdit;
    txtPREP_TIME: TEdit;
    cbxPRE_TIME: TComboBox;
    panelResGrpOper: TPanel;
    btnAdd: TButton;
    btnRemove: TButton;
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
    procedure actLastExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actFirstExecute(Sender: TObject);
    procedure qryRES_GRP_MSTRAfterScroll(DataSet: TDataSet);
    procedure menuNameClick(Sender: TObject);
    procedure menuDescClick(Sender: TObject);
    procedure dbgridResourceDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsRES_GRPCalcFields(DataSet: TDataSet);
    procedure dbgridResourceCellClick(Column: TColumn);
    procedure dbgridResourceColEnter(Sender: TObject);
    procedure dbgridResourceColExit(Sender: TObject);
    procedure seditOPER_COSTChange(Sender: TObject);
    //procedure RepRecs(ipResGrpID: Integer);
    procedure cdsRES_GRP_MSTRAfterScroll(DataSet: TDataSet);
    procedure cbxPRE_TIMEChange(Sender: TObject);
    procedure cbxDAILY_PRE_TIMEChange(Sender: TObject);
    procedure cbxCLEANUP_TIMEChange(Sender: TObject);
    procedure cbxDAILY_CLEANUP_TIMEChange(Sender: TObject);
	  procedure actFirstUpdate(Sender: TObject);
    procedure actPriorUpdate(Sender: TObject);
    procedure actNextUpdate(Sender: TObject);
    procedure actLastUpdate(Sender: TObject);
	  procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actOrdByNameExecute(Sender: TObject);
    procedure actOrdByDescExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actRemoveExecute(Sender: TObject);
    procedure txtDAILY_STARTUP_TIMEChange(Sender: TObject);
  private
    { Private declarations }
    FallowMultiSelect: boolean;
    OriginalOptions:TDBGridOptions;
    procedure SaveBoolean;
    procedure calPRE_TIME;
    procedure calDAILY_CLEANUP_TIME;
    procedure calDAILY_PRE_TIME;
    procedure calCLEANUP_TIME;
    procedure SetallowMultiSelect(Value: boolean);
  public
    { Public declarations }
    property allowMultiSelect: boolean read FallowMultiSelect write SetallowMultiSelect;
     //procedure refreshrecord;
  end;

var
  fResGroup: TfResGroup;
  currentid:integer;
  priorid:integer;
  nextid:integer;

implementation

{$R *.dfm}
uses AddResource,ResourceGroupFind;

procedure TfResGroup.actCancelExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.Cancel;
  actNew.Enabled :=true;
  actDelete.Enabled :=true;
  actFirst.Enabled :=true;
  actPrior.Enabled := true;
  actNext.Enabled := true;
  actLast.Enabled :=true;
end;

procedure TfResGroup.actCancelUpdate(Sender: TObject);
begin
  if cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.Modified then
    actCancel.Enabled :=true;
end;

procedure TfResGroup.actDeleteExecute(Sender: TObject);
begin
  case MessageDlg('Are you sure you want to delete ' + cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_NAME').AsString + '?', mtConfirmation, [mbYes, mbNo], 0) of
  mrYes:
    begin
      cdsRES_GRP_MSTR.Delete;
      cdsRES_GRP_MSTR.ApplyUpdates(0);
      ShowMessage('Record is deleted successfully.');
    end;
  mrNo:
    begin
      ShowMessage('Delete operation is cancelled.');
    end;
  end;
end;

procedure TfResGroup.actDeleteUpdate(Sender: TObject);
begin
  if cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.Modified then
    actDelete.Enabled :=False;
end;

procedure TfResGroup.actExitExecute(Sender: TObject);
var
  idexit:integer;
begin
  if cdsRES_GRP_MSTR.Modified then
  begin
    idexit := Application.MessageBox('Save Changes before exiting?', 'Confirm', MB_YESNOCANCEL OR MB_ICONQUESTION);
    case idexit of
      ID_YES:
      begin
        cdsRES_GRP_MSTR.ApplyUpdates(0);
        fResGroup.Close;
      end;
      ID_NO:
        fResGroup.Close;
      ID_CANCEL:
        ;
    end
  end
  else
  begin
    fResGroup.Close;
  end;
end;

procedure TfResGroup.actFindExecute(Sender: TObject);
begin
  fResGrpSearch.Show;
end;

procedure TfResGroup.actFirstExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.First;
  actFirst.Enabled :=false;
  actPrior.Enabled := false;
  actLast.Enabled := true;
  actNext.Enabled := true;
  currentid := cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsInteger;
end;

procedure TfResGroup.actFirstUpdate(Sender: TObject);
begin
  if cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.Modified then
    actFirst.Enabled :=false;
end;

procedure TfResGroup.actAddExecute(Sender: TObject);
var strResId: TArray<string>;
    i :Integer;
    locId :Integer;
    resTypeId :Integer;
    listResId : TStringList;
begin
  frmAddresource :=  TfrmAddresource.Create(self);
  if cdsRES_GRP.RecordCount > 0 then
  begin
    listResId := TStringList.Create;
    cdsRES_GRP.First;
    for i := 0 to cdsRES_GRP.RecordCount - 1 do
    begin
     listResId.Add(cdsRES_GRP.FieldByName('RESOURCE_ID').AsString);
     cdsRES_GRP.Next;
    end;
    frmAddresource.cdsAddResource.Close;
    locId :=  cdsRES_GRP.FieldByName('LOC_ID').Value;
    resTypeId :=  cdsRES_GRP.FieldByName('RESOURCE_TYPE_CD').Value;
    frmAddresource.qryAddResource.SQL.Clear;
    frmAddresource.qryAddResource.SQL.Add('SELECT * from RESOURCE_MSTR where LOC_ID =' + locId.ToString + ' and RESOURCE_TYPE_CD ='
     +  resTypeId.ToString + ' AND RESOURCE_ID NOT IN (' +  listResId.CommaText  +');');
    allowMultiSelect := True;
    frmAddresource.cdsAddResource.Open;
  end
  else
  begin
    frmAddresource.cdsAddResource.Close;
    frmAddresource.qryAddResource.SQL.Clear;
    frmAddresource.qryAddResource.SQL.Add('SELECT * from RESOURCE_MSTR where RESOURCE_TYPE_CD > 0;');
    allowMultiSelect := False;
    frmAddresource.cdsAddResource.Open;
  end;
  try
    frmAddresource.ShowModal;
  finally
    strResId :=  frmAddresource.strResourceId.Split(['^']);

    for i := 0 to High(strResId) do
    begin
      cdsRES_GRP.AppendRecord(['','','0','N','',strResId[i],cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').value,'','']);
      // cdsRES_GRP.Post;   this will cause error: Project ResourceGroupClient.exe raised exception class EDatabaseError with message 'cdsRES_GRP: Dataset not in edit or insert mode'.
    end;
    //ShowMessage('AAA cdsRES_GRP_MSTR.ChangeCount = ' + IntToStr(cdsRES_GRP_MSTR.ChangeCount));
    //ShowMessage('BBB cdsRES_GRP.ChangeCount = ' + IntToStr(cdsRES_GRP.ChangeCount));
    frmAddresource.Free;
  end;
end;

procedure TfResGroup.actLastExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.Last;
  actLast.Enabled :=false;
  actNext.Enabled := false;
  actFirst.Enabled :=true;
  actPrior.Enabled := true;
  currentid := cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsInteger;
end;

procedure TfResGroup.actLastUpdate(Sender: TObject);
begin
  if cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.Modified then
    actLast.Enabled :=false;
end;

procedure TfResGroup.actNewExecute(Sender: TObject);
var
  nextid:integer;
begin
  qryRES_GRP_ID.Last;
  nextid := qryRES_GRP_ID.FieldByName('RESOURCE_GROUP_ID').AsInteger + 1;
  cdsRES_GRP_MSTR.insert;
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_TYPE_CD').AsInteger := 1;
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsInteger := nextid;
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_NAME').AsString := 'New Group ' + inttostr(nextid);
  actFirst.Enabled :=false;
  actPrior.Enabled := false;
  actNext.Enabled := false;
  actLast.Enabled :=false;
end;

procedure TfResGroup.actNewUpdate(Sender: TObject);
begin
   if cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.Modified then
   actNew.Enabled :=False;
end;

procedure TfResGroup.actNextExecute(Sender: TObject);
begin
  currentid := cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsInteger;
  cdsRES_GRP_MSTR.Next;
  nextid := cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsInteger;
  if nextid <> currentid then
  begin
    actLast.Enabled :=true;
    actNext.Enabled := true;
  end
  else
  begin
    actLast.Enabled :=false;
    actNext.Enabled := false;
  end;
  actFirst.Enabled :=true;
  actPrior.Enabled :=true;
end;

procedure TfResGroup.actNextUpdate(Sender: TObject);
begin
  if cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.Modified then
    actNext.Enabled :=false;
end;

procedure TfResGroup.actOrdByDescExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.IndexFieldNames := 'RESOURCE_GROUP_DESC';
  actOrdByName.Checked := FALSE;
  actOrdByDesc.Checked := TRUE;
end;

procedure TfResGroup.actOrdByNameExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.IndexFieldNames := 'RESOURCE_GROUP_NAME';
  actOrdByDesc.Checked := FALSE;
  actOrdByName.Checked := TRUE;
end;

procedure TfResGroup.actPriorExecute(Sender: TObject);
begin
  priorid := cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsInteger;
  cdsRES_GRP_MSTR.Prior;
  currentid := cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsInteger;
  if priorid <> currentid then
  begin
    actFirst.Enabled :=true;
    actPrior.Enabled := true;
  end
  else
  begin
    actFirst.Enabled :=false;
    actPrior.Enabled := false;
  end;
  actNext.Enabled := true;
  actLast.Enabled :=true;
end;

procedure TfResGroup.actPriorUpdate(Sender: TObject);
begin
  if cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.Modified then
    actPrior.Enabled :=false;
end;

procedure TfResGroup.SetallowMultiSelect(Value: boolean);
begin
  if FallowMultiSelect <> Value then
  begin
    FallowMultiSelect := Value;
  // Repaint;    // update user interface to reflect new value
  end;
end;

procedure TfResGroup.actRemoveExecute(Sender: TObject);
var
  i:integer;
  idRemove:integer;
begin
  if dbgridResource.SelectedRows.Count = 1 then
  begin
    idRemove := Application.MessageBox(PWideChar('Are you sure you want to remove ' + cdsRES_GRP.FieldByName('Resource Name').AsString + '?'), 'Confirm', MB_YESNO OR MB_ICONQUESTION);
    case idRemove of
      ID_YES:
        cdsRES_GRP.Delete;
      ID_NO:
      ;
    end;
  end;
  if dbgridResource.SelectedRows.Count > 1 then
  begin
    idRemove := Application.MessageBox(PWideChar('Are you sure you want to remove the selected resources?'), 'Confirm', MB_YESNO);
    case idRemove of
      ID_YES:
        with dbgridResource.DataSource.DataSet do
        for i:=0 to dbgridResource.SelectedRows.Count-1 do
         begin
           GotoBookmark(dbgridResource.SelectedRows.Items[i]);
           cdsRES_GRP.Delete;
        end;
      ID_NO:
      ;
    end;
  end;
end;

procedure TfResGroup.actSaveExecute(Sender: TObject);
var
  i:integer;
begin
  if cdsRES_GRP.RecordCount = 0 then
  begin
    ShowMessage('A group mustRecordCount contain at least one resource.');
  end
  else //if cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.Modified then
  begin
    if NOT (cdsRES_GRP_MSTR.State IN [dsEdit,dsInsert]) then
       cdsRES_GRP_MSTR.Edit;
    cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').AsFloat := seditOPER_COST.Value;
    for i := 1 to dbgridResource.DataSource.DataSet.RecordCount do
    begin
      dbgridResource.Fields[3].DataSet.edit;
      if dbgridResource.Fields[4].AsBoolean then dbgridResource.Fields[3].AsString := 'Y'
      else dbgridResource.Fields[3].AsString := 'N';
      dbgridResource.Fields[3].DataSet.Post;
      dbgridResource.DataSource.DataSet.Next;
    end;
    cdsRES_GRP_MSTR.ApplyUpdates(0);
    actNew.Enabled :=true;
    actDelete.Enabled :=true;
    actFirst.Enabled :=true;
    actPrior.Enabled :=true;
    actNext.Enabled :=true;
    actLast.Enabled :=true;
    actSave.Enabled :=false;
    actCancel.Enabled :=false;
  end;
end;

procedure TfResGroup.actSaveUpdate(Sender: TObject);
begin
  if cdsRES_GRP_MSTR.Modified or cdsRES_GRP.Modified or seditOPER_COST.modified then
    actSave.Enabled := true;
end;

procedure TfResGroup.cdsRES_GRPCalcFields(DataSet: TDataSet);
begin
  with cdsRES_GRP do
  begin
    if Fields[4].Value = NULL then
    begin
      if Fields[3].AsString = 'Y' then
         Fields[4].AsBoolean := True
      else
         Fields[4].AsBoolean := False;
    end;
  end;
end;
procedure TfResGroup.calPRE_TIME;
begin
  if cbxPRE_TIME.Text = 'Seconds' then
    txtPREP_TIME.Text := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('PREP_TIME').Value);
  if cbxPRE_TIME.Text = 'Minutes' then
    txtPREP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat / 60);
  if cbxPRE_TIME.Text = 'Hours' then
    txtPREP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat / 3600);
  if cbxPRE_TIME.Text = 'Days' then
    txtPREP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat / 86400);
  if cbxPRE_TIME.Text = 'Weeks' then
    txtPREP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat / 604800);
end;

procedure TfResGroup.calDAILY_PRE_TIME;
begin
  if cbxDAILY_PRE_TIME.Text = 'Seconds' then
    txtDAILY_STARTUP_TIME.Text := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').Value);
  if cbxDAILY_PRE_TIME.Text = 'Minutes' then
    txtDAILY_STARTUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat / 60);
  if cbxDAILY_PRE_TIME.Text = 'Hours' then
    txtDAILY_STARTUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat / 3600);
  if cbxDAILY_PRE_TIME.Text = 'Days' then
    txtDAILY_STARTUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat / 86400);
  if cbxDAILY_PRE_TIME.Text = 'Weeks' then
    txtDAILY_STARTUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat / 604800);
end;

procedure TfResGroup.calCLEANUP_TIME;
begin
  if cbxCLEANUP_TIME.Text = 'Seconds' then
    txtCLEANUP_TIME.Text := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').Value);
  if cbxCLEANUP_TIME.Text = 'Minutes' then
    txtCLEANUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat / 60);
  if cbxCLEANUP_TIME.Text = 'Hours' then
    txtCLEANUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat / 3600);
  if cbxCLEANUP_TIME.Text = 'Days' then
    txtCLEANUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat / 86400);
  if cbxCLEANUP_TIME.Text = 'Weeks' then
    txtCLEANUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat / 604800);
end;

procedure TfResGroup.calDAILY_CLEANUP_TIME;
begin
  if cbxDAILY_CLEANUP_TIME.Text = 'Seconds' then
    txtDAILY_CLEANUP_TIME.Text := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').Value);
  if cbxDAILY_CLEANUP_TIME.Text = 'Minutes' then
    txtDAILY_CLEANUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat / 60);
  if cbxDAILY_CLEANUP_TIME.Text = 'Hours' then
    txtDAILY_CLEANUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat / 3600);
  if cbxDAILY_CLEANUP_TIME.Text = 'Days' then
    txtDAILY_CLEANUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat / 86400);
  if cbxDAILY_CLEANUP_TIME.Text = 'Weeks' then
    txtDAILY_CLEANUP_TIME.Text :=  FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat / 604800);
end;

procedure TfResGroup.cbxCLEANUP_TIMEChange(Sender: TObject);
begin
  calCLEANUP_TIME();
end;

procedure TfResGroup.cbxDAILY_CLEANUP_TIMEChange(Sender: TObject);
begin
  calDAILY_CLEANUP_TIME();
end;

procedure TfResGroup.cbxDAILY_PRE_TIMEChange(Sender: TObject);
begin
  calDAILY_PRE_TIME();
end;

procedure TfResGroup.cbxPRE_TIMEChange(Sender: TObject);
begin
  calPRE_TIME();
end;

procedure TfResGroup.cdsRES_GRP_MSTRAfterScroll(DataSet: TDataSet);
begin
  calPRE_TIME();
  calCLEANUP_TIME();
  calDAILY_CLEANUP_TIME();
  calDAILY_PRE_TIME();
  if cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').Value <> null then seditOPER_COST.Value := cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').Value
  else seditOPER_COST.Value := 0;
end;

procedure TfResGroup.dbgridResourceCellClick(Column: TColumn);
begin
  if dbgridResource.SelectedField.FieldName = 'USE_GROUP_DEFAULTS' then
    SaveBoolean();
end;

procedure TfResGroup.dbgridResourceColEnter(Sender: TObject);
begin
  if dbgridResource.SelectedField.FieldName = 'USE_GROUP_DEFAULTS' then
  begin
    OriginalOptions := dbgridResource.Options;
    dbgridResource.Options := dbgridResource.Options - [dgEditing];
  end;
end;

procedure TfResGroup.dbgridResourceColExit(Sender: TObject);
begin
  if dbgridResource.SelectedField.FieldName = 'USE_GROUP_DEFAULTS' then
    dbgridResource.Options := OriginalOptions;
end;

procedure TfResGroup.dbgridResourceDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  if Column.Field.FieldName = 'USE_GROUP_DEFAULTS' then
  begin
    dbgridResource.Canvas.FillRect(Rect);
    DrawFrameControl(dbgridResource.Canvas.Handle,Rect,DFC_BUTTON,CtrlState[Column.Field.AsBoolean]);
  end;
end;

procedure TfResGroup.FormClose(Sender: TObject; var Action: TCloseAction);
var
  idexitform:integer;
begin
  if cdsRES_GRP_MSTR.Modified then
  begin
    idexitform := Application.MessageBox('Save Changes before exiting?', 'Confirm', MB_YESNOCANCEL OR MB_ICONQUESTION);
    case idexitform of
      ID_YES:
      begin
        cdsRES_GRP_MSTR.ApplyUpdates(0);
        fResGroup.Close;
      end;
      ID_NO:
        fResGroup.Close;
      ID_CANCEL:
        ;
    end
  end
  else
  begin
    fResGroup.Close;
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
  dbgridResource.SelectedField.DataSet.Edit;
  dbgridResource.SelectedField.AsBoolean := NOT dbgridResource.SelectedField.AsBoolean;
  dbgridResource.SelectedField.DataSet.Post;
end;

procedure TfResGroup.seditOPER_COSTChange(Sender: TObject);
begin
if seditOPER_COST.Value > seditOPER_COST.MaxValue
  then seditOPER_COST.Value:= seditOPER_COST.MaxValue;

end;

procedure TfResGroup.txtDAILY_STARTUP_TIMEChange(Sender: TObject);
begin

end;

{procedure TfResGroup.RepRecs(ipResGrpID: Integer);

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
end;   }
end.

