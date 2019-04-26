unit ResourceGroupFind;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.FileCtrl,
  Vcl.ComCtrls, Data.DB, Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, System.Actions,
  Vcl.ActnList, Datasnap.DBClient, Datasnap.Provider;

type
  TfResGrpSearch = class(TForm)
    panelFind: TPanel;
    panelControl: TPanel;
    panelResults: TPanel;
    lblFind: TLabel;
    tglCloseOnGo: TCheckBox;
    btnGo: TButton;
    btnClose: TButton;
    btnSearch: TButton;
    cbxFindBy: TComboBox;
    cbxFindCondition: TComboBox;
    cbxNameDesc: TComboBox;
    dbgridResults: TDBGrid;
    cdsRES_GRP_MSTR: TClientDataSet;
    dsRES_GRP_MSTR_cds: TDataSource;
    ActionList1: TActionList;
    actGo: TAction;
    actClose: TAction;
    actSearch: TAction;
    procedure actSearchExecute(Sender: TObject);
    procedure actGoExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actGoUpdate(Sender: TObject);
    procedure dbgridResultsDblClick(Sender: TObject);
    procedure RefreshRec;
    procedure SaveHistory;
    procedure PopNameDescList;
    procedure RefreshBrowser;
    procedure ResetGridFields(ipOrdBy: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    function GridNeedRefresh(): boolean;
  private
    { Private declarations }
    psHist: TStringList;
    psText: String;
    ptglHist: boolean;
  public
    { Public declarations }
    property strHist: TStringList read psHist;
    property strText: string read psText;
    property tglHist: boolean read ptglHist;
  end;

var
  fResGrpSearch: TfResGrpSearch;
  sColList: Array of String;
  sColValList: Array of String;
  sColWidList: Array of Integer;
  sPrevFilter: string;

implementation
{$R *.dfm}

uses uResourceGroupClient;

procedure TfResGrpSearch.actCloseExecute(Sender: TObject);
begin
  fResGrpSearch.Close;
end;

procedure TfResGrpSearch.actGoExecute(Sender: TObject);
begin
  RefreshRec;
end;

procedure TfResGrpSearch.actGoUpdate(Sender: TObject);
begin
  actGo.Enabled := (dbgridResults.SelectedRows.Count > 0);
end;

procedure TfResGrpSearch.RefreshBrowser;
var
strInq:String;
newsql:TStringBuilder;
begin
  dbgridResults.DataSource.DataSet.DisableControls;
  cdsRES_GRP_MSTR.Close;
  newsql := TStringBuilder.Create;
  newsql.Clear;
  if cbxFindCondition.Text = 'Starts With' then
    strInq := cbxNameDesc.Text + '%'
  else
    if cbxFindCondition.Text = 'Contains' then
      strInq := '%' + cbxNameDesc.Text + '%'
    else
      strInq := '%' + cbxNameDesc.Text;
  newsql.Append('select resource_group_name, resource_group_desc, resource_group_id from resource_group_mstr WHERE resource_group_');
  if cbxFindBy.Text = 'Name' then
    newsql.Append('name like ')
  else
    newsql.Append('desc like ');
  newsql.Append(QuotedStr(strInq));
  newsql.Append(' order by resource_group_');
  if cbxFindBy.Text = 'Name' then
    newsql.Append('name')
  else
    newsql.Append('desc');
  cdsRES_GRP_MSTR.CommandText := newsql.ToString;
  ResetGridFields(cbxFindBy.Text);
  cdsRES_GRP_MSTR.Open;
  dbgridResults.DataSource.DataSet.EnableControls;
end;

procedure TfResGrpSearch.actSearchExecute(Sender: TObject);
begin
  PopNameDescList; //add items to cbxNameDesc to save search histories
  if true = GridNeedRefresh then
     RefreshBrowser;
end;

function TfResGrpSearch.GridNeedRefresh(): boolean;
var
  strCurrentFilter: string;
begin
   strCurrentFilter := cbxFindBy.Text + cbxFindCondition.Text + cbxNameDesc.Text;
   if strCurrentFilter =  sPrevFilter then
     Result := false
   else
   begin
     sPrevFilter := strCurrentFilter;
     Result := true;
   end;
end;

procedure TfResGrpSearch.dbgridResultsDblClick(Sender: TObject);
var
  Pt: TPoint;
  Coord: TGridCoord;
  ClickCol: Integer;
begin
  Pt := dbgridResults.ScreenToClient(Mouse.CursorPos);
  Coord := dbgridResults.MouseCoord(Pt.X, Pt.Y);
  ClickCol := Coord.X;
  if ClickCol >= 0 then
    RefreshRec;
end;

procedure TfResGrpSearch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fResGrpSearch.Free;
end;

procedure TfResGrpSearch.FormDestroy(Sender: TObject);
begin
  SaveHistory;
end;

procedure TfResGrpSearch.FormShow(Sender: TObject);
begin
  cbxFindBy.ItemIndex := 0;
  cbxFindCondition.ItemIndex := 0;
  ResetGridFields('Name');
  tglCloseOnGo.Checked := fResGroup.tglHist;
  cbxNameDesc.Text := fResGroup.strText;
  if fResGroup.strHist <> nil then
    cbxNameDesc.Items.Assign(fResGroup.strHist);
end;

procedure TfResGrpSearch.SaveHistory();
var
iIdx: integer;
begin
  psHist := TStringList.Create;
  with psHist do
  begin
    for iIdx := 0 to (cbxNameDesc.Items.Count - 1) do
      Add(cbxNameDesc.Items[iIdx]);
  end;
  psText := cbxNameDesc.Text;
  ptglHist := tglCloseOnGo.Checked;
  fResGroup.GetSearchHist();
end;

procedure TfResGrpSearch.RefreshRec();
begin
  if cdsRES_GRP_MSTR.Active and (dbgridResults.SelectedRows.Count > 0) then
  begin
    if cdsRES_GRP_MSTR.RecordCount > 0 then
    begin
      fResGroup.RepRecs(cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').Value);
      if (tglCloseOnGo.Checked = TRUE) then fResGrpSearch.Close;
    end
  end;
end;

procedure TfResGrpSearch.ResetGridFields(ipOrdBy: String);
var
  iPos: integer;
begin
  SetLength(sColList,2);
  SetLength(sColValList,2);
  SetLength(sColWidList,2);
  if ipOrdBy = 'Name' then
  begin
    sColList := ['resource_group_name','resource_group_desc'];
    sColValList := ['Name','Description'];
    sColWidList := [124,244];
  end
  else
  begin
    sColList := ['resource_group_desc','resource_group_name'];
    sColValList := ['Description','Name'];
    sColWidList := [244,124];
  end;
  for iPos := low(sColList) to high(sColList) do
    begin
      dbgridResults.Columns[iPos].FieldName := sColList[iPos];
      dbgridResults.Columns[iPos].Title.Caption := sColValList[iPos];
      dbgridResults.Columns[iPos].Width := sColWidList[iPos];
    end;
end;

procedure TfResGrpSearch.PopNameDescList();
var
iIdx: integer;
bAddItm: Boolean;
begin
  bAddItm := True;
  for iIdx := 0 to (cbxNameDesc.Items.Count - 1) do
  begin
    if UpperCase(cbxNameDesc.Text) = UpperCase(cbxNameDesc.Items[iIdx]) then
      bAddItm := False;
  end;
  if bAddItm = True then
    cbxNameDesc.AddItem(cbxNameDesc.Text,nil);
end;
end.
