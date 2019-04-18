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
    qryRES_GRP_MSTR: TADOQuery;
    dspRES_GRP_MSTR: TDataSetProvider;
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
    procedure CloseForm;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fResGrpSearch: TfResGrpSearch;

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
begin
  cbxNameDesc.AddItem(cbxNameDesc.Text,nil);
  if cbxFindCondition.Text = 'Starts With' then
    InqStr := cbxNameDesc.Text + '%'
  else
    if cbxFindCondition.Text = 'Contains' then
      InqStr := '%' + cbxNameDesc.Text + '%'
    else
      InqStr := '%' + cbxNameDesc.Text;
  dsRES_GRP_MSTR_cds.Enabled := FALSE;
  cdsRES_GRP_MSTR.Close;
  if cbxFindBy.Text = 'Name' then
    qryRES_GRP_MSTR.Parameters.ParamByName('RESOURCE_GROUP_NAME').Value := InqStr
  else
    qryRES_GRP_MSTR.Parameters.ParamByName('RESOURCE_GROUP_DESC').Value := InqStr;
  cdsRES_GRP_MSTR.Open;
  dsRES_GRP_MSTR_cds.Enabled := TRUE;
end;

procedure TfResGrpSearch.dbgridResultsDblClick(Sender: TObject);
begin
   RefreshRec;
end;

procedure TfResGrpSearch.RefreshRec();
var
  opResGrpID:Integer;
begin
  opResGrpID := cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').Value;
  fResGroup.RepRecs(opResGrpID);
  if tglCloseOnGo.Checked = TRUE then CloseForm;
end;

procedure TfResGrpSearch.CloseForm();
begin
  dsRES_GRP_MSTR_cds.Enabled := FALSE;
  cdsRES_GRP_MSTR.Close;
  fResGrpSearch.Close;
end;
end.
