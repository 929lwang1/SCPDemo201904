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
    procedure dbgridResourceDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure cdsRES_GRPCalcFields(DataSet: TDataSet);
    procedure dbgridResourceCellClick(Column: TColumn);
    procedure dbgridResourceColEnter(Sender: TObject);
    procedure dbgridResourceColExit(Sender: TObject);
    procedure seditOPER_COSTChange(Sender: TObject);
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
    procedure txtPREP_TIMEChange(Sender: TObject);
    procedure txtCLEANUP_TIMEChange(Sender: TObject);
    procedure txtDAILY_CLEANUP_TIMEChange(Sender: TObject);
  private
    { Private declarations }
    FallowMultiSelect: boolean;
    OriginalOptions:TDBGridOptions;
    currentRec: Integer;
    procedure SaveBoolean;
    procedure calPRE_TIME;
    procedure calDAILY_CLEANUP_TIME;
    procedure calDAILY_PRE_TIME;
    procedure calCLEANUP_TIME;
    procedure SetallowMultiSelect(Value: boolean);
    procedure DispRec(ipResGrpID: Integer);
  public
    { Public declarations }
    property allowMultiSelect: boolean read FallowMultiSelect write SetallowMultiSelect;
     //procedure refreshrecord;
    procedure RepRecs(ipResGrpID: Integer);
    constructor Create(AOwner: TComponent); override;
    procedure BeforeDestruction; override;
  end;

var
  fResGroup: TfResGroup;

implementation

{$R *.dfm}
uses AddResource,ResourceGroupFind;

procedure TfResGroup.BeforeDestruction;
begin
  inherited;
  with TFileStream.Create(ExtractFilePath(Application.ExeName) + ClassName +
    '.fs', fmCreate) do
  try
    WriteComponent(Self);
  finally
    Free;
  end;
end;
constructor TfResGroup.Create(AOwner: TComponent);

begin
  if FileExists(ExtractFilePath(Application.ExeName) + ClassName + '.fs') then
  begin
    CreateNew(AOwner, 0);
    with TFileStream.Create(ExtractFilePath(Application.ExeName) + ClassName +
      '.fs', fmOpenRead or fmShareDenyWrite) do
    try
      ReadComponent(Self);
    finally
      Free;
    end;
  end
  else
    inherited Create(AOwner);
end;

procedure TfResGroup.actCancelExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.CancelUpdates();
  cdsRES_GRP_MSTR.Locate('RESOURCE_GROUP_ID',currentRec,[]);
  cdsRES_GRP_MSTR.Prior;
  if not cdsRES_GRP_MSTR.Bof then
  begin
    cdsRES_GRP_MSTR.Next;
    cdsRES_GRP_MSTR.Next;
    if not cdsRES_GRP_MSTR.Eof then
       cdsRES_GRP_MSTR.Prior;
  end;
end;

procedure TfResGroup.actCancelUpdate(Sender: TObject);
begin
  actCancel.Enabled := (cdsRES_GRP_MSTR.State IN [dsEdit, dsInsert]) or (cdsRES_GRP_MSTR.ChangeCount > 0);
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
  actDelete.Enabled := (cdsRES_GRP_MSTR.State = dsBrowse) and (cdsRES_GRP_MSTR.ChangeCount = 0);
end;

procedure TfResGroup.actExitExecute(Sender: TObject);
var
  idexit:integer;
begin
  if (cdsRES_GRP_MSTR.State IN [dsEdit, dsInsert]) or (cdsRES_GRP_MSTR.ChangeCount > 0) then
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
end;

procedure TfResGroup.actFirstUpdate(Sender: TObject);
begin
  actFirst.Enabled := not cdsRES_GRP_MSTR.Bof and (cdsRES_GRP_MSTR.State = dsBrowse);
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
end;

procedure TfResGroup.actLastUpdate(Sender: TObject);
begin
  actLast.Enabled := not cdsRES_GRP_MSTR.Eof and (cdsRES_GRP_MSTR.State = dsBrowse);
end;

