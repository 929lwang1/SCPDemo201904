unit ResourceGroupServer_TLB;

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
// File generated on 4/9/2019 2:57:42 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Users\lwang1\Documents\Embarcadero\Studio\Projects\ResourceGroupServer (1)
// LIBID: {3F5BA953-8BED-4F43-B4C2-A8C5CA96CE06}
// LCID: 0
// Helpfile:
// HelpString:
// DepndLst:
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v1.0 Midas, (c:\program files (x86)\embarcadero\studio\20.0\bin\midas.dll)
//   (3) v4.0 StdVCL, (C:\Windows\SysWow64\stdvcl40.dll)
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
  ResourceGroupServerMajorVersion = 1;
  ResourceGroupServerMinorVersion = 0;

  LIBID_ResourceGroupServer: TGUID = '{3F5BA953-8BED-4F43-B4C2-A8C5CA96CE06}';

  IID_IResourceGroup: TGUID = '{0F0A3E67-9E09-4080-92BC-E5C41D0BEDFF}';
  CLASS_ResourceGroup: TGUID = '{18EAB9F0-E2A3-4745-B0EB-8593575B2F9F}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IResourceGroup = interface;
  IResourceGroupDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  ResourceGroup = IResourceGroup;


// *********************************************************************//
// Interface: IResourceGroup
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0F0A3E67-9E09-4080-92BC-E5C41D0BEDFF}
// *********************************************************************//
  IResourceGroup = interface(IAppServer)
    ['{0F0A3E67-9E09-4080-92BC-E5C41D0BEDFF}']
  end;

// *********************************************************************//
// DispIntf:  IResourceGroupDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0F0A3E67-9E09-4080-92BC-E5C41D0BEDFF}
// *********************************************************************//
  IResourceGroupDisp = dispinterface
    ['{0F0A3E67-9E09-4080-92BC-E5C41D0BEDFF}']
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
// The Class CoResourceGroup provides a Create and CreateRemote method to
// create instances of the default interface IResourceGroup exposed by
// the CoClass ResourceGroup. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoResourceGroup = class
    class function Create: IResourceGroup;
    class function CreateRemote(const MachineName: string): IResourceGroup;
  end;

implementation

uses System.Win.ComObj;

class function CoResourceGroup.Create: IResourceGroup;
begin
  Result := CreateComObject(CLASS_ResourceGroup) as IResourceGroup;
end;

class function CoResourceGroup.CreateRemote(const MachineName: string): IResourceGroup;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ResourceGroup) as IResourceGroup;
end;

end.

