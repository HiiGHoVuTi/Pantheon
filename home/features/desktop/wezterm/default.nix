{ inputs, upkgs, config, ... }: {
  home.packages = [ upkgs.wezterm ];

  xdg.configFile."wezterm/nix".source =
    config.pantheon.lib.lua.writeFile
      "." "colorscheme"
      "return ${config.pantheon.colorscheme.lua}";
  xdg.configFile."wezterm/wezterm.lua".source =
    config.pantheon.dev.path "home/features/desktop/wezterm/wezterm.lua";
}
