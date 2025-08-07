#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Fruit Soda
# Scheme author: jozip
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-fruit-soda"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="fruit-soda"
fi

color00="f1/ec/f1" # Base 00 - Black
color01="fe/3e/31" # Base 08 - Red
color02="47/f7/4c" # Base 0B - Green
color03="f7/e2/03" # Base 0A - Yellow
color04="29/31/df" # Base 0D - Blue
color05="61/1f/ce" # Base 0E - Magenta
color06="0f/9c/fd" # Base 0C - Cyan
color07="51/51/51" # Base 05 - White
color08="b5/b4/b6" # Base 03 - Bright Black
color09="e2/0f/01" # Base 12 - Bright Red
color10="07/e7/0e" # Base 14 - Bright Green
color11="ba/aa/02" # Base 13 - Bright Yellow
color12="13/1a/b3" # Base 16 - Bright Blue
color13="47/11/a0" # Base 17 - Bright Magenta
color14="01/77/c8" # Base 15 - Bright Cyan
color15="2d/2c/2c" # Base 07 - Bright White
color16="fe/6d/08" # Base 09
color17="b1/6f/40" # Base 0F
color18="e0/de/e0" # Base 01
color19="d8/d5/d5" # Base 02
color20="97/95/98" # Base 04
color21="47/45/45" # Base 06
color_foreground="51/51/51" # Base 05
color_background="f1/ec/f1" # Base 00


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
  put_template_custom Pg 515151 # foreground
  put_template_custom Ph f1ecf1 # background
  put_template_custom Pi 515151 # bold color
  put_template_custom Pj d8d5d5 # selection color
  put_template_custom Pk 515151 # selected text color
  put_template_custom Pl 515151 # cursor
  put_template_custom Pm f1ecf1 # cursor text
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

export TINTED_COLOR_00_RGB="f1ecf1"
export TINTED_COLOR_01_RGB="e0dee0"
export TINTED_COLOR_02_RGB="d8d5d5"
export TINTED_COLOR_03_RGB="b5b4b6"
export TINTED_COLOR_04_RGB="979598"
export TINTED_COLOR_05_RGB="515151"
export TINTED_COLOR_06_RGB="474545"
export TINTED_COLOR_07_RGB="2d2c2c"
export TINTED_COLOR_08_RGB="fe3e31"
export TINTED_COLOR_09_RGB="fe6d08"
export TINTED_COLOR_0A_RGB="f7e203"
export TINTED_COLOR_0B_RGB="47f74c"
export TINTED_COLOR_0C_RGB="0f9cfd"
export TINTED_COLOR_0D_RGB="2931df"
export TINTED_COLOR_0E_RGB="611fce"
export TINTED_COLOR_0F_RGB="b16f40"
export TINTED_COLOR_10_RGB="f1ecf1"
export TINTED_COLOR_11_RGB="f1ecf1"
export TINTED_COLOR_12_RGB="e20f01"
export TINTED_COLOR_13_RGB="baaa02"
export TINTED_COLOR_14_RGB="07e70e"
export TINTED_COLOR_15_RGB="0177c8"
export TINTED_COLOR_16_RGB="131ab3"
export TINTED_COLOR_17_RGB="4711a0"

export TINTED_COLOR_BRIGHT08_RGB="e20f01"
export TINTED_COLOR_BRIGHT09_RGB="c45101"
export TINTED_COLOR_BRIGHT0A_RGB="baaa02"
export TINTED_COLOR_BRIGHT0B_RGB="07e70e"
export TINTED_COLOR_BRIGHT0C_RGB="0177c8"
export TINTED_COLOR_BRIGHT0D_RGB="131ab3"
export TINTED_COLOR_BRIGHT0E_RGB="4711a0"
export TINTED_COLOR_BRIGHT0F_RGB="915124"
