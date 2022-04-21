unit TrayIconEx;

// ToDo: Показывать первый кадр анимации сразу (без задержки)

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, LResources, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TTrayIconEx }

  TTrayIconEx = class(TTrayIcon)
  private
    FDefaultIcon: TIcon;

    procedure SetDefaultIcon(const AnIcon: TIcon);

  protected

  public
    // Constructor / Destructor
    constructor Create(TheOwner: TComponent); override;
    destructor Destroy; override;

    // New
    procedure RestoreIcon;

  published
    // Properties
    property Animate;
    property AnimateInterval;
    property Icons;

    // New
    property DefaultIcon: TIcon read FDefaultIcon write FDefaultIcon;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Additional',[TTrayIconEx]);
end;

{ TTrayIconEx }

procedure TTrayIconEx.SetDefaultIcon(const AnIcon: TIcon);
begin
  if AnIcon = FDefaultIcon then Exit;

  FDefaultIcon.Assign(AnIcon);
end;

constructor TTrayIconEx.Create(TheOwner: TComponent);
begin
  inherited Create(TheOwner);

  FDefaultIcon := TIcon.Create;
end;

destructor TTrayIconEx.Destroy;
begin
  FDefaultIcon.Free;

  inherited Destroy;
end;

procedure TTrayIconEx.RestoreIcon;
begin
  Animate := False;
  Icon := DefaultIcon;
end;

end.