procedure TfResGroup.actNewExecute(Sender: TObject);
var
  nextid:integer;
begin
  currentRec :=  cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').Value;
  qryRES_GRP_ID.Close;
  qryRES_GRP_ID.Open;
  qryRES_GRP_ID.Last;
  nextid := qryRES_GRP_ID.FieldByName('RESOURCE_GROUP_ID').AsInteger + 1;
  cdsRES_GRP_MSTR.Append;
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_TYPE_CD').AsInteger := 1;
  cdsRES_GRP_MSTR.FieldByName('UTILIZATION_TYPE_CD').AsInteger := 1;
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsInteger := nextid;
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_NAME').AsString := 'New Group ' + inttostr(nextid);
end;

procedure TfResGroup.actNewUpdate(Sender: TObject);
begin
  actNew.Enabled := (cdsRES_GRP_MSTR.State = dsBrowse) and (cdsRES_GRP_MSTR.ChangeCount = 0);
end;

procedure TfResGroup.actNextExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.Next;
end;

procedure TfResGroup.actNextUpdate(Sender: TObject);
begin
  actNext.Enabled := not cdsRES_GRP_MSTR.Eof and (cdsRES_GRP_MSTR.State = dsBrowse);
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
  cdsRES_GRP_MSTR.Prior;
end;

procedure TfResGroup.actPriorUpdate(Sender: TObject);
begin
  actPrior.Enabled := not cdsRES_GRP_MSTR.Bof and (cdsRES_GRP_MSTR.State = dsBrowse);
end;

procedure TfResGroup.SetallowMultiSelect(Value: boolean);
begin
  if FallowMultiSelect <> Value then
  begin
    FallowMultiSelect := Value;
  // Repaint;    // update user interface to reflect new value
  end;
end;

procedure TfResGroup.txtCLEANUP_TIMEChange(Sender: TObject);
var
  cleanuptime:string;
begin
  if cbxCLEANUP_TIME.Text = 'Seconds' then
    cleanuptime := FormatFloat('0', cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').Value);
  if cbxCLEANUP_TIME.Text = 'Minutes' then
    cleanuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat / 60);
  if cbxCLEANUP_TIME.Text = 'Hours' then
    cleanuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat / 3600);
  if cbxCLEANUP_TIME.Text = 'Days' then
    cleanuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat / 86400);
  if cbxCLEANUP_TIME.Text = 'Weeks' then
    cleanuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat / 604800);
  if txtCLEANUP_TIME.Text <> cleanuptime then
  begin
  if not (cdsRES_GRP_MSTR.State in [dsInsert, dsEdit]) then
    cdsRES_GRP_MSTR.Edit;
  end;
end;

procedure TfResGroup.txtDAILY_CLEANUP_TIMEChange(Sender: TObject);
var
  dcleanuptime:string;
begin
  if cbxDAILY_CLEANUP_TIME.Text = 'Seconds' then
    dcleanuptime := FormatFloat('0', cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').Value);
  if cbxDAILY_CLEANUP_TIME.Text = 'Minutes' then
    dcleanuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat / 60);
  if cbxDAILY_CLEANUP_TIME.Text = 'Hours' then
    dcleanuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat / 3600);
  if cbxDAILY_CLEANUP_TIME.Text = 'Days' then
    dcleanuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat / 86400);
  if cbxDAILY_CLEANUP_TIME.Text = 'Weeks' then
    dcleanuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat / 604800);
  if txtDAILY_CLEANUP_TIME.Text <> dcleanuptime then
  begin
    if not (cdsRES_GRP_MSTR.State in [dsInsert, dsEdit]) then
      cdsRES_GRP_MSTR.Edit;
  end;
end;

procedure TfResGroup.txtDAILY_STARTUP_TIMEChange(Sender: TObject);
var
  startuptime:string;
