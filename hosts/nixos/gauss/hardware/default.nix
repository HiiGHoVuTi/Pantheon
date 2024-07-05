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
}
