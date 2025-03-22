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
          config = {
            allowUnfree = true;
          };
        };

        # Function to concatenate files in a directory
        concatFiles = path:
          (builtins.concatStringsSep "\n"
            (map (p: builtins.readFile p)
              (builtins.filter (p: builtins.match ".*/.*" p != null)
                (builtins.attrNames (builtins.readDir path)))));

        # Path dependencies
        path = with pkgs; [
          outils
          astyle
          emacs-lsp-booster
          fd
          ffmpegthumbnailer
          imagemagick
          mediainfo
          nil
          nixpkgs-fmt
          poppler
          emacs-lsp-booster
          global
          universal-ctags
          metals
        ];

        # Emacs packages
        epkgs = import ./epkgs.nix;

        # Emacs configuration
        emacsConfig = pkgs.writeText "emacs-config.el" (
          concatFiles ./config
        );

        # Unwrapped Emacs
        emacsUnwrapped = pkgs.emacsWithPackagesFromUsePackage {
          defaultInitFile = true;
          extraEmacsPackages = epkgs;
          alwaysEnsure = false;
          config = emacsConfig;
          package = pkgs.emacs-pgtk;
        };

        # Wrapped Emacs
        emacsWrapped = pkgs.symlinkJoin {
          name = "emacs";
          buildInputs = [ pkgs.makeWrapper ];
          paths = [ emacsUnwrapped ];
          postBuild = ''
            for file in $out/bin/*; do
              wrapProgram $file \
                --prefix PATH : ${pkgs.lib.makeBinPath path};
            done
          '';
        };
      in
      {
        packages = {
          default = emacsWrapped;
          emacs = emacsWrapped;
        };

        devShell = pkgs.mkShell {
          buildInputs = [
            emacsWrapped
          ];
        };
      }
    );
}
