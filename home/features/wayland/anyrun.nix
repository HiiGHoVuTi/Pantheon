{ inputs, pkgs, config, ... }: {
  programs.anyrun = {
    enable = true;
    config = {
      # {{{ Plugins
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        dictionary
        rink
        stdin
        # symbols # Looks ugly atm
        # websearch
      ];
      # }}}
      # {{{ Geometry 
      x.fraction = 0.5;
      y.fraction = 0.25;
      width.fraction = 0.5;
      # }}}

      hidePluginInfo = true;
      closeOnClick = true;
      showResultsImmediately = true;
      maxEntries = 7;
    };

    extraCss = /* css */ ''
      /* {{{ Global overrides */
      #window,
      #entry,
      #main,
      #plugin,
      #match {
        background: transparent;
      }

      * {
        font-size: 2rem;
        outline: none;
      }
      /* }}} */
      /* {{{ Transparent & raised surfaces */
      #entry,
      list#main,
      row#match:selected {
        box-shadow: 0.5px 0.5px 1.5px 1.5px rgba(0, 0, 0, 0.5);
        border-radius: ${toString config.pantheon.theming.rounding.radius}px;
      }

      #entry,
      list#main {
        margin: 1rem;
        background: rgba(${config.pantheon.theming.colors.rgba "base00"});
        min-height: 1rem;
      }
      /* }}} */
      /* {{{ Input */
      #entry {
        font-size: 2rem;
        padding: 1rem;
        border: none;
      }
      /* }}} */
      /* {{{ Matches */
      row#match {
        margin: 0.7rem;
        margin-bottom: 0.3rem;
        color: ${config.lib.stylix.scheme.withHashtag.base05};
        padding: 0.5rem;
        transition: none;
      }

      row#match:last-child {
        margin-bottom: 0.7rem;
      }

      #match:selected {
        padding: 0.5rem;
        color: ${config.lib.stylix.scheme.withHashtag.base05};
        background: rgba(${config.pantheon.theming.colors.rgb "base03"}, 0.2);
      }
      /* }}} */
    '';
  };
}
