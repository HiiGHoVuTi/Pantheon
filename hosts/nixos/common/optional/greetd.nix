{ config, lib, pkgs, ... }:
{
  services.greetd = {
    enable = true;
    vt = 1;
    settings = {
      default_session = {
        command = ''
          ${lib.getExe pkgs.greetd.tuigreet} \
            -c ${lib.getExe config.programs.hyprland.package} \
            -g "Bienvenue au Panthéon!" \
            --remember
            --asterisks
        '';
        user = config.users.users.pilot.name;
      };
    };
  };
}


