{ pkgs ? (import ../nixpkgs.nix) { } }:
let plymouthThemes = pkgs.callPackage (import ./plymouth-themes.nix) { }; in
{
  # example = pkgs.callPackage (import ./example.nix) {};
  # vimclip = pkgs.callPackage (import ./vimclip.nix) { };
  # homer = pkgs.callPackage (import ./homer.nix) { };

  plymouthThemeCutsAlt = plymouthThemes.cuts_alt;
}

