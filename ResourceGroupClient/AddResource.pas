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
    cdsAddResource: TClientDataSet;
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
    //procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure actOKExecute(Sender: TObject);
    procedure actOKUpdate(Sender: TObject);
    procedure dbgrdResourceDblClick(Sender: TObject);
    procedure AddResources;
  private
    FResourceId: String;
    { Private declarations }
  public
    property strResourceId: string read FResourceId;
    { Public declarations }
  end;

var
  frmAddresource: TfrmAddresource;

implementation

{$R *.dfm}
uses uResourceGroupClient;

procedure TfrmAddresource.actOKUpdate(Sender: TObject);
begin
  if fResGroup.allowMultiSelect then
    frmAddresource.btnOk.Enabled := dbgrdResource.SelectedRows.Count > 0;
end;

procedure TfrmAddresource.btnCancelClick(Sender: TObject);
begin
   frmAddresource.Close;
end;

//procedure TfrmAddresource.btnOkClick(Sender: TObject);
procedure TfrmAddresource.actOkExecute(Sender: TObject);
begin
   AddResources;
end;

procedure TfrmAddresource.AddResources;
var i:Integer;
begin
  if dbgrdResource.SelectedRows.Count > 0 then
  begin
    FResourceId := '';
    with dbgrdResource.DataSource.DataSet do
    begin
      for i:=0 to dbgrdResource.SelectedRows.Count-1 do
      begin
        GotoBookmark(dbgrdResource.SelectedRows.Items[i]);
        if FResourceId = '' then
        begin
          FResourceId := FResourceId + cdsAddResource.FieldByName('RESOURCE_ID').AsString;
        end
        else
        begin
          FResourceId := FResourceId + '^' + cdsAddResource.FieldByName('RESOURCE_ID').AsString;
        end;
      end;
    end;
  end
  else
  begin
    FResourceId := cdsAddResource.FieldByName('RESOURCE_ID').AsString;
  end;
  frmAddresource.Close;
end;

procedure TfrmAddresource.dbgrdResourceDblClick(Sender: TObject);
var
  Pt: TPoint;
  Coord: TGridCoord;
  ClickCol: Integer;
begin
  Pt := dbgrdResource.ScreenToClient(Mouse.CursorPos);
  Coord := dbgrdResource.MouseCoord(Pt.X, Pt.Y);
  ClickCol := Coord.X;
  if ClickCol >= 0 then
    AddResources;
end;

procedure TfrmAddresource.FormActivate(Sender: TObject);
begin
  if fResGroup.allowMultiSelect then
  begin
    dbgrdResource.Options:=dbgrdResource.Options + [dgMultiSelect];
  end
  else
  begin
    dbgrdResource.Options:=dbgrdResource.Options - [dgMultiSelect] + [dgRowSelect];
    frmAddresource.btnOk.Enabled := True;
  end;
end;
end.
