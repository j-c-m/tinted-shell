#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Pro Light
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-pro-light"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="pro-light"
fi

color00="fe/ff/ff" # Base 00 - Black
color01="e4/49/2b" # Base 08 - Red
color02="50/d0/48" # Base 0B - Green
color03="00/81/ff" # Base 0A - Yellow
color04="3a/75/ff" # Base 0D - Blue
color05="ec/65/e7" # Base 0E - Magenta
color06="4e/d1/dd" # Base 0C - Cyan
color07="cc/cc/cc" # Base 05 - White
color08="ae/ae/ae" # Base 03 - Bright Black
color09="ff/66/40" # Base 12 - Bright Red
color10="61/ee/56" # Base 14 - Bright Green
color11="f2/f0/55" # Base 13 - Bright Yellow
color12="00/81/ff" # Base 16 - Bright Blue
color13="ff/7d/fe" # Base 17 - Bright Magenta
color14="60/f6/f8" # Base 15 - Bright Cyan
color15="f1/f1/f1" # Base 07 - Bright White
color16="c5/c3/40" # Base 09
color17="72/24/15" # Base 0F
color18="00/00/00" # Base 01
color19="9f/9f/9f" # Base 02
color20="bd/bd/bd" # Base 04
color21="dc/dc/dc" # Base 06
color_foreground="cc/cc/cc" # Base 05
color_background="fe/ff/ff" # Base 00


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
  put_template_custom Pg cccccc # foreground
  put_template_custom Ph feffff # background
  put_template_custom Pi cccccc # bold color
  put_template_custom Pj 9f9f9f # selection color
  put_template_custom Pk cccccc # selected text color
  put_template_custom Pl cccccc # cursor
  put_template_custom Pm feffff # cursor text
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

export TINTED_COLOR_00_RGB="feffff"
export TINTED_COLOR_01_RGB="000000"
export TINTED_COLOR_02_RGB="9f9f9f"
export TINTED_COLOR_03_RGB="aeaeae"
export TINTED_COLOR_04_RGB="bdbdbd"
export TINTED_COLOR_05_RGB="cccccc"
export TINTED_COLOR_06_RGB="dcdcdc"
export TINTED_COLOR_07_RGB="f1f1f1"
export TINTED_COLOR_08_RGB="e4492b"
export TINTED_COLOR_09_RGB="c5c340"
export TINTED_COLOR_0A_RGB="0081ff"
export TINTED_COLOR_0B_RGB="50d048"
export TINTED_COLOR_0C_RGB="4ed1dd"
export TINTED_COLOR_0D_RGB="3a75ff"
export TINTED_COLOR_0E_RGB="ec65e7"
export TINTED_COLOR_0F_RGB="722415"
export TINTED_COLOR_10_RGB="6a6a6a"
export TINTED_COLOR_11_RGB="353535"
export TINTED_COLOR_12_RGB="ff6640"
export TINTED_COLOR_13_RGB="f2f055"
export TINTED_COLOR_14_RGB="61ee56"
export TINTED_COLOR_15_RGB="60f6f8"
export TINTED_COLOR_16_RGB="0081ff"
export TINTED_COLOR_17_RGB="ff7dfe"

export TINTED_COLOR_BRIGHT08_RGB="ff6640"
export TINTED_COLOR_BRIGHT09_RGB="a2a022"
export TINTED_COLOR_BRIGHT0A_RGB="f2f055"
export TINTED_COLOR_BRIGHT0B_RGB="61ee56"
export TINTED_COLOR_BRIGHT0C_RGB="60f6f8"
export TINTED_COLOR_BRIGHT0D_RGB="0081ff"
export TINTED_COLOR_BRIGHT0E_RGB="ff7dfe"
export TINTED_COLOR_BRIGHT0F_RGB="59180c"
