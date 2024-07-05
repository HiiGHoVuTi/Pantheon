{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    unison-ucm
  ];
}
