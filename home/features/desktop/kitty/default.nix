{ inputs, pkgs, config, ... }: {
  home.packages = [ pkgs.kitty ];
  
  programs.kitty = {
    enable = true;
    theme = "Catppuccin-Mocha";
  };
}
