#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Summerfruit Light
# Scheme author: Christopher Corley (http://christop.club/)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-summerfruit-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="summerfruit-light"
fi

color00="ff/ff/ff" # Base 00 - Black
color01="ff/00/86" # Base 08 - Red
color02="00/c9/18" # Base 0B - Green
color03="ab/a8/00" # Base 0A - Yellow
color04="37/77/e6" # Base 0D - Blue
color05="ad/00/a1" # Base 0E - Magenta
color06="1f/aa/aa" # Base 0C - Cyan
color07="10/10/10" # Base 05 - White
color08="b0/b0/b0" # Base 03 - Bright Black
color09="bf/00/64" # Base 12 - Bright Red
color10="00/97/12" # Base 14 - Bright Green
color11="80/7e/00" # Base 13 - Bright Yellow
color12="12/53/c4" # Base 16 - Bright Blue
color13="82/00/79" # Base 17 - Bright Magenta
color14="11/85/85" # Base 15 - Bright Cyan
color15="20/20/20" # Base 07 - Bright White
color16="fd/89/00" # Base 09
color17="cc/66/33" # Base 0F
color18="e0/e0/e0" # Base 01
color19="d0/d0/d0" # Base 02
color20="00/00/00" # Base 04
color21="15/15/15" # Base 06
color_foreground="10/10/10" # Base 05
color_background="ff/ff/ff" # Base 00


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
  put_template_custom Pg 101010 # foreground
  put_template_custom Ph ffffff # background
  put_template_custom Pi 101010 # bold color
  put_template_custom Pj d0d0d0 # selection color
  put_template_custom Pk 101010 # selected text color
  put_template_custom Pl 101010 # cursor
  put_template_custom Pm ffffff # cursor text
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

export TINTED_COLOR_00_RGB="ffffff"
export TINTED_COLOR_01_RGB="e0e0e0"
export TINTED_COLOR_02_RGB="d0d0d0"
export TINTED_COLOR_03_RGB="b0b0b0"
export TINTED_COLOR_04_RGB="000000"
export TINTED_COLOR_05_RGB="101010"
export TINTED_COLOR_06_RGB="151515"
export TINTED_COLOR_07_RGB="202020"
export TINTED_COLOR_08_RGB="ff0086"
export TINTED_COLOR_09_RGB="fd8900"
export TINTED_COLOR_0A_RGB="aba800"
export TINTED_COLOR_0B_RGB="00c918"
export TINTED_COLOR_0C_RGB="1faaaa"
export TINTED_COLOR_0D_RGB="3777e6"
export TINTED_COLOR_0E_RGB="ad00a1"
export TINTED_COLOR_0F_RGB="cc6633"
export TINTED_COLOR_10_RGB="ffffff"
export TINTED_COLOR_11_RGB="ffffff"
export TINTED_COLOR_12_RGB="bf0064"
export TINTED_COLOR_13_RGB="807e00"
export TINTED_COLOR_14_RGB="009712"
export TINTED_COLOR_15_RGB="118585"
export TINTED_COLOR_16_RGB="1253c4"
export TINTED_COLOR_17_RGB="820079"

export TINTED_COLOR_BRIGHT08_RGB="bf0064"
export TINTED_COLOR_BRIGHT09_RGB="be6700"
export TINTED_COLOR_BRIGHT0A_RGB="807e00"
export TINTED_COLOR_BRIGHT0B_RGB="009712"
export TINTED_COLOR_BRIGHT0C_RGB="118585"
export TINTED_COLOR_BRIGHT0D_RGB="1253c4"
export TINTED_COLOR_BRIGHT0E_RGB="820079"
export TINTED_COLOR_BRIGHT0F_RGB="a3491d"
