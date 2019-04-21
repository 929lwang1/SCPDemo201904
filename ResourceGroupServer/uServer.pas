unit uServer;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ResourceGroupServer_TLB, StdVcl, Data.DB, Datasnap.Provider,
  Data.Win.ADODB;

type
  TRGS = class(TRemoteDataModule, IRGS)
    ADOConnection1: TADOConnection;
    qryRES_GRP_MSTR: TADOQuery;
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
    dspRES_GRP_MSTR: TDataSetProvider;
    dsRES_GRP_MSTR: TDataSource;
    qryRES_GRP: TADOQuery;
    qryRES_GRPRESOURCE_GROUP_ID: TIntegerField;
    qryRES_GRPRESOURCE_ID: TIntegerField;
    qryRES_GRPUSE_GROUP_SETTINGS_IND: TWideStringField;
    qryRES_GRPPRIORITY_INDEX: TIntegerField;
    qryRES_MSTR: TADOQuery;
    qryUTL_TYPE_MSTR: TADOQuery;
    qryRES_GRP_ID: TADOQuery;
    dspRES_MSTR: TDataSetProvider;
    dspUTL_TYPE_MSTR: TDataSetProvider;
    dspRES_GRP_ID: TDataSetProvider;
    qryAddResource: TADOQuery;
    dspAddResource: TDataSetProvider;
    dspRES_GRP_MSTR_FIND: TDataSetProvider;
    dspRES_GRP: TDataSetProvider;
    qryRES_GRP_MSTR_FIND: TADOQuery;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TRGS.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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
  TComponentFactory.Create(ComServer, TRGS,
    Class_RGS, ciMultiInstance, tmApartment);
end.
