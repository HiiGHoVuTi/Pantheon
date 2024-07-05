{ pkgs, lib, config, ... }:
{
  imports = [ ../global.nix ./hyprpaper.nix ];

  stylix.targets.hyprland.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    extraConfig = builtins.readFile ./hyprland.conf;

    settings = {
      # {{{ Decoration
      decoration = {
        rounding = config.pantheon.theming.rounding.radius;
        active_opacity = 1;
        inactive_opacity = 1;

        blur = {
          enabled = config.pantheon.theming.blur.enable;
          ignore_opacity = true;
          xray = true;
          size = config.pantheon.theming.blur.size;
          passes = config.pantheon.theming.blur.passes;
          contrast = config.pantheon.theming.blur.contrast;
          brightness = config.pantheon.theming.blur.brightness;
          noise = 0.05;
        };
      };
      # }}}
      # {{{ Monitors
      # Configure monitor properties
      # monitor = lib.forEach config.pantheon.monitors (m:
      #   lib.concatStringsSep "," [
      #     m.name
      #     "${toString m.width}x${toString m.height}@${toString m.refreshRate}"
      #     "${toString m.x}x${toString m.y}"
      #     "1"
      #   ]
      # );

      # # Map monitors to workspaces
      # workspace = lib.lists.concatMap
      #   (m: lib.lists.optional (m.workspace != null) "${m.name},${m.workspace}")
      #   config.pantheon.monitors;
      # }}}
    };
  };
}

