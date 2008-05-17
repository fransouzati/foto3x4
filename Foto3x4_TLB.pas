unit Foto3x4_TLB;

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

// PASTLWTR : 1.2
// File generated on 3/5/2008 17:19:51 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Qualiom\Freewares\Foto3x4\Foto3x4.tlb (1)
// LIBID: {FCB965F3-E303-43EC-8BF1-2DC386B773BD}
// LCID: 0
// Helpfile: 
// HelpString: Foto3x4 Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  Foto3x4MajorVersion = 1;
  Foto3x4MinorVersion = 0;

  LIBID_Foto3x4: TGUID = '{FCB965F3-E303-43EC-8BF1-2DC386B773BD}';

  IID_IFoto3x4Server: TGUID = '{D56DF472-2875-478A-83EE-3F5381DB47D3}';
  CLASS_Foto3x4Server: TGUID = '{D485B7FD-4A84-4EE6-AF8E-FBA60FB0B1D3}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IFoto3x4Server = interface;
  IFoto3x4ServerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Foto3x4Server = IFoto3x4Server;


// *********************************************************************//
// Interface: IFoto3x4Server
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D56DF472-2875-478A-83EE-3F5381DB47D3}
// *********************************************************************//
  IFoto3x4Server = interface(IDispatch)
    ['{D56DF472-2875-478A-83EE-3F5381DB47D3}']
    function PegaFoto(const Arquivo: WideString; Zoom: SYSINT; const Tamanho: WideString; 
                      Borda: WordBool; const Inicia: WideString): OleVariant; safecall;
  end;

// *********************************************************************//
// DispIntf:  IFoto3x4ServerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D56DF472-2875-478A-83EE-3F5381DB47D3}
// *********************************************************************//
  IFoto3x4ServerDisp = dispinterface
    ['{D56DF472-2875-478A-83EE-3F5381DB47D3}']
    function PegaFoto(const Arquivo: WideString; Zoom: SYSINT; const Tamanho: WideString; 
                      Borda: WordBool; const Inicia: WideString): OleVariant; dispid 201;
  end;

// *********************************************************************//
// The Class CoFoto3x4Server provides a Create and CreateRemote method to          
// create instances of the default interface IFoto3x4Server exposed by              
// the CoClass Foto3x4Server. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoFoto3x4Server = class
    class function Create: IFoto3x4Server;
    class function CreateRemote(const MachineName: string): IFoto3x4Server;
  end;

implementation

uses ComObj;

class function CoFoto3x4Server.Create: IFoto3x4Server;
begin
  Result := CreateComObject(CLASS_Foto3x4Server) as IFoto3x4Server;
end;

class function CoFoto3x4Server.CreateRemote(const MachineName: string): IFoto3x4Server;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Foto3x4Server) as IFoto3x4Server;
end;

end.
