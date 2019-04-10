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
