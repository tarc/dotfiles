{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming = {
      url = "github:fufexan/nix-gaming";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin-grub = {
      url = "github:catppuccin/grub";
      flake = false;
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      # Temporary workaround for https://github.com/nix-community/neovim-nightly-overlay/issues/164
      inputs.nixpkgs.url = "github:nixos/nixpkgs?rev=fad51abd42ca17a60fc1d4cb9382e2d79ae31836";
    };
    pers-pkgs.url = "github:PlayerNameHere/nix-pers-pkgs";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    pers-pkgs,
    ...
  }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
    nixosConfigurations = {
      shiba-asus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          {
            nixpkgs.overlays = [
              inputs.rust-overlay.overlays.default
              inputs.neovim-nightly-overlay.overlay
              pers-pkgs.overlay
            ];
            nix.registry.nixpkgs.flake = nixpkgs;
          }
          ./hosts/shiba-asus
        ];
        specialArgs = {inherit inputs;};
      };
    };
  };
}
