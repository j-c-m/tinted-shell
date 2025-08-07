#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Atelier Lakeside Light
# Scheme author: Bram de Haan (http://atelierbramdehaan.nl)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-atelier-lakeside-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="atelier-lakeside-light"
fi

color00="eb/f8/ff" # Base 00 - Black
color01="d2/2d/72" # Base 08 - Red
color02="56/8c/3b" # Base 0B - Green
color03="8a/8a/0f" # Base 0A - Yellow
color04="25/7f/ad" # Base 0D - Blue
color05="6b/6b/b8" # Base 0E - Magenta
color06="2d/8f/6f" # Base 0C - Cyan
color07="51/6d/7b" # Base 05 - White
color08="71/95/a8" # Base 03 - Bright Black
color09="a6/19/54" # Base 12 - Bright Red
color10="3d/74/21" # Base 14 - Bright Green
color11="6a/6a/08" # Base 13 - Bright Yellow
color12="15/61/89" # Base 16 - Bright Blue
color13="35/35/a5" # Base 17 - Bright Magenta
color14="19/74/56" # Base 15 - Bright Cyan
color15="16/1b/1d" # Base 07 - Bright White
color16="93/5c/25" # Base 09
color17="b7/2d/d2" # Base 0F
color18="c1/e4/f6" # Base 01
color19="7e/a2/b4" # Base 02
color20="5a/7b/8c" # Base 04
color21="1f/29/2e" # Base 06
color_foreground="51/6d/7b" # Base 05
color_background="eb/f8/ff" # Base 00


if [ -z "$TTY" ] && ! TTY=$(tty); then
  put_template() { true; }
  put_template_var() { true; }
  put_template_custom() { true; }
elif [ -n "$TMUX" ] || [ "${TERM%%[-.]*}" = "tmux" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' "$@" > "$TTY"; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' "$@" > "$TTY"; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ "$1" -lt 16 ] && printf "\e]P%x%s" "$1" "$(echo "$2" | sed 's/\///g')" > "$TTY"; }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' "$@" > "$TTY"; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' "$@" > "$TTY"; }
  put_template_custom() { printf '\033]%s%s\033\\' "$@" > "$TTY"; }
fi

# 16 color space
put_template 0  "$color00"
put_template 1  "$color01"
put_template 2  "$color02"
put_template 3  "$color03"
put_template 4  "$color04"
put_template 5  "$color05"
put_template 6  "$color06"
put_template 7  "$color07"
put_template 8  "$color08"
put_template 9  "$color09"
put_template 10 "$color10"
put_template 11 "$color11"
put_template 12 "$color12"
put_template 13 "$color13"
put_template 14 "$color14"
put_template 15 "$color15"

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg 516d7b # foreground
  put_template_custom Ph ebf8ff # background
  put_template_custom Pi 516d7b # bold color
  put_template_custom Pj 7ea2b4 # selection color
  put_template_custom Pk 516d7b # selected text color
  put_template_custom Pl 516d7b # cursor
  put_template_custom Pm ebf8ff # cursor text
else
  put_template_var 10 "$color_foreground"
  if [ "$TINTED_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 "$color_background"
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 "$color_background" # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset put_template
unset put_template_var
unset put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background

export TINTED_COLOR_00_RGB="ebf8ff"
export TINTED_COLOR_01_RGB="c1e4f6"
export TINTED_COLOR_02_RGB="7ea2b4"
export TINTED_COLOR_03_RGB="7195a8"
export TINTED_COLOR_04_RGB="5a7b8c"
export TINTED_COLOR_05_RGB="516d7b"
export TINTED_COLOR_06_RGB="1f292e"
export TINTED_COLOR_07_RGB="161b1d"
export TINTED_COLOR_08_RGB="d22d72"
export TINTED_COLOR_09_RGB="935c25"
export TINTED_COLOR_0A_RGB="8a8a0f"
export TINTED_COLOR_0B_RGB="568c3b"
export TINTED_COLOR_0C_RGB="2d8f6f"
export TINTED_COLOR_0D_RGB="257fad"
export TINTED_COLOR_0E_RGB="6b6bb8"
export TINTED_COLOR_0F_RGB="b72dd2"
export TINTED_COLOR_10_RGB="ebf8ff"
export TINTED_COLOR_11_RGB="ebf8ff"
export TINTED_COLOR_12_RGB="a61954"
export TINTED_COLOR_13_RGB="6a6a08"
export TINTED_COLOR_14_RGB="3d7421"
export TINTED_COLOR_15_RGB="197456"
export TINTED_COLOR_16_RGB="156189"
export TINTED_COLOR_17_RGB="3535a5"

export TINTED_COLOR_BRIGHT08_RGB="a61954"
export TINTED_COLOR_BRIGHT09_RGB="754515"
export TINTED_COLOR_BRIGHT0A_RGB="6a6a08"
export TINTED_COLOR_BRIGHT0B_RGB="3d7421"
export TINTED_COLOR_BRIGHT0C_RGB="197456"
export TINTED_COLOR_BRIGHT0D_RGB="156189"
export TINTED_COLOR_BRIGHT0E_RGB="3535a5"
export TINTED_COLOR_BRIGHT0F_RGB="8f19a6"
