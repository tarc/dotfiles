{ pkgs, ... }: {
  programs.fish =
    let
      shellInit = ''
        fish_vi_key_bindings
        fish_config theme choose "Catppuccin Macchiato"
      '';
    in
    {
      enable = true;
      loginShellInit = shellInit;
      interactiveShellInit = shellInit;
    };

  xdg.configFile."fish/themes" = {
    source = "${pkgs.pers-pkgs.catppuccin-fish}/share/fish/themes";
    recursive = true;
  };
}
