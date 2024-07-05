{ lib, ... }: {
  # enable the tailscale service
  services.tailscale = {
    enable = true;
    useRoutingFeatures = lib.mkDefault "client";
  };

}


