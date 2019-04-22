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
// File generated on 4/19/2019 2:51:50 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: D:\GitHub\Ross\ResourceGroupServer\ResourceGroupServer (1)
// LIBID: {9ED91464-095D-4CD5-A84C-2CA57458379B}
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

  LIBID_ResourceGroupServer: TGUID = '{9ED91464-095D-4CD5-A84C-2CA57458379B}';

  IID_IRGS: TGUID = '{933DB919-2870-4E94-8573-9BA03607B192}';
  CLASS_RGS: TGUID = '{B00C20A6-E999-4626-8839-850BE25C0855}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary
// *********************************************************************//
  IRGS = interface;
  IRGSDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  RGS = IRGS;


// *********************************************************************//
// Interface: IRGS
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {933DB919-2870-4E94-8573-9BA03607B192}
// *********************************************************************//
  IRGS = interface(IAppServer)
    ['{933DB919-2870-4E94-8573-9BA03607B192}']
  end;

// *********************************************************************//
// DispIntf:  IRGSDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {933DB919-2870-4E94-8573-9BA03607B192}
// *********************************************************************//
  IRGSDisp = dispinterface
    ['{933DB919-2870-4E94-8573-9BA03607B192}']
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
// The Class CoRGS provides a Create and CreateRemote method to
// create instances of the default interface IRGS exposed by
// the CoClass RGS. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoRGS = class
    class function Create: IRGS;
    class function CreateRemote(const MachineName: string): IRGS;
  end;

implementation

uses System.Win.ComObj;

class function CoRGS.Create: IRGS;
begin
  Result := CreateComObject(CLASS_RGS) as IRGS;
end;

class function CoRGS.CreateRemote(const MachineName: string): IRGS;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RGS) as IRGS;
end;

end.

