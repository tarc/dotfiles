{
  description = "My NixOS configuration";

  nixConfig = {
    substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
      "https://tarc.cachix.org"
    ];

    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "tarc.cachix.org-1:wIYVNrWvfOFESyas4plhMmGv91TjiTBVWB0oqf1fHcE="
    ];
  };

  inputs = {
    flake-parts = {
      url = "https://flakehub.com/f/hercules-ci/flake-parts/*.tar.gz";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    flake-utils.url = "https://flakehub.com/f/numtide/flake-utils/*.tar.gz";
    devenv.url = "github:cachix/devenv";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*";
    darwin = {
      url = "github:LnL7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "https://flakehub.com/f/nix-community/home-manager/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "https://flakehub.com/f/Mic92/sops-nix/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ ./devshell/flake-module.nix ];

      systems = [
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem =
        { inputs', ... }:
        {
          packages.nixpkgs-review = inputs'.nixpkgs.legacyPackages.nixpkgs-review;
          packages.ghostscript = inputs'.nixpkgs.legacyPackages.ghostscript;
        };
    };
}
