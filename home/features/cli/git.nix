{ pkgs, ... }: {
  home.packages = [ pkgs.josh ]; # Just One Single History

  # TODO: use `delta` as a pager, as highlighted here
  # https://github.com/lilyinstarlight/foosteros/blob/main/config/base.nix#L163
  programs.git = {
    enable = true;
    package = pkgs.gitFull;

    userName = "Juliette";
    userEmail = "juliette@ponsonnet.org";

    # {{{ Globally ignored files
    ignores = [
      # Syncthing
      ".stfolder"
      ".stversions"

      # Direnv
      ".direnv"
      ".envrc"

      # Haskell
    ];
    # }}}
    # {{{ Aliases 
    aliases = {
      # Print history nicely
      graph = "log --decorate --oneline --graph";

      # Print last commit's hash
      hash = "log -1 --format='%H'";

      # Count the number of commits
      count = "rev-list --count --all";
    };
    # }}}

    extraConfig = {
      github.user = "HiiGHoVuTi";
      hub.protocol = "ssh";
      core.editor = "nvim";
      init.defaultBranch = "main";
      rebase.autoStash = true;

      # {{{ Signing
      # Sign commits using ssh
      gpg.format = "ssh";
      user.signingkey = "~/.ssh/id_ed25519.pub";

      # Sign everything by default
      commit.gpgsign = true;
      tag.gpgsign = true;
      # }}}
    };
  };

  # {{{ Github cli
  programs.gh = {
    enable = true;
    settings.git_protocol = "ssh";
  };
  # }}}
}
