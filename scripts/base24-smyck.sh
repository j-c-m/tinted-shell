#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Smyck
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-smyck"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="smyck"
fi

color00="1b/1b/1b" # Base 00 - Black
color01="b7/41/31" # Base 08 - Red
color02="7d/a9/00" # Base 0B - Green
color03="8d/cf/f0" # Base 0A - Yellow
color04="62/a3/c4" # Base 0D - Blue
color05="b9/8a/cc" # Base 0E - Magenta
color06="20/73/83" # Base 0C - Cyan
color07="96/96/96" # Base 05 - White
color08="83/83/83" # Base 03 - Bright Black
color09="d6/83/7b" # Base 12 - Bright Red
color10="c4/f0/36" # Base 14 - Bright Green
color11="fe/e1/4d" # Base 13 - Bright Yellow
color12="8d/cf/f0" # Base 16 - Bright Blue
color13="f7/99/ff" # Base 17 - Bright Magenta
color14="69/d9/cf" # Base 15 - Bright Cyan
color15="f7/f7/f7" # Base 07 - Bright White
color16="c4/a4/00" # Base 09
color17="5b/20/18" # Base 0F
color18="00/00/00" # Base 01
color19="7a/7a/7a" # Base 02
color20="8d/8d/8d" # Base 04
color21="a0/a0/a0" # Base 06
color_foreground="96/96/96" # Base 05
color_background="1b/1b/1b" # Base 00


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
  put_template_custom Pg 969696 # foreground
  put_template_custom Ph 1b1b1b # background
  put_template_custom Pi 969696 # bold color
  put_template_custom Pj 7a7a7a # selection color
  put_template_custom Pk 969696 # selected text color
  put_template_custom Pl 969696 # cursor
  put_template_custom Pm 1b1b1b # cursor text
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

export TINTED_COLOR_00_RGB="1b1b1b"
export TINTED_COLOR_01_RGB="000000"
export TINTED_COLOR_02_RGB="7a7a7a"
export TINTED_COLOR_03_RGB="838383"
export TINTED_COLOR_04_RGB="8d8d8d"
export TINTED_COLOR_05_RGB="969696"
export TINTED_COLOR_06_RGB="a0a0a0"
export TINTED_COLOR_07_RGB="f7f7f7"
export TINTED_COLOR_08_RGB="b74131"
export TINTED_COLOR_09_RGB="c4a400"
export TINTED_COLOR_0A_RGB="8dcff0"
export TINTED_COLOR_0B_RGB="7da900"
export TINTED_COLOR_0C_RGB="207383"
export TINTED_COLOR_0D_RGB="62a3c4"
export TINTED_COLOR_0E_RGB="b98acc"
export TINTED_COLOR_0F_RGB="5b2018"
export TINTED_COLOR_10_RGB="515151"
export TINTED_COLOR_11_RGB="282828"
export TINTED_COLOR_12_RGB="d6837b"
export TINTED_COLOR_13_RGB="fee14d"
export TINTED_COLOR_14_RGB="c4f036"
export TINTED_COLOR_15_RGB="69d9cf"
export TINTED_COLOR_16_RGB="8dcff0"
export TINTED_COLOR_17_RGB="f799ff"

export TINTED_COLOR_BRIGHT08_RGB="d6837b"
export TINTED_COLOR_BRIGHT09_RGB="ffd914"
export TINTED_COLOR_BRIGHT0A_RGB="fee14d"
export TINTED_COLOR_BRIGHT0B_RGB="c4f036"
export TINTED_COLOR_BRIGHT0C_RGB="69d9cf"
export TINTED_COLOR_BRIGHT0D_RGB="8dcff0"
export TINTED_COLOR_BRIGHT0E_RGB="f799ff"
export TINTED_COLOR_BRIGHT0F_RGB="a93b2d"
