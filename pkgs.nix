{ pkgs }:

let
  eglotBooster = pkgs.emacsPackages.melpaBuild {
    pname = "eglot-booster";
    version = "20241029";
    commit = "e6daa6bcaf4aceee29c8a5a949b43eb1b89900ed";
    src = pkgs.fetchFromGitHub {
      owner = "jdtsmith";
      repo = "eglot-booster";
      rev = "e6daa6bcaf4aceee29c8a5a949b43eb1b89900ed";
      hash = "sha256-PLfaXELkdX5NZcSmR1s/kgmU16ODF8bn56nfTh9g6bs=";
    };
    recipe = pkgs.writeText "recipe" ''
      (eglot-booster
      :repo "jdtsmith/eglot-booster"
      :fetcher github
      :files ("*.el"))
    '';
  };

  vueTsMode = pkgs.emacsPackages.melpaBuild {
    pname = "vue-ts-mode";
    version = "20231029";
    commit = "5ec5bb317b80ce394e156c61b7b9c63996382a68";
    src = pkgs.fetchFromGitHub {
      owner = "8uff3r";
      repo = "vue-ts-mode";
      rev = "5ec5bb317b80ce394e156c61b7b9c63996382a68";
      hash = "sha256-1SOlRcq0KSO9n+isUSL5IhlujD4FWcU5I0zP6xuInuQ=";
    };
    recipe = pkgs.writeText "recipe" ''
      (vue-ts-mode
      :repo "8uff3r/vue-ts-mode"
      :fetcher github
      :files ("*.el"))
    '';
  };

in
{
  inherit eglotBooster vueTsMode;
}
