{ lib, config, ... }: {
  options.pantheon.dev = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "While true, makes out of store symlinks for files in dev mode";
    };

    root = lib.mkOption {
      type = lib.types.str;
      default = "${config.xdg.userDirs.extraConfig.XDG_PROJECTS_DIR}/pantheon";
      description = "Where the pantheon repo is cloned";
    };

    path = lib.mkOption {
      type = lib.types.functionTo lib.types.path;
      description = "The function used to conditionally symlink in or out of store based on the above paths";
    };
  };

  config.pantheon.dev.path = path:
    if config.pantheon.dev.enable then
      config.lib.file.mkOutOfStoreSymlink "${config.pantheon.dev.root}/${path}"
    else "${../..}/${path}";
}


