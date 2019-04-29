unit uResourceGroupClient;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  System.Actions, Vcl.ActnList, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.DBCtrls, Datasnap.Provider, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Mask, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids,
  Vcl.Samples.Spin, Datasnap.Win.MConnect;

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
    cdsRES_GRP: TClientDataSet;
    dblkcbxUtilType: TDBLookupComboBox;
    dbgridResource: TDBGrid;
    dsRES_GRP_cds: TDataSource;
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
    cdsUTL_TYPE_MSTR: TClientDataSet;
    dcomMain: TDCOMConnection;
    cdsRES_GRP_ID: TClientDataSet;
    cdsRES_MSTR: TClientDataSet;
    cdsRES_GRP_MSTR_DUP: TClientDataSet;
    spinButtonCost: TSpinButton;
    upClick: TAction;
    downClick: TAction;
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
    procedure actOrdByNameExecute(Sender: TObject);
    procedure actOrdByDescExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actRemoveExecute(Sender: TObject);
    procedure txtDAILY_STARTUP_TIMEChange(Sender: TObject);
    procedure txtPREP_TIMEChange(Sender: TObject);
    procedure txtCLEANUP_TIMEChange(Sender: TObject);
    procedure txtDAILY_CLEANUP_TIMEChange(Sender: TObject);
    procedure seditOPER_COSTExit(Sender: TObject);
    procedure cdsRES_GRP_MSTRNewRecord(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure txtPREP_TIMEKeyPress(Sender: TObject; var Key: Char);
    procedure txtDAILY_STARTUP_TIMEKeyPress(Sender: TObject; var Key: Char);
    procedure txtCLEANUP_TIMEKeyPress(Sender: TObject; var Key: Char);
    procedure txtDAILY_CLEANUP_TIMEKeyPress(Sender: TObject; var Key: Char);
    procedure spinButtonCostDownClick(Sender: TObject);
    procedure spinButtonCostUpClick(Sender: TObject);
    procedure txtPREP_TIMEExit(Sender: TObject);
    procedure txtDAILY_STARTUP_TIMEExit(Sender: TObject);
    procedure txtCLEANUP_TIMEExit(Sender: TObject);
    procedure txtDAILY_CLEANUP_TIMEExit(Sender: TObject);
    procedure upClickExecute(Sender: TObject);
    procedure downClickExecute(Sender: TObject);
  private
    { Private declarations }
    FallowMultiSelect: Boolean;
    OriginalOptions: TDBGridOptions;
    currentRec: Integer;
    nextid: Integer;
    FHist: TStringList;
    FText: String;
    FColseOnGo: Boolean;
    procedure SaveBoolean;
    function calTime(ipTimeUm:integer; ipField : string):string;
    function txtOnChange(ipTime: string; ipTimeUm: integer):real;
    function txtKeyPress(ipTimeUm, ipTime: string; ipKey: char):char;
    procedure calPRE_TIME;
    procedure calDAILY_CLEANUP_TIME;
    procedure calDAILY_PRE_TIME;
    procedure calCLEANUP_TIME;
    procedure DispRec(ipResGrpID: Integer);
    procedure validateCost;
    procedure orderBy(ipIndex: string);

  public
    { Public declarations }
    property strHist: TStringList read FHist;
    property strText: String read FText;
    property tglHist: Boolean read FColseOnGo;
    property allowMultiSelect: Boolean read FallowMultiSelect;
    procedure RepRecs(ipResGrpID: Integer);
    procedure GetSearchHist;
    constructor Create(AOwner: TComponent); override;
    procedure BeforeDestruction; override;
  end;

var
  fResGroup: TfResGroup;
  const
    seconds = 1;
    minutes = 60;
    hours = 3600;
    days = 86400;
    weeks = 604800;
implementation

{$R *.dfm}
uses AddResource,ResourceGroupFind;

procedure TfResGroup.BeforeDestruction;
begin
  cbxPRE_TIME.ItemIndex := 1;
  cbxCLEANUP_TIME.ItemIndex := 1;
  cbxDAILY_PRE_TIME.ItemIndex := 1;
  cbxDAILY_CLEANUP_TIME.ItemIndex := 1;
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
  if cdsRES_GRP_MSTR.IndexFieldNames = '' then
  begin
    cdsRES_GRP_MSTR.IndexFieldNames := 'RESOURCE_GROUP_NAME';
    actOrdByName.Checked := TRUE;
  end;
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
  actCancel.Enabled := (cdsRES_GRP_MSTR.State in [dsEdit, dsInsert]) or (cdsRES_GRP_MSTR.ChangeCount > 0);
end;

procedure TfResGroup.actDeleteExecute(Sender: TObject);
begin
  case MessageDlg('Are you sure you want to delete ' + cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_NAME').AsString + '?', mtConfirmation, [mbYes, mbNo], 0) of
  mrYes:
    begin
      cdsRES_GRP_MSTR.Delete;
      cdsRES_GRP_MSTR.ApplyUpdates(0);
    end;
  mrNo:
    ;
  end;
end;

procedure TfResGroup.actDeleteUpdate(Sender: TObject);
begin
  actDelete.Enabled := (cdsRES_GRP_MSTR.State = dsBrowse) and (cdsRES_GRP_MSTR.ChangeCount = 0);
end;

procedure TfResGroup.actExitExecute(Sender: TObject);
begin
  fResGroup.Close;
end;

procedure TfResGroup.actFindExecute(Sender: TObject);
begin
  fResGrpSearch := TfResGrpSearch.Create(self);
  fResGrpSearch.Show;
end;

procedure TfResGroup.GetSearchHist;
begin
  FHist := fResGrpSearch.strHist;
  FText := fResGrpSearch.strText;
  FColseOnGo := fResGrpSearch.tglHist;
end;

procedure TfResGroup.actFirstExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.First;
end;

procedure TfResGroup.actFirstUpdate(Sender: TObject);
begin
  actFirst.Enabled := not cdsRES_GRP_MSTR.Bof and (cdsRES_GRP_MSTR.State = dsBrowse) and (cdsRES_GRP_MSTR.ChangeCount = 0);
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
    locId :=  cdsRES_GRP.FieldByName('LOC_ID').Value;
    resTypeId :=  cdsRES_GRP.FieldByName('RESOURCE_TYPE_CD').Value;
    frmAddresource.cdsAddResource.Close;
    frmAddresource.cdsAddResource.CommandText := 'SELECT * from RESOURCE_MSTR where LOC_ID =' + locId.ToString + ' and RESOURCE_TYPE_CD =' +  resTypeId.ToString + ' AND RESOURCE_ID NOT IN (' +  listResId.CommaText  +');';
    FallowMultiSelect := True;
    frmAddresource.cdsAddResource.Open;
  end
  else
  begin
    frmAddresource.cdsAddResource.Close;
    frmAddresource.cdsAddResource.CommandText := 'SELECT * from RESOURCE_MSTR where RESOURCE_TYPE_CD > 0;';
    FallowMultiSelect := False;
    frmAddresource.cdsAddResource.Open;
  end;
  try
    frmAddresource.ShowModal;
    strResId :=  frmAddresource.strResourceId.Split(['^']);

    for i := 0 to High(strResId) do
    begin
      cdsRES_GRP.AppendRecord(['','','0','N','',strResId[i],cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').value,'','']);
      // cdsRES_GRP.Post;   this will cause error: Project ResourceGroupClient.exe raised exception class EDatabaseError with message 'cdsRES_GRP: Dataset not in edit or insert mode'.
    end;
  finally
    frmAddresource.Free;
  end;
end;

procedure TfResGroup.actLastExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.Last;
end;

procedure TfResGroup.actLastUpdate(Sender: TObject);
begin
  actLast.Enabled := not cdsRES_GRP_MSTR.Eof and (cdsRES_GRP_MSTR.State = dsBrowse) and (cdsRES_GRP_MSTR.ChangeCount = 0);
end;

procedure TfResGroup.actNewExecute(Sender: TObject);
begin
  currentRec :=  cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').Value;
  cdsRES_GRP_ID.Close;
  cdsRES_GRP_ID.Open;
  nextid := cdsRES_GRP_ID.FieldByName('RESOURCE_GROUP_ID').AsInteger + 1;
  cdsRES_GRP_MSTR.Append;
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
  actNext.Enabled := not cdsRES_GRP_MSTR.Eof and (cdsRES_GRP_MSTR.State = dsBrowse) and (cdsRES_GRP_MSTR.ChangeCount = 0);
end;

procedure TfResGroup.actOrdByDescExecute(Sender: TObject);
begin
  orderBy('RESOURCE_GROUP_DESC');
end;

procedure TfResGroup.actOrdByNameExecute(Sender: TObject);
begin
  orderBy('RESOURCE_GROUP_NAME');
end;

procedure TfResGroup.orderBy(ipIndex:string);
begin
  cdsRES_GRP_MSTR.IndexFieldNames := ipIndex;
  actOrdByDesc.Checked := (cdsRES_GRP_MSTR.IndexFieldNames = 'RESOURCE_GROUP_DESC');
  actOrdByName.Checked := (cdsRES_GRP_MSTR.IndexFieldNames = 'RESOURCE_GROUP_NAME');
end;

procedure TfResGroup.actPriorExecute(Sender: TObject);
begin
  cdsRES_GRP_MSTR.Prior;
end;

procedure TfResGroup.actPriorUpdate(Sender: TObject);
begin
  actPrior.Enabled := not cdsRES_GRP_MSTR.Bof and (cdsRES_GRP_MSTR.State = dsBrowse) and (cdsRES_GRP_MSTR.ChangeCount = 0);
end;

procedure TfResGroup.txtCLEANUP_TIMEChange(Sender: TObject);
begin
  if trim(txtCLEANUP_TIME.Text) = '' then
  begin
    txtCLEANUP_TIME.Text :='0';
    cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat :=0;
  end
  else
    cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsFloat :=txtOnChange(txtCLEANUP_TIME.Text, cbxCLEANUP_TIME.ItemIndex);
end;

procedure TfResGroup.txtCLEANUP_TIMEExit(Sender: TObject);
begin
  txtCLEANUP_TIME.Text :=calTime(cbxCLEANUP_TIME.ItemIndex, 'CLEANUP_TIME');
end;

procedure TfResGroup.txtCLEANUP_TIMEKeyPress(Sender: TObject; var Key: Char);
begin
  Key :=txtKeyPress(cbxCLEANUP_TIME.Text, txtCLEANUP_TIME.Text, Key);
end;

procedure TfResGroup.txtDAILY_CLEANUP_TIMEChange(Sender: TObject);
begin
  if trim(txtDAILY_CLEANUP_TIME.Text) = '' then
  begin
    txtDAILY_CLEANUP_TIME.Text :='0';
    cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat :=0;
  end
  else
    cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsFloat :=txtOnChange(txtDAILY_CLEANUP_TIME.Text, cbxDAILY_CLEANUP_TIME.ItemIndex);
end;

procedure TfResGroup.txtDAILY_CLEANUP_TIMEExit(Sender: TObject);
begin
  txtDAILY_CLEANUP_TIME.Text :=calTime(cbxDAILY_CLEANUP_TIME.ItemIndex, 'DAILY_CLEANUP_TIME');
end;

procedure TfResGroup.txtDAILY_CLEANUP_TIMEKeyPress(Sender: TObject; var Key: Char);
begin
  Key :=txtKeyPress(cbxDAILY_CLEANUP_TIME.Text, txtDAILY_CLEANUP_TIME.Text, Key);
end;

procedure TfResGroup.txtDAILY_STARTUP_TIMEChange(Sender: TObject);
begin
  if trim(txtDAILY_STARTUP_TIME.Text) = '' then
  begin
    txtDAILY_STARTUP_TIME.Text :='0';
    cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat :=0;
  end
  else
    cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsFloat :=txtOnChange(txtDAILY_STARTUP_TIME.Text, cbxDAILY_PRE_TIME.ItemIndex);
end;

procedure TfResGroup.txtDAILY_STARTUP_TIMEExit(Sender: TObject);
begin
  txtDAILY_STARTUP_TIME.Text :=calTime(cbxDAILY_PRE_TIME.ItemIndex, 'DAILY_STARTUP_TIME');
end;

procedure TfResGroup.txtDAILY_STARTUP_TIMEKeyPress(Sender: TObject; var Key: Char);
begin
  Key :=txtKeyPress(cbxDAILY_PRE_TIME.Text, txtDAILY_STARTUP_TIME.Text, Key);
end;

procedure TfResGroup.txtPREP_TIMEChange(Sender: TObject);
begin
  if trim(txtPREP_TIME.Text) = '' then
  begin
    txtPREP_TIME.Text :='0';
    cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat :=0;
  end
  else
    cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsFloat :=txtOnChange(txtPREP_TIME.Text, cbxPRE_TIME.ItemIndex);
end;

procedure TfResGroup.txtPREP_TIMEExit(Sender: TObject);
begin
  txtPREP_TIME.Text :=calTime(cbxPRE_TIME.ItemIndex, 'PREP_TIME');
end;

procedure TfResGroup.txtPREP_TIMEKeyPress(Sender: TObject; var Key: Char);
begin
  Key :=txtKeyPress(cbxPRE_TIME.Text, txtPREP_TIME.Text, Key);
end;

procedure TfResGroup.upClickExecute(Sender: TObject);
begin
  if seditOPER_COST.Focused then
  begin
    seditOPER_COST.Text :=  FloatToStr(StrToFloat(seditOPER_COST.Text) + 1);
    validateCost;
  end;
end;

function TfResGroup.txtOnChange(ipTime:string; ipTimeUm: integer):real;
begin
  if not (cdsRES_GRP_MSTR.State in [dsInsert, dsEdit]) then
    cdsRES_GRP_MSTR.Edit;
  case ipTimeUm of
    0:Result := StrToFloat(ipTime) * seconds;
    1:Result := StrToFloat(ipTime) * minutes;
    2:Result := StrToFloat(ipTime) * hours;
    3:Result := StrToFloat(ipTime) * days;
    4:Result := StrToFloat(ipTime) * weeks;
    else
    Result :=0;
  end;
end;

function TfResGroup.txtKeyPress(ipTimeUm, ipTime: string; ipKey: char):char;
begin
  if ipTimeUm = 'Seconds' then
  begin
    if not (AnsiChar(ipKey) in [#8, '0'..'9']) then
      Result := #0
    else
      Result :=ipKey;
  end
  else
  begin
    if not (AnsiChar(ipKey) in [#8, '0'..'9', '.']) then
      Result := #0
    else if (ipKey = '.') and (Pos(ipKey, ipTime) > 0) then
      Result := #0
    else
      Result :=ipKey;
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
  seditOPER_COSTExit(self);
  if cdsRES_GRP_MSTR.State in [dsEdit, dsInsert] then
  begin
    cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_NAME').Value := trim(dbeName.Text);
    cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_DESC').Value := trim(dbeDesc.Text);
  end;
  if trim(dbeName.text) = '' then
  begin
    Application.MessageBox('Field Name cannot be blank.','Error',MB_OK+MB_ICONHAND);
    exit;
  end;
  if cdsRES_GRP.RecordCount = 0 then
  begin
    Application.MessageBox('A group must contain at least one resource.','Error',MB_OK+MB_ICONHAND);
    exit;
  end;
  cdsRES_GRP_MSTR_DUP.Close;
  cdsRES_GRP_MSTR_DUP.CommandText := 'select * from RESOURCE_GROUP_MSTR where RESOURCE_GROUP_NAME = ' + QuotedStr(trim(dbeName.Text));
  cdsRES_GRP_MSTR_DUP.Open;
  if (cdsRES_GRP_MSTR_DUP.IsEmpty = False) and (cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsInteger <> cdsRES_GRP_MSTR_DUP.FieldByName('RESOURCE_GROUP_ID').AsInteger) then
  begin
    Application.MessageBox('Entity already exists in database; cannot save.','Error',MB_OK+MB_ICONHAND);
    exit;
  end
  else
  begin
    dbgridResource.DataSource.DataSet.First;
    for i := 1 to dbgridResource.DataSource.DataSet.RecordCount do
    begin
      dbgridResource.DataSource.DataSet.Edit;
      if dbgridResource.DataSource.DataSet.FieldByName('USE_GROUP_DEFAULTS').AsBoolean = True then dbgridResource.DataSource.DataSet.FieldByName('USE_GROUP_SETTINGS_IND').AsString := 'Y'
      else dbgridResource.DataSource.DataSet.FieldByName('USE_GROUP_SETTINGS_IND').AsString := 'N';
      dbgridResource.DataSource.DataSet.Post;
      dbgridResource.DataSource.DataSet.Next;
    end;
    cdsRES_GRP_MSTR.ApplyUpdates(0);
  end;
end;

procedure TfResGroup.actSaveUpdate(Sender: TObject);
begin
  actSave.Enabled := (cdsRES_GRP_MSTR.State in [dsEdit, dsInsert]) or (cdsRES_GRP_MSTR.ChangeCount > 0);
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

function TfResGroup.calTime(ipTimeUm:integer; ipField : string):string;
begin
  case ipTimeUm of
    0:Result := FormatFloat('0', cdsRES_GRP_MSTR.FieldByName(ipField).AsFloat / seconds);
    1:Result := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName(ipField).AsFloat / minutes);
    2:Result := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName(ipField).AsFloat / hours);
    3:Result := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName(ipField).AsFloat / days);
    4:Result := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName(ipField).AsFloat / weeks);
  end;
end;

procedure TfResGroup.calPRE_TIME;
begin
  txtPREP_TIME.Text :=calTime(cbxPRE_TIME.ItemIndex, 'PREP_TIME');
end;

procedure TfResGroup.calDAILY_PRE_TIME;
begin
  txtDAILY_STARTUP_TIME.Text :=calTime(cbxDAILY_PRE_TIME.ItemIndex, 'DAILY_STARTUP_TIME');
end;

procedure TfResGroup.calCLEANUP_TIME;
begin
  txtCLEANUP_TIME.Text :=calTime(cbxCLEANUP_TIME.ItemIndex, 'CLEANUP_TIME');
end;

procedure TfResGroup.calDAILY_CLEANUP_TIME;
begin
  txtDAILY_CLEANUP_TIME.Text :=calTime(cbxDAILY_CLEANUP_TIME.ItemIndex, 'DAILY_CLEANUP_TIME');
end;

procedure TfResGroup.cbxCLEANUP_TIMEChange(Sender: TObject);
begin
  txtCLEANUP_TIME.OnChange :=nil;
  calCLEANUP_TIME();
  txtCLEANUP_TIME.OnChange :=txtCLEANUP_TIMEChange;
end;

procedure TfResGroup.cbxDAILY_CLEANUP_TIMEChange(Sender: TObject);
begin
  txtDAILY_CLEANUP_TIME.OnChange :=nil;
  calDAILY_CLEANUP_TIME();
  txtDAILY_CLEANUP_TIME.OnChange :=txtDAILY_CLEANUP_TIMEChange;
end;

procedure TfResGroup.cbxDAILY_PRE_TIMEChange(Sender: TObject);
begin
  txtDAILY_STARTUP_TIME.OnChange :=nil;
  calDAILY_PRE_TIME();
  txtDAILY_STARTUP_TIME.OnChange :=txtDAILY_STARTUP_TIMEChange;
end;

procedure TfResGroup.cbxPRE_TIMEChange(Sender: TObject);
begin
  txtPREP_TIME.OnChange :=nil;
  calPRE_TIME();
  txtPREP_TIME.OnChange :=txtPREP_TIMEChange;
end;

procedure TfResGroup.cdsRES_GRP_MSTRAfterScroll(DataSet: TDataSet);
begin
  cbxPRE_TIMEChange(cbxPRE_TIME);
  cbxDAILY_PRE_TIMEChange(cbxDAILY_PRE_TIME);
  cbxDAILY_CLEANUP_TIMEChange(cbxDAILY_CLEANUP_TIME);
  cbxCLEANUP_TIMEChange(cbxCLEANUP_TIME);
  seditOPER_COST.OnChange :=nil;
  if cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').Value = NULL then
  begin
    seditOPER_COST.Value := 0;
    seditOPER_COST.Text := FloattoStr(0.00);
  end
  else
  begin
    seditOPER_COST.Value := cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').Value;
    seditOPER_COST.Text := FormatFloat('0.00', cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').AsFloat);
  end;
  seditOPER_COST.OnChange := seditOPER_COSTChange;
end;

procedure TfResGroup.cdsRES_GRP_MSTRNewRecord(DataSet: TDataSet);
begin
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsInteger := nextid;
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_TYPE_CD').AsInteger := 1;
  cdsRES_GRP_MSTR.FieldByName('UTILIZATION_TYPE_CD').AsInteger := 1;
  cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_NAME').AsString := 'New Group ' + IntToStr(nextid);
  cdsRES_GRP_MSTR.FieldByName('PREP_TIME').AsInteger := 0;
  cdsRES_GRP_MSTR.FieldByName('CLEANUP_TIME').AsInteger := 0;
  cdsRES_GRP_MSTR.FieldByName('DAILY_STARTUP_TIME').AsInteger := 0;
  cdsRES_GRP_MSTR.FieldByName('DAILY_CLEANUP_TIME').AsInteger := 0;
  seditOPER_COST.Text := '0.00';
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

procedure TfResGroup.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  idexitform:integer;
begin
  if (cdsRES_GRP_MSTR.State in [dsEdit, dsInsert]) or (cdsRES_GRP_MSTR.ChangeCount > 0) then
  begin
    idexitform := Application.MessageBox('Save Changes before exiting?', 'Confirm', MB_YESNOCANCEL or MB_ICONQUESTION);
    canclose := True;
    case idexitform of
      ID_YES:
        cdsRES_GRP_MSTR.ApplyUpdates(0);
      ID_NO:
        ;
      ID_CANCEL:
        canclose := False;
    end
  end
end;

procedure TfResGroup.SaveBoolean;
begin
  dbgridResource.SelectedField.DataSet.Edit;
  dbgridResource.SelectedField.AsBoolean := NOT dbgridResource.SelectedField.AsBoolean;
  dbgridResource.SelectedField.DataSet.Post;
end;

procedure TfResGroup.seditOPER_COSTChange(Sender: TObject);
begin
  if not(cdsRES_GRP_MSTR.State in [dsInsert, dsEdit]) then
    cdsRES_GRP_MSTR.Edit;
end;

procedure TfResGroup.seditOPER_COSTExit(Sender: TObject);
begin
  if seditOPER_COST.Text <> '' then
  begin
    validateCost;
    if cdsRES_GRP_MSTR.State in [dsInsert, dsEdit] then
      cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').Value := FormatFloat('0.00', StrToFloat(seditOPER_COST.Text));
    if cdsRES_GRP_MSTR.State = dsBrowse then
    begin
      seditOPER_COST.OnChange :=nil;
      seditOPER_COST.Text := cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').Value;
      seditOPER_COST.Text := FormatFloat('0.00', StrToFloat(seditOPER_COST.Text));
      seditOPER_COST.OnChange := seditOPER_COSTChange;
    end
    else
    begin
      seditOPER_COST.Text := cdsRES_GRP_MSTR.FieldByName('OPERATION_COST').Value;
      seditOPER_COST.Text := FormatFloat('0.00', StrToFloat(seditOPER_COST.Text));
    end;
  end;
end;

procedure TfResGroup.spinButtonCostDownClick(Sender: TObject);
begin
  seditOPER_COST.Text :=  FloatToStr(StrToFloat(seditOPER_COST.Text) - 1);
  validateCost;
end;
procedure TfResGroup.validateCost;
begin
  if StrToFloat(seditOPER_COST.Text) > seditOPER_COST.MaxValue then
    seditOPER_COST.Text := seditOPER_COST.MaxValue.ToString;
  if StrToFloat(seditOPER_COST.Text) < seditOPER_COST.MinValue then
    seditOPER_COST.Text := seditOPER_COST.MinValue.ToString;
end;
procedure TfResGroup.spinButtonCostUpClick(Sender: TObject);
begin
  seditOPER_COST.Text :=  FloatToStr(StrToFloat(seditOPER_COST.Text) + 1);
  validateCost;
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

procedure TfResGroup.downClickExecute(Sender: TObject);
begin
  if seditOPER_COST.Focused then
  begin
    seditOPER_COST.Text :=  FloatToStr(StrToFloat(seditOPER_COST.Text) - 1);
    validateCost;
  end;
end;

end.
