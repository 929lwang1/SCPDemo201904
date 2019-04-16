unit AddResource;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Datasnap.Provider, Datasnap.DBClient, Data.Win.ADODB,
  System.Actions, Vcl.ActnList, Vcl.ExtCtrls;

type
  TfrmAddresource = class(TForm)
    lbInfor: TLabel;
    dbgrdResource: TDBGrid;
    btnOk: TButton;
    btnCancel: TButton;
    qryAddResource: TADOQuery;
    cdsAddResource: TClientDataSet;
    dspAddResource: TDataSetProvider;
    dsAddResource_cds: TDataSource;
    cdsAddResourceRESOURCE_ID: TIntegerField;
    cdsAddResourceLOC_ID: TIntegerField;
    cdsAddResourceRESOURCE_NAME: TWideStringField;
    cdsAddResourceRESOURCE_TYPE_CD: TSmallintField;
    cdsAddResourceRESOURCE_DESC: TWideStringField;
    cdsAddResourceDISPLAY_COLOR: TIntegerField;
    cdsAddResourceOPERATION_COST: TFMTBCDField;
    cdsAddResourcePREP_TIME: TFMTBCDField;
    cdsAddResourceCLEANUP_TIME: TFMTBCDField;
    cdsAddResourceDAILY_STARTUP_TIME: TFMTBCDField;
    cdsAddResourceDAILY_CLEANUP_TIME: TFMTBCDField;
    cdsAddResourceCAPACITY_QTY: TFMTBCDField;
    cdsAddResourceMIN_CAPACITY_QTY: TFMTBCDField;
    cdsAddResourceLABOR_AVAILABLE_UNITS: TFMTBCDField;
    cdsAddResourceENFORCE_CAPACITY_CONSTRAINT: TWideStringField;
    cdsAddResourceUOM_GROUP_NAME: TWideStringField;
    cdsAddResourceRUN_RATE_MODIFIER: TFMTBCDField;
    actAddResource: TActionList;
    actOK: TAction;
    actCancel: TAction;
    panButton: TPanel;
    panLabel: TPanel;
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure dbgrdResourceCellClick(Column: TColumn);
  private
    FstrResourceId: String;
    procedure SetstrResourceId(Value: String);
    { Private declarations }
  public
    property strResourceId: string read FstrResourceId write SetstrResourceId;
    { Public declarations }
  end;

var
  frmAddresource: TfrmAddresource;

implementation

{$R *.dfm}
uses uResourceGroupClient;

procedure TfrmAddresource.btnCancelClick(Sender: TObject);
begin
   frmAddresource.Close;
end;
procedure TfrmAddresource.SetstrResourceId(Value: String);
begin
  if FstrResourceId <> Value then
  begin
    FstrResourceId := Value;
  // Repaint;    // update user interface to reflect new value
  end;
end;
procedure TfrmAddresource.btnOkClick(Sender: TObject);
var i:Integer;
begin
  if dbgrdResource.SelectedRows.Count > 0 then
  begin
    FstrResourceId := '';
    with dbgrdResource.DataSource.DataSet do
    begin
      for i:=0 to dbgrdResource.SelectedRows.Count-1 do
      begin
        GotoBookmark(dbgrdResource.SelectedRows.Items[i]);
        if FstrResourceId = '' then
        begin
          FstrResourceId := FstrResourceId + cdsAddResource.FieldByName('RESOURCE_ID').AsString;
        end
        else
        begin
          FstrResourceId := FstrResourceId + '^' + cdsAddResource.FieldByName('RESOURCE_ID').AsString;
        end;
      end;
    end;
    frmAddresource.SetstrResourceId(FstrResourceId);
  end
  else
  begin
    FstrResourceId := cdsAddResource.FieldByName('RESOURCE_ID').AsString;
    frmAddresource.SetstrResourceId(FstrResourceId);
  end;
  frmAddresource.Close;
end;


procedure TfrmAddresource.dbgrdResourceCellClick(Column: TColumn);
begin
    frmAddresource.btnOk.Enabled := True;
end;

procedure TfrmAddresource.FormActivate(Sender: TObject);
begin
  if fResGroup.allowMultiSelect then
  begin
    dbgrdResource.Options:=dbgrdResource.Options + [dgMultiSelect];
    frmAddresource.btnOk.Enabled := False;
  end
  else
  begin
    dbgrdResource.Options:=dbgrdResource.Options - [dgMultiSelect];
  end;
end;
end.
