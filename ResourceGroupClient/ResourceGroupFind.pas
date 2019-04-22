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
    procedure ResetGridFields(ipOrdBy: String);
    procedure CloseForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fResGrpSearch: TfResGrpSearch;
  sColList: Array of String;
  sColValList: Array of String;
  sColWidList: Array of Integer;

implementation
{$R *.dfm}

uses uResourceGroupClient;

procedure TfResGrpSearch.actCloseExecute(Sender: TObject);
begin
   CloseForm;
end;

procedure TfResGrpSearch.actGoExecute(Sender: TObject);
begin
  RefreshRec;
end;

procedure TfResGrpSearch.actGoUpdate(Sender: TObject);
begin
  actGo.Enabled := (dbgridResults.SelectedRows.Count > 0);
end;

procedure TfResGrpSearch.actSearchExecute(Sender: TObject);
var
InqStr:String;
newsql:TStringBuilder;
begin
  cbxNameDesc.AddItem(cbxNameDesc.Text,nil);
  if cbxFindCondition.Text = 'Starts With' then
    InqStr := cbxNameDesc.Text + '%'
  else
    if cbxFindCondition.Text = 'Contains' then
      InqStr := '%' + cbxNameDesc.Text + '%'
    else
      InqStr := '%' + cbxNameDesc.Text;
//  dsRES_GRP_MSTR_cds.Enabled := FALSE;
  cdsRES_GRP_MSTR.Close;
  newsql := TStringBuilder.Create;
  newsql.Clear;
  if cbxFindBy.Text = 'Name' then
  begin
    newsql.Append('select resource_group_name, resource_group_desc, resource_group_id from resource_group_mstr WHERE resource_group_name like ');
    newsql.Append(QuotedStr(InqStr));
    newsql.Append(' order by resource_group_name');
    cdsRES_GRP_MSTR.CommandText := newsql.ToString;
  end
  else
  begin
    newsql.Append('select resource_group_name, resource_group_desc, resource_group_id from resource_group_mstr WHERE resource_group_desc like ');
    newsql.Append(QuotedStr(InqStr));
    newsql.Append(' order by resource_group_desc');
    cdsRES_GRP_MSTR.CommandText := newsql.ToString;
  end;
  ResetGridFields(cbxFindBy.Text);
  cdsRES_GRP_MSTR.Open;
//  dsRES_GRP_MSTR_cds.Enabled := TRUE;
end;

procedure TfResGrpSearch.dbgridResultsDblClick(Sender: TObject);
begin
   RefreshRec;
end;

procedure TfResGrpSearch.RefreshRec();
var
  opResGrpID:Integer;
begin
  if not cdsRES_GRP_MSTR.Active then
    cdsRES_GRP_MSTR.Open;
  if cdsRES_GRP_MSTR.RecordCount <> 0 then
    opResGrpID := cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').Value
  else
    opResGrpID :=0;
  fResGroup.RepRecs(opResGrpID);
  if tglCloseOnGo.Checked = TRUE then CloseForm;
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
  dbgridResults.Columns.Clear;
  for iPos := low(sColList) to high(sColList) do
    begin
      dbgridResults.Columns.Add.FieldName := sColList[iPos];
      dbgridResults.Columns[iPos].Title.Caption := sColValList[iPos];
      dbgridResults.Columns[iPos].Width := sColWidList[iPos];
    end;
end;

procedure TfResGrpSearch.CloseForm();
begin
  dsRES_GRP_MSTR_cds.Enabled := FALSE;
  cdsRES_GRP_MSTR.Close;
  cbxFindBy.ItemIndex := 0;
  cbxFindCondition.ItemIndex := 0;
  ResetGridFields('Name');
  fResGrpSearch.Close;
end;
end.
