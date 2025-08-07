#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Grayscale Light
# Scheme author: Alexandre Gavioli (https://github.com/Alexx2/)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-grayscale-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="grayscale-light"
fi

color00="f7/f7/f7" # Base 00 - Black
color01="7c/7c/7c" # Base 08 - Red
color02="8e/8e/8e" # Base 0B - Green
color03="a0/a0/a0" # Base 0A - Yellow
color04="68/68/68" # Base 0D - Blue
color05="74/74/74" # Base 0E - Magenta
color06="86/86/86" # Base 0C - Cyan
color07="46/46/46" # Base 05 - White
color08="ab/ab/ab" # Base 03 - Bright Black
color09="74/46/46" # Base 12 - Bright Red
color10="85/50/50" # Base 14 - Bright Green
color11="96/5a/5a" # Base 13 - Bright Yellow
color12="62/3b/3b" # Base 16 - Bright Blue
color13="6d/41/41" # Base 17 - Bright Magenta
color14="7e/4b/4b" # Base 15 - Bright Cyan
color15="10/10/10" # Base 07 - Bright White
color16="99/99/99" # Base 09
color17="5e/5e/5e" # Base 0F
color18="e3/e3/e3" # Base 01
color19="b9/b9/b9" # Base 02
color20="52/52/52" # Base 04
color21="25/25/25" # Base 06
color_foreground="46/46/46" # Base 05
color_background="f7/f7/f7" # Base 00


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
  put_template_custom Pg 464646 # foreground
  put_template_custom Ph f7f7f7 # background
  put_template_custom Pi 464646 # bold color
  put_template_custom Pj b9b9b9 # selection color
  put_template_custom Pk 464646 # selected text color
  put_template_custom Pl 464646 # cursor
  put_template_custom Pm f7f7f7 # cursor text
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

export TINTED_COLOR_00_RGB="f7f7f7"
export TINTED_COLOR_01_RGB="e3e3e3"
export TINTED_COLOR_02_RGB="b9b9b9"
export TINTED_COLOR_03_RGB="ababab"
export TINTED_COLOR_04_RGB="525252"
export TINTED_COLOR_05_RGB="464646"
export TINTED_COLOR_06_RGB="252525"
export TINTED_COLOR_07_RGB="101010"
export TINTED_COLOR_08_RGB="7c7c7c"
export TINTED_COLOR_09_RGB="999999"
export TINTED_COLOR_0A_RGB="a0a0a0"
export TINTED_COLOR_0B_RGB="8e8e8e"
export TINTED_COLOR_0C_RGB="868686"
export TINTED_COLOR_0D_RGB="686868"
export TINTED_COLOR_0E_RGB="747474"
export TINTED_COLOR_0F_RGB="5e5e5e"
export TINTED_COLOR_10_RGB="f7f7f7"
export TINTED_COLOR_11_RGB="f7f7f7"
export TINTED_COLOR_12_RGB="744646"
export TINTED_COLOR_13_RGB="965a5a"
export TINTED_COLOR_14_RGB="855050"
export TINTED_COLOR_15_RGB="7e4b4b"
export TINTED_COLOR_16_RGB="623b3b"
export TINTED_COLOR_17_RGB="6d4141"

export TINTED_COLOR_BRIGHT08_RGB="744646"
export TINTED_COLOR_BRIGHT09_RGB="8f5656"
export TINTED_COLOR_BRIGHT0A_RGB="965a5a"
export TINTED_COLOR_BRIGHT0B_RGB="855050"
export TINTED_COLOR_BRIGHT0C_RGB="7e4b4b"
export TINTED_COLOR_BRIGHT0D_RGB="623b3b"
export TINTED_COLOR_BRIGHT0E_RGB="6d4141"
export TINTED_COLOR_BRIGHT0F_RGB="583535"