begin
  if cbxDAILY_PRE_TIME.Text = 'Seconds' then
    startuptime := FormatFloat('0', cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').Value);
  if cbxDAILY_PRE_TIME.Text = 'Minutes' then
    startuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat / 60);
  if cbxDAILY_PRE_TIME.Text = 'Hours' then
    startuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat / 3600);
  if cbxDAILY_PRE_TIME.Text = 'Days' then
    startuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat / 86400);
  if cbxDAILY_PRE_TIME.Text = 'Weeks' then
    startuptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat / 604800);
  if txtDAILY_STARTUP_TIME.Text <> startuptime then
  begin
    if not (cdsRES_GRP_MSTR.State in [dsInsert, dsEdit]) then
      cdsRES_GRP_MSTR.Edit;
  end;
end;

procedure TfResGroup.txtPREP_TIMEChange(Sender: TObject);
var
  preptime:string;
begin
  if cbxPRE_TIME.Text = 'Seconds' then
    preptime := FormatFloat('0', cdsRES_GRP_MSTR.FieldByName('PREP_TIME').Value);
  if cbxPRE_TIME.Text = 'Minutes' then
    preptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat / 60);
  if cbxPRE_TIME.Text = 'Hours' then
    preptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat / 3600);
  if cbxPRE_TIME.Text = 'Days' then
    preptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat / 86400);
  if cbxPRE_TIME.Text = 'Weeks' then
    preptime := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat / 604800);
  if txtPREP_TIME.Text <> preptime then
  begin
    if not (cdsRES_GRP_MSTR.State in [dsInsert, dsEdit]) then
      cdsRES_GRP_MSTR.Edit;
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
  else
  begin
    for i := 1 to dbgridResource.DataSource.DataSet.RecordCount do
    begin
      dbgridResource.DataSource.DataSet.Edit;
      if dbgridResource.DataSource.DataSet.FieldByName('USE_GROUP_DEFAULTS').AsBoolean then dbgridResource.DataSource.DataSet.FieldByName('USE_GROUP_SETTINGS_IND').AsString := 'Y'
      else dbgridResource.DataSource.DataSet.FieldByName('USE_GROUP_SETTINGS_IND').AsString := 'N';
      dbgridResource.DataSource.DataSet.Post;
      dbgridResource.DataSource.DataSet.Next;
    end;
    if txtPREP_TIME.Text = '' then
    begin
      txtPREP_TIME.Text :='0';
      cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat :=0;
    end
    else
    begin
      if cbxPRE_TIME.Text = 'Seconds' then
        cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat :=StrToFloat(txtPREP_TIME.Text);
      if cbxPRE_TIME.Text = 'Minutes' then
        cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat :=StrToFloat(txtPREP_TIME.Text) * 60;
      if cbxPRE_TIME.Text = 'Hours' then
        cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat :=StrToFloat(txtPREP_TIME.Text) * 3600;
      if cbxPRE_TIME.Text = 'Days' then
        cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat :=StrToFloat(txtPREP_TIME.Text) * 86400;
      if cbxPRE_TIME.Text = 'Weeks' then
        cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat :=StrToFloat(txtPREP_TIME.Text) * 604800;
    end;
     if txtDAILY_STARTUP_TIME.Text = '' then
    begin
      txtDAILY_STARTUP_TIME.Text :='0';
      cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat :=0;
    end
    else
    begin
      if cbxDAILY_PRE_TIME.Text = 'Seconds' then
        cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat :=StrToFloat(txtDAILY_STARTUP_TIME.Text);
      if cbxDAILY_PRE_TIME.Text = 'Minutes' then
        cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat :=StrToFloat(txtDAILY_STARTUP_TIME.Text) * 60;
      if cbxDAILY_PRE_TIME.Text = 'Hours' then
        cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat :=StrToFloat(txtDAILY_STARTUP_TIME.Text) * 3600;
      if cbxDAILY_PRE_TIME.Text = 'Days' then
        cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat :=StrToFloat(txtDAILY_STARTUP_TIME.Text) * 86400;
      if cbxDAILY_PRE_TIME.Text = 'Weeks' then
        cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat :=StrToFloat(txtDAILY_STARTUP_TIME.Text) * 604800;
    end;
    if txtDAILY_CLEANUP_TIME.Text = '' then
    begin
      txtDAILY_CLEANUP_TIME.Text :='0';
      cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat :=0;
    end
    else
    begin
      if cbxDAILY_CLEANUP_TIME.Text = 'Seconds' then
        cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat :=StrToFloat(txtDAILY_CLEANUP_TIME.Text);
      if cbxDAILY_CLEANUP_TIME.Text = 'Minutes' then
        cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat :=StrToFloat(txtDAILY_CLEANUP_TIME.Text) * 60;
      if cbxDAILY_CLEANUP_TIME.Text = 'Hours' then
        cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat :=StrToFloat(txtDAILY_CLEANUP_TIME.Text) * 3600;
      if cbxDAILY_CLEANUP_TIME.Text = 'Days' then
        cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat :=StrToFloat(txtDAILY_CLEANUP_TIME.Text) * 86400;
      if cbxDAILY_CLEANUP_TIME.Text = 'Weeks' then
        cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat :=StrToFloat(txtDAILY_CLEANUP_TIME.Text) * 604800;
    end;
    if txtCLEANUP_TIME.Text = '' then
    begin
      txtCLEANUP_TIME.Text :='0';
      cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat :=0;
    end
    else
    begin
      if cbxCLEANUP_TIME.Text = 'Seconds' then
        cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat :=StrToFloat(txtCLEANUP_TIME.Text);
      if cbxCLEANUP_TIME.Text = 'Minutes' then
        cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat :=StrToFloat(txtCLEANUP_TIME.Text) * 60;
      if cbxCLEANUP_TIME.Text = 'Hours' then
        cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat :=StrToFloat(txtCLEANUP_TIME.Text) * 3600;
      if cbxCLEANUP_TIME.Text = 'Days' then
        cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat :=StrToFloat(txtCLEANUP_TIME.Text) * 86400;
      if cbxCLEANUP_TIME.Text = 'Weeks' then
        cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat :=StrToFloat(txtCLEANUP_TIME.Text) * 604800;
    end;
    cdsRES_GRP_MSTR.ApplyUpdates(0);
  end;
