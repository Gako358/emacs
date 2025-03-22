{
  description = "Merrinx Emacs Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = { self, nixpkgs, flake-utils, emacs-overlay }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ emacs-overlay.overlay ];
        };
      in
      {
        packages = {
          default = pkgs.emacsPackages.emacs;
          emacs = pkgs.emacsPackages.emacs;
        };

        devShell = pkgs.mkShell {
          buildInputs = [
          ];
        };
      }
    );
}
