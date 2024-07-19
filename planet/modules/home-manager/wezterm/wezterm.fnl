;; TODO: use plugin-based color scheme

(local wezterm (require :wezterm))

{:default_prog [@default_prog_args@]
 :launch_menu [{:label "Bash" :args ["bash" "-l"]}]
 :color_scheme "Catppuccin Macchiato"
 :font (wezterm.font_with_fallback ["Iosevka Term Custom"
                                    "Material Design Icons"
                                    {:family "Symbols Nerd Font Mono" :scale 0.75}])
 :font_size 16
 :use_fancy_tab_bar false
 :hide_tab_bar_if_only_one_tab true
 :window_padding {:left "3cell" :right "3cell" :top "1cell" :bottom "1cell"}}
