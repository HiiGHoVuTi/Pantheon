{ inputs, ... }:
let
  transparency = amount: {
    desktop = amount;
    applications = amount;
    terminal = amount;
    popups = amount;
  };

  base16 = name: "${inputs.base16-schemes}/base16/${name}.yaml";

  themes = {
    # {{{ Catppuccin mocha
    catppuccin-mocha = {
      stylix = {
        image = ./wallpapers/nix-catppuccin.png;
        base16Scheme = base16 "catppuccin-mocha";
        opacity = transparency 0.7;
        polarity = "dark";
      };
      pantheon.rounding.radius = 8.0;
    };
    # }}}
  };

  # Select your current theme here!
  currentTheme = themes.catppuccin-mocha;
in
{
  # We apply the current theme here.
  # The rest is handled by the respective modules!
  imports = [{
    stylix = currentTheme.stylix;
    pantheon.theming = currentTheme.pantheon;
  }];

  # Requires me to manually turn targets on!
  stylix.autoEnable = false;
}
