#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Colors
# Scheme author: mrmrs (http://clrs.cc)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-colors"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="colors"
fi

color00="11/11/11" # Base 00 - Black
color01="ff/41/36" # Base 08 - Red
color02="2e/cc/40" # Base 0B - Green
color03="ff/dc/00" # Base 0A - Yellow
color04="00/74/d9" # Base 0D - Blue
color05="b1/0d/c9" # Base 0E - Magenta
color06="7f/db/ff" # Base 0C - Cyan
color07="bb/bb/bb" # Base 05 - White
color08="77/77/77" # Base 03 - Bright Black
color09="ff/70/68" # Base 12 - Bright Red
color10="60/db/6e" # Base 14 - Bright Green
color11="ff/e5/40" # Base 13 - Bright Yellow
color12="23/99/ff" # Base 16 - Bright Blue
color13="d9/2e/f2" # Base 17 - Bright Magenta
color14="9f/e4/ff" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="ff/85/1b" # Base 09
color17="85/14/4b" # Base 0F
color18="33/33/33" # Base 01
color19="55/55/55" # Base 02
color20="99/99/99" # Base 04
color21="dd/dd/dd" # Base 06
color_foreground="bb/bb/bb" # Base 05
color_background="11/11/11" # Base 00


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
  put_template_custom Pg bbbbbb # foreground
  put_template_custom Ph 111111 # background
  put_template_custom Pi bbbbbb # bold color
  put_template_custom Pj 555555 # selection color
  put_template_custom Pk bbbbbb # selected text color
  put_template_custom Pl bbbbbb # cursor
  put_template_custom Pm 111111 # cursor text
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

export TINTED_COLOR_00_RGB="111111"
export TINTED_COLOR_01_RGB="333333"
export TINTED_COLOR_02_RGB="555555"
export TINTED_COLOR_03_RGB="777777"
export TINTED_COLOR_04_RGB="999999"
export TINTED_COLOR_05_RGB="bbbbbb"
export TINTED_COLOR_06_RGB="dddddd"
export TINTED_COLOR_07_RGB="ffffff"
export TINTED_COLOR_08_RGB="ff4136"
export TINTED_COLOR_09_RGB="ff851b"
export TINTED_COLOR_0A_RGB="ffdc00"
export TINTED_COLOR_0B_RGB="2ecc40"
export TINTED_COLOR_0C_RGB="7fdbff"
export TINTED_COLOR_0D_RGB="0074d9"
export TINTED_COLOR_0E_RGB="b10dc9"
export TINTED_COLOR_0F_RGB="85144b"
export TINTED_COLOR_10_RGB="111111"
export TINTED_COLOR_11_RGB="111111"
export TINTED_COLOR_12_RGB="ff7068"
export TINTED_COLOR_13_RGB="ffe540"
export TINTED_COLOR_14_RGB="60db6e"
export TINTED_COLOR_15_RGB="9fe4ff"
export TINTED_COLOR_16_RGB="2399ff"
export TINTED_COLOR_17_RGB="d92ef2"

export TINTED_COLOR_BRIGHT08_RGB="ff7068"
export TINTED_COLOR_BRIGHT09_RGB="ffa454"
export TINTED_COLOR_BRIGHT0A_RGB="ffe540"
export TINTED_COLOR_BRIGHT0B_RGB="60db6e"
export TINTED_COLOR_BRIGHT0C_RGB="9fe4ff"
export TINTED_COLOR_BRIGHT0D_RGB="2399ff"
export TINTED_COLOR_BRIGHT0E_RGB="d92ef2"
export TINTED_COLOR_BRIGHT0F_RGB="d32077"
