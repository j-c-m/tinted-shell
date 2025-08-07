#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Vesper
# Scheme author: FormalSnake (https://github.com/formalsnake)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-vesper"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="vesper"
fi

color00="10/10/10" # Base 00 - Black
color01="de/6e/6e" # Base 08 - Red
color02="5f/87/87" # Base 0B - Green
color03="ff/c7/99" # Base 0A - Yellow
color04="8e/aa/aa" # Base 0D - Blue
color05="d6/90/94" # Base 0E - Magenta
color06="60/a5/92" # Base 0C - Cyan
color07="b7/b7/b7" # Base 05 - White
color08="33/33/33" # Base 03 - Bright Black
color09="e6/92/92" # Base 12 - Bright Red
color10="84/a8/a8" # Base 14 - Bright Green
color11="ff/d5/b3" # Base 13 - Bright Yellow
color12="aa/bf/bf" # Base 16 - Bright Blue
color13="e0/ac/af" # Base 17 - Bright Magenta
color14="88/bc/ad" # Base 15 - Bright Cyan
color15="d5/d5/d5" # Base 07 - Bright White
color16="da/b0/83" # Base 09
color17="87/6c/4f" # Base 0F
color18="23/23/23" # Base 01
color19="22/22/22" # Base 02
color20="99/99/99" # Base 04
color21="c1/c1/c1" # Base 06
color_foreground="b7/b7/b7" # Base 05
color_background="10/10/10" # Base 00


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
  put_template_custom Pg b7b7b7 # foreground
  put_template_custom Ph 101010 # background
  put_template_custom Pi b7b7b7 # bold color
  put_template_custom Pj 222222 # selection color
  put_template_custom Pk b7b7b7 # selected text color
  put_template_custom Pl b7b7b7 # cursor
  put_template_custom Pm 101010 # cursor text
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

export TINTED_COLOR_00_RGB="101010"
export TINTED_COLOR_01_RGB="232323"
export TINTED_COLOR_02_RGB="222222"
export TINTED_COLOR_03_RGB="333333"
export TINTED_COLOR_04_RGB="999999"
export TINTED_COLOR_05_RGB="b7b7b7"
export TINTED_COLOR_06_RGB="c1c1c1"
export TINTED_COLOR_07_RGB="d5d5d5"
export TINTED_COLOR_08_RGB="de6e6e"
export TINTED_COLOR_09_RGB="dab083"
export TINTED_COLOR_0A_RGB="ffc799"
export TINTED_COLOR_0B_RGB="5f8787"
export TINTED_COLOR_0C_RGB="60a592"
export TINTED_COLOR_0D_RGB="8eaaaa"
export TINTED_COLOR_0E_RGB="d69094"
export TINTED_COLOR_0F_RGB="876c4f"
export TINTED_COLOR_10_RGB="101010"
export TINTED_COLOR_11_RGB="101010"
export TINTED_COLOR_12_RGB="e69292"
export TINTED_COLOR_13_RGB="ffd5b3"
export TINTED_COLOR_14_RGB="84a8a8"
export TINTED_COLOR_15_RGB="88bcad"
export TINTED_COLOR_16_RGB="aabfbf"
export TINTED_COLOR_17_RGB="e0acaf"

export TINTED_COLOR_BRIGHT08_RGB="e69292"
export TINTED_COLOR_BRIGHT09_RGB="e3c4a2"
export TINTED_COLOR_BRIGHT0A_RGB="ffd5b3"
export TINTED_COLOR_BRIGHT0B_RGB="84a8a8"
export TINTED_COLOR_BRIGHT0C_RGB="88bcad"
export TINTED_COLOR_BRIGHT0D_RGB="aabfbf"
export TINTED_COLOR_BRIGHT0E_RGB="e0acaf"
export TINTED_COLOR_BRIGHT0F_RGB="ad9173"
