{
  description = "Merrinx Emacs Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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

        customPkgs = import ./pkgs.nix { inherit pkgs; };

        # Function to recursively list all files in a directory
        listFilesRecursive = path: let
          entries = builtins.attrNames (builtins.readDir path);
          files = builtins.filter (entry: builtins.match ".*/.*" entry != null) entries;
          subdirs = builtins.filter (entry: builtins.match ".*/" entry != null) entries;
          subfiles = builtins.concatMap (subdir: listFilesRecursive "${path}/${subdir}") subdirs;
        in builtins.concatLists [ (map (file: "${path}/${file}") files) subfiles ];

        # Function to concatenate files in a directory and its subdirectories
        concatFiles = path:
          (builtins.concatStringsSep "\n"
            (map (p: builtins.readFile p)
              (listFilesRecursive path)));

        # Dictionary path
        dictionary = pkgs.writeTextDir "share/dict/words" (concatFiles ./assets/dict);

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
        epkgs = import ./epkgs.nix { inherit customPkgs; };

        # Emacs configuration
        emacsConfig = pkgs.writeText "emacs-config.el" (
          "(setq ispell-alternate-dictionary \"${dictionary}/share/dict/words\")\n" +
          ";;; -*- lexical-binding: t; -*-\n" + concatFiles ./config
        );

        # Unwrapped Emacs
        emacsUnwrapped = pkgs.emacsWithPackagesFromUsePackage {
          defaultInitFile = true;
          extraEmacsPackages = epkgs;
          alwaysEnsure = false;
          config = emacsConfig;
          package = pkgs.emacs;
        };

        # Wrapped Emacs
        emacsWrapped = pkgs.symlinkJoin {
          name = "emacs";
          buildInputs = [ pkgs.makeWrapper ];
          paths = [ emacsUnwrapped ];
          postBuild = ''
            for file in $out/bin/*; do
              wrapProgram $file \
                --prefix PATH : ${pkgs.lib.makeBinPath path} \
                --set-default ASPELL_CONF "dict-dir ${pkgs.aspellWithDicts (dicts: with dicts; [ pkgs.aspellDicts.en pkgs.aspellDicts.fr pkgs.aspellDicts.en-computers ])}/lib/aspell";
            done
          '';
        };

        # Development Shell
        devShell = pkgs.mkShell {
          buildInputs = [
            emacsWrapped
          ];
          shellHook = ''
            export PATH=${pkgs.lib.makeBinPath path}:$PATH
          '';
        };
      in
      {
        packages = {
          default = emacsWrapped;
          emacs = emacsWrapped;
        };

        devShell = devShell;
        defaultPackage = emacsWrapped;
      }
    );
}
