unit AddResource;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Datasnap.Provider, Datasnap.DBClient, Data.Win.ADODB;

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
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var strResourceId:String;
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

procedure TfrmAddresource.btnOkClick(Sender: TObject);
var i:Integer;
begin
   if dbgrdResource.SelectedRows.Count > 0 then
   begin
      strResourceId := '';
      with dbgrdResource.DataSource.DataSet do
      begin
         for i:=0 to dbgrdResource.SelectedRows.Count-1 do
         begin
            GotoBookmark(dbgrdResource.SelectedRows.Items[i]);
            if strResourceId = '' then
            begin
               strResourceId := strResourceId + cdsAddResource.FieldByName('RESOURCE_ID').AsString;
            end
            else
            begin
               strResourceId := strResourceId + '^' + cdsAddResource.FieldByName('RESOURCE_ID').AsString;
            end;
         end;
      end;
   end;
   frmAddresource.Close;
end;
end.
