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
    procedure btnCloseClick(Sender: TObject);
    procedure actSearchExecute(Sender: TObject);
    procedure actGoExecute(Sender: TObject);
    procedure actCloseExecute(Sender: TObject);
    procedure actGoUpdate(Sender: TObject);
//    procedure dbgridResultsCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    var opResGrpID:Integer;
  end;

var
  fResGrpSearch: TfResGrpSearch;

implementation
{$R *.dfm}

uses uResourceGroupClient;

procedure TfResGrpSearch.actCloseExecute(Sender: TObject);
begin
   fResGrpSearch.Close;
end;

procedure TfResGrpSearch.actGoExecute(Sender: TObject);
begin
   //if dbgridResults.SelectedRows.Count > 0 then
   //ShowMessage('go to the selected records in the main screen with ResGrpID');
   //ShowMessage(cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').AsString);
   //fResGroup.Show;
   //fResGroup.Refresh;

   opResGrpID := cdsRES_GRP_MSTR.FieldByName('RESOURCE_GROUP_ID').Value;

   if tglCloseOnGo.Checked = TRUE then fResGrpSearch.Close;
   fResGroup.Show;
   fResGroup.RepRecs(opResGrpID);
   // ted fResGroup.refreshrecord;
   //fResGroup.cdsRES_GRP_MSTR.Locate('RESOURCE_GROUP_ID',opResGrpID,[]);
end;

procedure TfResGrpSearch.actGoUpdate(Sender: TObject);
begin
   //ShowMessage('abc' + IntToStr(dbgridResults.SelectedRows.Count));
   //if dbgridResults.SelectedRows.Count > 0 then
   //actGo.Enabled := (dbgridResults.SelectedRows.Count > 0);

end;

procedure TfResGrpSearch.actSearchExecute(Sender: TObject);
begin
   var
   InqStr:String;
   if cbxFindCondition.Text = 'Starts With' then
      InqStr := cbxNameDesc.Text + '%'
   else
      if cbxFindCondition.Text = 'Contains' then
         InqStr := '%' + cbxNameDesc.Text + '%'
      else
         InqStr := '%' + cbxNameDesc.Text;
   dsRES_GRP_MSTR_cds.Enabled := FALSE;
   //ShowMessage(cbxFindBy.Text + '^ val:' + InqStr);
   cdsRES_GRP_MSTR.Close;
   if cbxFindBy.Text = 'Name' then
      qryRES_GRP_MSTR.Parameters.ParamByName('RESOURCE_GROUP_NAME').Value := InqStr
   else
      qryRES_GRP_MSTR.Parameters.ParamByName('RESOURCE_GROUP_DESC').Value := InqStr;
   cdsRES_GRP_MSTR.Open;
   dsRES_GRP_MSTR_cds.Enabled := TRUE;
end;

procedure TfResGrpSearch.btnCloseClick(Sender: TObject);
begin
   fResGrpSearch.Close;
end;


{procedure TfResGrpSearch.dbgridResultsCellClick(Column: TColumn);
begin

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
end; }


end.
