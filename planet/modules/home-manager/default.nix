{ inputs
, importApply
, self'
, inputs'
}:

_:
{
  imports = [
    ./android
    ./autorandr
    (importApply ./bspwm { inherit self'; })
    (importApply ./citra { inherit self'; })
    ./direnv
    ./discord
    ./editorconfig
    ./firefox
    (importApply ./fish { inherit self'; })
    ./flameshot
    ./git
    (importApply ./gitui { inherit self'; })
    ./gpg
    ./gpg-agent
    (importApply ./gtk { inherit self'; })
    (importApply ./hyprland { inherit inputs; })
    ./kdenlive
    (importApply ./kitty { inherit self'; })
    ./lutris
    (importApply ./mako { inherit self'; })
    ./mullvad-vpn
    (importApply ./neovim { inherit inputs'; })
    ./osu-lazer
    (importApply ./persistence { inherit inputs; })
    ./picom
    ./pointer-cursor
    (importApply ./polybar { inherit self'; })
    ./qt
    ./qutebrowser
    ./redshift
    (importApply ./rofi { inherit self'; })
    ./ssh
    ./tealdeer
    ./tetrio-desktop
    ./udiskie
    (importApply ./waybar { inherit self'; })
    ./wezterm
    (importApply ./wired { inherit inputs self' inputs'; })
    (importApply ./wlsunset { inherit self'; })
    ./yuzu
    (importApply ./zathura { inherit self'; })
  ];
}
