{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit TrayIconExLazPkg;

{$warn 5023 off : no warning about unused units}
interface

uses
  TrayIconEx, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('TrayIconEx', @TrayIconEx.Register);
end;

initialization
  RegisterPackage('TrayIconExLazPkg', @Register);
end.
