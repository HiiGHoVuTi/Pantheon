
{ inputs, ... }: {
  imports = [ inputs.darkmatter-grub-theme.nixosModule ];

  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [
     "i2c-dev" "i2c-piix4" # Ensure we can access i2c bus for RGB memory
  ];

}
