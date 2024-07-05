{ config, lib, pkgs, ... }:
{
  options.pantheon.lib.lua = {
    writeFile = lib.mkOption {
      type = with lib.types; functionTo (functionTo (functionTo path));
      description = "Format and write a lua file to disk";
    };
  };

  options.pantheon.lua.styluaConfig = lib.mkOption {
    type = lib.types.path;
    description = "Config to use for formatting lua modules";
  };

  config.pantheon.lib.lua = {
    writeFile = path: name: text:
      let
        destination = "${path}/${name}.lua";
        unformatted = pkgs.writeText "raw-lua-${name}" ''
          -- ❄️ I was generated using nix ^~^
          ${text}
        '';
      in
      # ${lib.getExe pkgs.stylua} --config-path ${config.pantheon.lua.styluaConfig} $out/${destination}
      pkgs.runCommand "formatted-lua-${name}" { } ''
        mkdir -p $out/${path}
        cp --no-preserve=mode ${unformatted} $out/${destination}
        ${lib.getExe pkgs.stylua} $out/${destination}
      '';
  };
}
