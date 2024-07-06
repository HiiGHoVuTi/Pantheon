{ ... }: {

  imports = [
    ../common/global
    ../common/users/pilot.nix

    ../common/optional/pipewire.nix
    ../common/optional/desktop/xdg-portal.nix
    ../common/optional/xorg/lightdm.nix
    ../common/optional/xorg/xmonad
    ../common/optional/wayland/hyprland.nix
    # ../common/optional/greetd.nix
    # ../common/optional/services/kanata.nix

    ./services/syncthing.nix 

    ./hardware
    ./boot.nix
  ];

  # Networking
  networking.hostName = "gauss";
  networking.networkmanager.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.X11Forwarding = true;
  
  # Styles
  stylix.targets.gtk.enable = true;
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
  
}
