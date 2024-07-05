{ pkgs, ... }: {
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  environment.systemPackages = [ pkgs.xdg-utils ];
}
