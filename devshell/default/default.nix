{ pkgs, ... }:

{
  packages = with pkgs; [
    deadnix
    nixfmt-rfc-style
  ];
  pre-commit = {
    hooks = {
      nixfmt-rfc-style = {
        enable = true;
        excludes = [ ];
      };
      deadnix.enable = true;
    };
  };
}
