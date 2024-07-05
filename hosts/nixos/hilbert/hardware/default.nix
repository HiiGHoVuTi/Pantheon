{ inputs, ... }:
{
  imports = with inputs.nixos-hardware.nixosModules; [
    common-cpu-intel
    common-pc-laptop
    common-pc-ssd
    ./generated.nix
  ];

  # Nvidia GPU 
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.cudaSupport = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;
  hardware.opengl.driSupport32Bit = true;

  # Stop falling sleep old man
  systemd.targets.sleep.enable = false;
  systemd.targets.suspend.enable = false;
  systemd.targets.hibernate.enable = false;
  systemd.targets.hybrid-sleep.enable = false;

  # Storage
  fileSystems."/HDD" = {
    device = "/dev/sda1";
    fsType = "ext4";
    options = ["uid=1000,gid=100,forceuid,forcegid,x-systemd.automount,x-systemd.mount-timeout=5s"];
  };
}
