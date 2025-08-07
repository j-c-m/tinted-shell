#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: One Black
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-one-black"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="one-black"
fi

color00="00/00/00" # Base 00 - Black
color01="e0/55/61" # Base 08 - Red
color02="8c/c2/65" # Base 0B - Green
color03="e6/b9/65" # Base 0A - Yellow
color04="4a/a5/f0" # Base 0D - Blue
color05="c1/62/de" # Base 0E - Magenta
color06="42/b3/c2" # Base 0C - Cyan
color07="ab/b2/bf" # Base 05 - White
color08="54/58/62" # Base 03 - Bright Black
color09="ff/61/6e" # Base 12 - Bright Red
color10="a5/e0/75" # Base 14 - Bright Green
color11="f0/a4/5d" # Base 13 - Bright Yellow
color12="4d/c4/ff" # Base 16 - Bright Blue
color13="de/73/ff" # Base 17 - Bright Magenta
color14="4c/d1/e0" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="d1/8f/52" # Base 09
color17="bf/40/34" # Base 0F
color18="00/00/00" # Base 01
color19="4f/56/66" # Base 02
color20="91/96/a1" # Base 04
color21="e6/e6/e6" # Base 06
color_foreground="ab/b2/bf" # Base 05
color_background="00/00/00" # Base 00


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
  put_template_custom Pg abb2bf # foreground
  put_template_custom Ph 000000 # background
  put_template_custom Pi abb2bf # bold color
  put_template_custom Pj 4f5666 # selection color
  put_template_custom Pk abb2bf # selected text color
  put_template_custom Pl abb2bf # cursor
  put_template_custom Pm 000000 # cursor text
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

export TINTED_COLOR_00_RGB="000000"
export TINTED_COLOR_01_RGB="000000"
export TINTED_COLOR_02_RGB="4f5666"
export TINTED_COLOR_03_RGB="545862"
export TINTED_COLOR_04_RGB="9196a1"
export TINTED_COLOR_05_RGB="abb2bf"
export TINTED_COLOR_06_RGB="e6e6e6"
export TINTED_COLOR_07_RGB="ffffff"
export TINTED_COLOR_08_RGB="e05561"
export TINTED_COLOR_09_RGB="d18f52"
export TINTED_COLOR_0A_RGB="e6b965"
export TINTED_COLOR_0B_RGB="8cc265"
export TINTED_COLOR_0C_RGB="42b3c2"
export TINTED_COLOR_0D_RGB="4aa5f0"
export TINTED_COLOR_0E_RGB="c162de"
export TINTED_COLOR_0F_RGB="bf4034"
export TINTED_COLOR_10_RGB="000000"
export TINTED_COLOR_11_RGB="000000"
export TINTED_COLOR_12_RGB="ff616e"
export TINTED_COLOR_13_RGB="f0a45d"
export TINTED_COLOR_14_RGB="a5e075"
export TINTED_COLOR_15_RGB="4cd1e0"
export TINTED_COLOR_16_RGB="4dc4ff"
export TINTED_COLOR_17_RGB="de73ff"

export TINTED_COLOR_BRIGHT08_RGB="ff616e"
export TINTED_COLOR_BRIGHT09_RGB="ddab7d"
export TINTED_COLOR_BRIGHT0A_RGB="f0a45d"
export TINTED_COLOR_BRIGHT0B_RGB="a5e075"
export TINTED_COLOR_BRIGHT0C_RGB="4cd1e0"
export TINTED_COLOR_BRIGHT0D_RGB="4dc4ff"
export TINTED_COLOR_BRIGHT0E_RGB="de73ff"
export TINTED_COLOR_BRIGHT0F_RGB="d46b62"
