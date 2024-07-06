{ config, ... }:
let
  # Using `config.users.users.pilot.name` causes an infinite recursion error
  # due to the way the syncthing module is written
  user = config.pantheon.pilot.name;
  group = "syncthing";
  dataDir = "/home/${user}/media";
in
{
  services.syncthing = {
    inherit user group dataDir;
    enable = true;

    openDefaultPorts = true;
    configDir = "${dataDir}/.config";

    overrideDevices = true;
    overrideFolders = true;

    settings = {
      # {{{ Device ids 
      devices = {
        gauss.id = "NO7326T-W4ZKINU-CULG2CN-DTE4UGH-4XZNSLY-CQ2B6PM-2IUFLCM-EVSRYAZ";
        hilbert.id = "A2R6CIZ-7T7IJFC-VHFD32M-BMUINYF-P5NN2GL-ZESG5ZI-SNOT3Y2-5K7OSAC";
      };
      # }}}

      extraOptions.options.crashReportingEnabled = false;
    };
  };

  # Syncthing seems to leak memory, so we want to restart it daily.
  systemd.services.syncthing.serviceConfig.RuntimeMaxSec = "1d";

  # I'm not sure this is needed anymore, I just know I got some ownership errors at some point.
  systemd.tmpfiles.rules = [ "d ${dataDir} - ${user} ${group}" ];
}
