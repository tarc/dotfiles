{ pkgs, ... }:

{
  packages = with pkgs; [ sops npins nixpkgs-fmt stylua statix deadnix ];
  pre-commit = {
    hooks = {
      nixpkgs-fmt = {
        enable = true;
        excludes = [ "^planet/pkgs/npins/" "^planet/pkgs/vim-plugins/npins/" ];
      };
      statix = {
        enable = true;
        settings = {
          ignore = [ "planet/pkgs/npins/" "planet/pkgs/vim-plugins/npins/" ];
        };
      };
      stylua.enable = true;
      deadnix.enable = true;
    };
  };
}