end;

procedure TfResGroup.actSaveUpdate(Sender: TObject);
begin
  actSave.Enabled := (cdsRES_GRP_MSTR.State IN [dsEdit, dsInsert]) or (cdsRES_GRP_MSTR.ChangeCount > 0);
end;

procedure TfResGroup.cdsRES_GRPCalcFields(DataSet: TDataSet);
begin
  with cdsRES_GRP do
  begin
    if Fields.FieldByName('USE_GROUP_DEFAULTS').Value = NULL then
    begin
      if Fields.FieldByName('USE_GROUP_SETTINGS_IND').AsString = 'Y' then
         Fields.FieldByName('USE_GROUP_DEFAULTS').AsBoolean := True
      else
         Fields.FieldByName('USE_GROUP_DEFAULTS').AsBoolean := False;
    end;
  end;
end;
procedure TfResGroup.calPRE_TIME;
begin
  if cbxPRE_TIME.Text = 'Seconds' then
      txtPREP_TIME.Text := FormatFloat('0', cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat);
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
    txtDAILY_STARTUP_TIME.Text := FormatFloat('0', cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').Value);
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
    txtCLEANUP_TIME.Text := FormatFloat('0', cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').Value);
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
    txtDAILY_CLEANUP_TIME.Text := FormatFloat('0', cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').Value);
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
//  txtPREP_TIME.OnChange :=nil;
//  txtDAILY_STARTUP_TIME.OnChange :=nil;
//  txtCLEANUP_TIME.OnChange :=nil;
//  txtDAILY_CLEANUP_TIME.OnChange :=nil;
  calPRE_TIME();
  calCLEANUP_TIME();
  calDAILY_CLEANUP_TIME();
  calDAILY_PRE_TIME();
//  txtPREP_TIME.OnChange :=txtPREP_TIMEChange;
//  txtDAILY_STARTUP_TIME.OnChange :=txtDAILY_STARTUP_TIMEChange;
//  txtCLEANUP_TIME.OnChange :=txtCLEANUP_TIMEChange;
//  txtDAILY_CLEANUP_TIME.OnChange :=txtDAILY_CLEANUP_TIMEChange;
  seditOPER_COST.OnChange :=nil;
  if cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').Value <> null then
    seditOPER_COST.Value := cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').Value
  else seditOPER_COST.Value := 0;
  seditOPER_COST.OnChange :=seditOPER_COSTChange;
end;


procedure TfResGroup.dbgridResourceCellClick(Column: TColumn);
begin
  if dbgridResource.DataSource.DataSet.RecordCount > 0 then
  begin
    if dbgridResource.SelectedField.FieldName = 'USE_GROUP_DEFAULTS' then
    SaveBoolean();
  end;
end;

procedure TfResGroup.dbgridResourceColEnter(Sender: TObject);
begin
  if dbgridResource.DataSource.DataSet.RecordCount > 0 then
  begin
    if dbgridResource.SelectedField.FieldName = 'USE_GROUP_DEFAULTS' then
    begin
      OriginalOptions := dbgridResource.Options;
      dbgridResource.Options := dbgridResource.Options - [dgEditing];
    end;
  end;
end;

procedure TfResGroup.dbgridResourceColExit(Sender: TObject);
begin
  if dbgridResource.DataSource.DataSet.RecordCount > 0 then
  begin
    if dbgridResource.SelectedField.FieldName = 'USE_GROUP_DEFAULTS' then
      dbgridResource.Options := OriginalOptions;
  end;
end;

procedure TfResGroup.dbgridResourceDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  CtrlState : array[Boolean] of Integer = (DFCS_BUTTONCHECK,DFCS_BUTTONCHECK or DFCS_CHECKED);
begin
  if dbgridResource.DataSource.DataSet.RecordCount > 0 then
  begin
    if Column.Field.FieldName = 'USE_GROUP_DEFAULTS' then
    begin
      dbgridResource.Canvas.FillRect(Rect);
      DrawFrameControl(dbgridResource.Canvas.Handle,Rect,DFC_BUTTON,CtrlState[Column.Field.AsBoolean]);
    end;
  end;
end;

procedure TfResGroup.FormClose(Sender: TObject; var Action: TCloseAction);
var
  idexitform:integer;
begin
  if (cdsRES_GRP_MSTR.State IN [dsEdit, dsInsert]) or (cdsRES_GRP_MSTR.ChangeCount > 0) then
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

procedure TfResGroup.qryRES_GRP_MSTRAfterScroll(DataSet: TDataSet);
begin
  if qryRES_GRP.Active then qryRES_GRP.Close;
  qryRES_GRP.Parameters[0].Value := qryRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').Value;
  qryRES_GRP.Open;
end;

procedure TfResGroup.SaveBoolean;
begin
  dbgridResource.SelectedField.DataSet.Edit;
  dbgridResource.SelectedField.AsBoolean := NOT dbgridResource.SelectedField.AsBoolean;
  dbgridResource.SelectedField.DataSet.Post;
end;

procedure TfResGroup.seditOPER_COSTChange(Sender: TObject);
begin
  if seditOPER_COST.Value > seditOPER_COST.MaxValue then
    seditOPER_COST.Value :=seditOPER_COST.MaxValue;
  if not (cdsRES_GRP_MSTR.State in [dsInsert, dsEdit]) then
    cdsRES_GRP_MSTR.Edit;
  cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').AsFloat := seditOPER_COST.Value;
end;

procedure TfResGroup.RepRecs(ipResGrpID: Integer);
begin
  if not cdsRES_GRP_MSTR.Active then
    cdsRES_GRP_MSTR.Open;
  if (cdsRES_GRP_MSTR.State in [dsBrowse]) AND
     (cdsRES_GRP_MSTR.ChangeCount = 0) then
    DispRec(ipResGrpID);
end;

procedure TfResGroup.DispRec(ipResGrpID: Integer);
begin
  cdsRES_GRP_MSTR.Locate('RESOURCE_GROUP_ID',ipResGrpID,[]);
end;

end.
