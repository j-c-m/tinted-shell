#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Challenger Deep
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-challenger-deep"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="challenger-deep"
fi

color00="1e/1c/31" # Base 00 - Black
color01="ff/54/58" # Base 08 - Red
color02="62/d1/96" # Base 0B - Green
color03="91/dd/ff" # Base 0A - Yellow
color04="65/b2/ff" # Base 0D - Blue
color05="90/6c/ff" # Base 0E - Magenta
color06="63/f2/f1" # Base 0C - Cyan
color07="92/9b/b6" # Base 05 - White
color08="6a/6c/8a" # Base 03 - Bright Black
color09="ff/80/80" # Base 12 - Bright Red
color10="95/ff/a4" # Base 14 - Bright Green
color11="ff/e9/aa" # Base 13 - Bright Yellow
color12="91/dd/ff" # Base 16 - Bright Blue
color13="c9/91/e1" # Base 17 - Bright Magenta
color14="aa/ff/e4" # Base 15 - Bright Cyan
color15="cb/e3/e7" # Base 07 - Bright White
color16="ff/b3/78" # Base 09
color17="7f/2a/2c" # Base 0F
color18="14/11/27" # Base 01
color19="56/55/75" # Base 02
color20="7e/84/a0" # Base 04
color21="a6/b3/cc" # Base 06
color_foreground="92/9b/b6" # Base 05
color_background="1e/1c/31" # Base 00


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
  put_template_custom Pg 929bb6 # foreground
  put_template_custom Ph 1e1c31 # background
  put_template_custom Pi 929bb6 # bold color
  put_template_custom Pj 565575 # selection color
  put_template_custom Pk 929bb6 # selected text color
  put_template_custom Pl 929bb6 # cursor
  put_template_custom Pm 1e1c31 # cursor text
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

export TINTED_COLOR_00_RGB="1e1c31"
export TINTED_COLOR_01_RGB="141127"
export TINTED_COLOR_02_RGB="565575"
export TINTED_COLOR_03_RGB="6a6c8a"
export TINTED_COLOR_04_RGB="7e84a0"
export TINTED_COLOR_05_RGB="929bb6"
export TINTED_COLOR_06_RGB="a6b3cc"
export TINTED_COLOR_07_RGB="cbe3e7"
export TINTED_COLOR_08_RGB="ff5458"
export TINTED_COLOR_09_RGB="ffb378"
export TINTED_COLOR_0A_RGB="91ddff"
export TINTED_COLOR_0B_RGB="62d196"
export TINTED_COLOR_0C_RGB="63f2f1"
export TINTED_COLOR_0D_RGB="65b2ff"
export TINTED_COLOR_0E_RGB="906cff"
export TINTED_COLOR_0F_RGB="7f2a2c"
export TINTED_COLOR_10_RGB="39384e"
export TINTED_COLOR_11_RGB="1c1c27"
export TINTED_COLOR_12_RGB="ff8080"
export TINTED_COLOR_13_RGB="ffe9aa"
export TINTED_COLOR_14_RGB="95ffa4"
export TINTED_COLOR_15_RGB="aaffe4"
export TINTED_COLOR_16_RGB="91ddff"
export TINTED_COLOR_17_RGB="c991e1"

export TINTED_COLOR_BRIGHT08_RGB="ff8080"
export TINTED_COLOR_BRIGHT09_RGB="ffc69a"
export TINTED_COLOR_BRIGHT0A_RGB="ffe9aa"
export TINTED_COLOR_BRIGHT0B_RGB="95ffa4"
export TINTED_COLOR_BRIGHT0C_RGB="aaffe4"
export TINTED_COLOR_BRIGHT0D_RGB="91ddff"
export TINTED_COLOR_BRIGHT0E_RGB="c991e1"
export TINTED_COLOR_BRIGHT0F_RGB="bf3f42"
