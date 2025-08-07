#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: vulcan
# Scheme author: Andrey Varfolomeev
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-vulcan"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="vulcan"
fi

color00="04/15/23" # Base 00 - Black
color01="81/85/91" # Base 08 - Red
color02="97/7d/7c" # Base 0B - Green
color03="ad/b4/b9" # Base 0A - Yellow
color04="97/7d/7c" # Base 0D - Blue
color05="91/98/a3" # Base 0E - Magenta
color06="97/7d/7c" # Base 0C - Cyan
color07="5b/77/8c" # Base 05 - White
color08="7a/57/59" # Base 03 - Bright Black
color09="a1/a4/ad" # Base 12 - Bright Red
color10="b1/9e/9d" # Base 14 - Bright Green
color11="c2/c7/cb" # Base 13 - Bright Yellow
color12="b1/9e/9d" # Base 16 - Bright Blue
color13="ad/b2/ba" # Base 17 - Bright Magenta
color14="b1/9e/9d" # Base 15 - Bright Cyan
color15="21/4d/68" # Base 07 - Bright White
color16="91/98/a3" # Base 09
color17="97/7d/7c" # Base 0F
color18="12/23/39" # Base 01
color19="00/35/52" # Base 02
color20="6b/69/77" # Base 04
color21="33/32/38" # Base 06
color_foreground="5b/77/8c" # Base 05
color_background="04/15/23" # Base 00


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
  put_template_custom Pg 5b778c # foreground
  put_template_custom Ph 041523 # background
  put_template_custom Pi 5b778c # bold color
  put_template_custom Pj 003552 # selection color
  put_template_custom Pk 5b778c # selected text color
  put_template_custom Pl 5b778c # cursor
  put_template_custom Pm 041523 # cursor text
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

export TINTED_COLOR_00_RGB="041523"
export TINTED_COLOR_01_RGB="122339"
export TINTED_COLOR_02_RGB="003552"
export TINTED_COLOR_03_RGB="7a5759"
export TINTED_COLOR_04_RGB="6b6977"
export TINTED_COLOR_05_RGB="5b778c"
export TINTED_COLOR_06_RGB="333238"
export TINTED_COLOR_07_RGB="214d68"
export TINTED_COLOR_08_RGB="818591"
export TINTED_COLOR_09_RGB="9198a3"
export TINTED_COLOR_0A_RGB="adb4b9"
export TINTED_COLOR_0B_RGB="977d7c"
export TINTED_COLOR_0C_RGB="977d7c"
export TINTED_COLOR_0D_RGB="977d7c"
export TINTED_COLOR_0E_RGB="9198a3"
export TINTED_COLOR_0F_RGB="977d7c"
export TINTED_COLOR_10_RGB="041523"
export TINTED_COLOR_11_RGB="041523"
export TINTED_COLOR_12_RGB="a1a4ad"
export TINTED_COLOR_13_RGB="c2c7cb"
export TINTED_COLOR_14_RGB="b19e9d"
export TINTED_COLOR_15_RGB="b19e9d"
export TINTED_COLOR_16_RGB="b19e9d"
export TINTED_COLOR_17_RGB="adb2ba"

export TINTED_COLOR_BRIGHT08_RGB="a1a4ad"
export TINTED_COLOR_BRIGHT09_RGB="adb2ba"
export TINTED_COLOR_BRIGHT0A_RGB="c2c7cb"
export TINTED_COLOR_BRIGHT0B_RGB="b19e9d"
export TINTED_COLOR_BRIGHT0C_RGB="b19e9d"
export TINTED_COLOR_BRIGHT0D_RGB="b19e9d"
export TINTED_COLOR_BRIGHT0E_RGB="adb2ba"
export TINTED_COLOR_BRIGHT0F_RGB="b19e9d"
