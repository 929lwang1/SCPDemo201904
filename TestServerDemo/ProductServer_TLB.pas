unit ProductServer_TLB;

// ************************************************************************ //
// WARNING
// -------
// The types declared in this file were generated from data read from a
// Type Library. If this type library is explicitly or indirectly (via
// another type library referring to this type library) re-imported, or the
// 'Refresh' command of the Type Library Editor activated while editing the
// Type Library, the contents of this file will be regenerated and all
// manual modifications will be lost.
// ************************************************************************ //

// $Rev: 52393 $
// File generated on 4/10/2019 11:05:32 AM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Users\lwang1\Documents\Embarcadero\Studio\Projects\ProductServer (1)
// LIBID: {A611CB6F-78D8-44E2-B13C-400B660327A4}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 Midas, (midas.dll)
//   (3) v4.0 StdVCL, (stdvcl40.dll)
// SYS_KIND: SYS_WIN32
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers.
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
{$ALIGN 4}

interface

uses Winapi.Windows, Midas, System.Classes, System.Variants, System.Win.StdVCL, Vcl.Graphics, Vcl.OleServer, Winapi.ActiveX;



// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ProductServerMajorVersion = 1;
  ProductServerMinorVersion = 0;

  LIBID_ProductServer: TGUID = '{A611CB6F-78D8-44E2-B13C-400B660327A4}';

  IID_IProduct: TGUID = '{984DCC7A-B707-426F-8E88-4869046A95F5}';
  CLASS_Product: TGUID = '{A9823DC0-C360-4F91-A42B-E1986C1D2AA2}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IProduct = interface;
  IProductDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  Product = IProduct;


// *********************************************************************//
// Interface: IProduct
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {984DCC7A-B707-426F-8E88-4869046A95F5}
// *********************************************************************//
  IProduct = interface(IAppServer)
    ['{984DCC7A-B707-426F-8E88-4869046A95F5}']
  end;

// *********************************************************************//
// DispIntf:  IProductDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {984DCC7A-B707-426F-8E88-4869046A95F5}
// *********************************************************************//
  IProductDisp = dispinterface
    ['{984DCC7A-B707-426F-8E88-4869046A95F5}']
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: SYSINT;
                             out ErrorCount: SYSINT; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: SYSINT; out RecsOut: SYSINT;
                           Options: SYSINT; const CommandText: WideString; var Params: OleVariant;
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: SYSINT;
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString;
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoProduct provides a Create and CreateRemote method to
// create instances of the default interface IProduct exposed by
// the CoClass Product. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoProduct = class
    class function Create: IProduct;
    class function CreateRemote(const MachineName: string): IProduct;
  end;

implementation

uses System.Win.ComObj;

class function CoProduct.Create: IProduct;
begin
  Result := CreateComObject(CLASS_Product) as IProduct;
end;

class function CoProduct.CreateRemote(const MachineName: string): IProduct;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Product) as IProduct;
end;

end.

