unit uProductModule;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ProductServer_TLB, StdVcl, Data.DB, Data.Win.ADODB,
  Datasnap.Provider;

type
  TProduct = class(TRemoteDataModule, IProduct)
    connMain: TADOConnection;
    qryRES_GRP_MSTR: TADOQuery;
    qryRES_GRPS: TADOQuery;
    qryRES_MSTR: TADOQuery;
    dsRES_GRP_MSTR: TDataSource;
    dspRES_GRP_MSTR: TDataSetProvider;
    qryUTL_TYPE_MSTR: TADOQuery;
    dspRES_MSTR: TDataSetProvider;
    dspUTL_TYPE_MSTR: TDataSetProvider;
    qryRES_GRPSRESOURCE_GROUP_ID: TIntegerField;
    qryRES_GRPSRESOURCE_ID: TIntegerField;
    qryRES_GRPSUSE_GROUP_SETTINGS_IND: TWideStringField;
    qryRES_GRPSPRIORITY_INDEX: TIntegerField;
    qryRES_GRP_MSTRRESOURCE_GROUP_ID: TIntegerField;
    qryRES_GRP_MSTRRESOURCE_GROUP_NAME: TWideStringField;
    qryRES_GRP_MSTRRESOURCE_TYPE_CD: TSmallintField;
    qryRES_GRP_MSTRRESOURCE_GROUP_DESC: TWideStringField;
    qryRES_GRP_MSTRUTILIZATION_TYPE_CD: TSmallintField;
    qryRES_GRP_MSTROPERATION_COST: TFMTBCDField;
    qryRES_GRP_MSTRPREP_TIME: TFMTBCDField;
    qryRES_GRP_MSTRCLEANUP_TIME: TFMTBCDField;
    qryRES_GRP_MSTRDAILY_STARTUP_TIME: TFMTBCDField;
    qryRES_GRP_MSTRDAILY_CLEANUP_TIME: TFMTBCDField;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TProduct.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
begin
  if Register then
  begin
    inherited UpdateRegistry(Register, ClassID, ProgID);
    EnableSocketTransport(ClassID);
    EnableWebTransport(ClassID);
  end else
  begin
    DisableSocketTransport(ClassID);
    DisableWebTransport(ClassID);
    inherited UpdateRegistry(Register, ClassID, ProgID);
  end;
end;

initialization
  TComponentFactory.Create(ComServer, TProduct,
    Class_Product, ciMultiInstance, tmApartment);
end.
