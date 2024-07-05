{ pkgs, ... }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    ghc
    hpack
    stack
    haskellPackages.fourmolu # Formatter
    cabal-install
    haskell-language-server
    haskellPackages.implicit-hie # Automatically generate hie.yaml!
  ];
}
