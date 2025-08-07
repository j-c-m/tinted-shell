#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Solarized Light
# Scheme author: Ethan Schoonover (modified by aramisgithub)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-solarized-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="solarized-light"
fi

color00="fd/f6/e3" # Base 00 - Black
color01="dc/32/2f" # Base 08 - Red
color02="85/99/00" # Base 0B - Green
color03="b5/89/00" # Base 0A - Yellow
color04="26/8b/d2" # Base 0D - Blue
color05="6c/71/c4" # Base 0E - Magenta
color06="2a/a1/98" # Base 0C - Cyan
color07="58/6e/75" # Base 05 - White
color08="83/94/96" # Base 03 - Bright Black
color09="b3/18/16" # Base 12 - Bright Red
color10="64/73/00" # Base 14 - Bright Green
color11="88/67/00" # Base 13 - Bright Yellow
color12="15/69/a5" # Base 16 - Bright Blue
color13="31/38/b3" # Base 17 - Bright Magenta
color14="18/81/79" # Base 15 - Bright Cyan
color15="00/2b/36" # Base 07 - Bright White
color16="cb/4b/16" # Base 09
color17="d3/36/82" # Base 0F
color18="ee/e8/d5" # Base 01
color19="93/a1/a1" # Base 02
color20="65/7b/83" # Base 04
color21="07/36/42" # Base 06
color_foreground="58/6e/75" # Base 05
color_background="fd/f6/e3" # Base 00


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
  put_template_custom Pg 586e75 # foreground
  put_template_custom Ph fdf6e3 # background
  put_template_custom Pi 586e75 # bold color
  put_template_custom Pj 93a1a1 # selection color
  put_template_custom Pk 586e75 # selected text color
  put_template_custom Pl 586e75 # cursor
  put_template_custom Pm fdf6e3 # cursor text
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

export TINTED_COLOR_00_RGB="fdf6e3"
export TINTED_COLOR_01_RGB="eee8d5"
export TINTED_COLOR_02_RGB="93a1a1"
export TINTED_COLOR_03_RGB="839496"
export TINTED_COLOR_04_RGB="657b83"
export TINTED_COLOR_05_RGB="586e75"
export TINTED_COLOR_06_RGB="073642"
export TINTED_COLOR_07_RGB="002b36"
export TINTED_COLOR_08_RGB="dc322f"
export TINTED_COLOR_09_RGB="cb4b16"
export TINTED_COLOR_0A_RGB="b58900"
export TINTED_COLOR_0B_RGB="859900"
export TINTED_COLOR_0C_RGB="2aa198"
export TINTED_COLOR_0D_RGB="268bd2"
export TINTED_COLOR_0E_RGB="6c71c4"
export TINTED_COLOR_0F_RGB="d33682"
export TINTED_COLOR_10_RGB="fdf6e3"
export TINTED_COLOR_11_RGB="fdf6e3"
export TINTED_COLOR_12_RGB="b31816"
export TINTED_COLOR_13_RGB="886700"
export TINTED_COLOR_14_RGB="647300"
export TINTED_COLOR_15_RGB="188179"
export TINTED_COLOR_16_RGB="1569a5"
export TINTED_COLOR_17_RGB="3138b3"

export TINTED_COLOR_BRIGHT08_RGB="b31816"
export TINTED_COLOR_BRIGHT09_RGB="9c370c"
export TINTED_COLOR_BRIGHT0A_RGB="886700"
export TINTED_COLOR_BRIGHT0B_RGB="647300"
export TINTED_COLOR_BRIGHT0C_RGB="188179"
export TINTED_COLOR_BRIGHT0D_RGB="1569a5"
export TINTED_COLOR_BRIGHT0E_RGB="3138b3"
export TINTED_COLOR_BRIGHT0F_RGB="ac1b61"
