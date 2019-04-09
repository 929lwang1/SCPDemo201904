unit uResourceGroupModule;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, ComServ, ComObj, VCLCom, DataBkr,
  DBClient, ResourceGroupServer_TLB, StdVcl, Data.DB, Data.Win.ADODB;

type
  TResourceGroup = class(TRemoteDataModule, IResourceGroup)
    connMain: TADOConnection;
    qryRES_GRP_MSTR: TADOQuery;
    qryRES_GRP: TADOQuery;
  private
    { Private declarations }
  protected
    class procedure UpdateRegistry(Register: Boolean; const ClassID, ProgID: string); override;
  public
    { Public declarations }
  end;

implementation

{$R *.DFM}

class procedure TResourceGroup.UpdateRegistry(Register: Boolean; const ClassID, ProgID: string);
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
  TComponentFactory.Create(ComServer, TResourceGroup,
    Class_ResourceGroup, ciMultiInstance, tmApartment);
end.
