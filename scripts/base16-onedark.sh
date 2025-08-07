#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: OneDark
# Scheme author: Lalit Magant (http://github.com/tilal6991)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-onedark"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="onedark"
fi

color00="28/2c/34" # Base 00 - Black
color01="e0/6c/75" # Base 08 - Red
color02="98/c3/79" # Base 0B - Green
color03="e5/c0/7b" # Base 0A - Yellow
color04="61/af/ef" # Base 0D - Blue
color05="c6/78/dd" # Base 0E - Magenta
color06="56/b6/c2" # Base 0C - Cyan
color07="ab/b2/bf" # Base 05 - White
color08="54/58/62" # Base 03 - Bright Black
color09="e8/91/98" # Base 12 - Bright Red
color10="b2/d2/9b" # Base 14 - Bright Green
color11="ec/d0/9c" # Base 13 - Bright Yellow
color12="89/c3/f3" # Base 16 - Bright Blue
color13="d4/9a/e6" # Base 17 - Bright Magenta
color14="80/c8/d1" # Base 15 - Bright Cyan
color15="c8/cc/d4" # Base 07 - Bright White
color16="d1/9a/66" # Base 09
color17="be/50/46" # Base 0F
color18="35/3b/45" # Base 01
color19="3e/44/51" # Base 02
color20="56/5c/64" # Base 04
color21="b6/bd/ca" # Base 06
color_foreground="ab/b2/bf" # Base 05
color_background="28/2c/34" # Base 00


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
  put_template_custom Ph 282c34 # background
  put_template_custom Pi abb2bf # bold color
  put_template_custom Pj 3e4451 # selection color
  put_template_custom Pk abb2bf # selected text color
  put_template_custom Pl abb2bf # cursor
  put_template_custom Pm 282c34 # cursor text
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

export TINTED_COLOR_00_RGB="282c34"
export TINTED_COLOR_01_RGB="353b45"
export TINTED_COLOR_02_RGB="3e4451"
export TINTED_COLOR_03_RGB="545862"
export TINTED_COLOR_04_RGB="565c64"
export TINTED_COLOR_05_RGB="abb2bf"
export TINTED_COLOR_06_RGB="b6bdca"
export TINTED_COLOR_07_RGB="c8ccd4"
export TINTED_COLOR_08_RGB="e06c75"
export TINTED_COLOR_09_RGB="d19a66"
export TINTED_COLOR_0A_RGB="e5c07b"
export TINTED_COLOR_0B_RGB="98c379"
export TINTED_COLOR_0C_RGB="56b6c2"
export TINTED_COLOR_0D_RGB="61afef"
export TINTED_COLOR_0E_RGB="c678dd"
export TINTED_COLOR_0F_RGB="be5046"
export TINTED_COLOR_10_RGB="282c34"
export TINTED_COLOR_11_RGB="282c34"
export TINTED_COLOR_12_RGB="e89198"
export TINTED_COLOR_13_RGB="ecd09c"
export TINTED_COLOR_14_RGB="b2d29b"
export TINTED_COLOR_15_RGB="80c8d1"
export TINTED_COLOR_16_RGB="89c3f3"
export TINTED_COLOR_17_RGB="d49ae6"

export TINTED_COLOR_BRIGHT08_RGB="e89198"
export TINTED_COLOR_BRIGHT09_RGB="ddb38c"
export TINTED_COLOR_BRIGHT0A_RGB="ecd09c"
export TINTED_COLOR_BRIGHT0B_RGB="b2d29b"
export TINTED_COLOR_BRIGHT0C_RGB="80c8d1"
export TINTED_COLOR_BRIGHT0D_RGB="89c3f3"
export TINTED_COLOR_BRIGHT0E_RGB="d49ae6"
export TINTED_COLOR_BRIGHT0F_RGB="ce7c74"
