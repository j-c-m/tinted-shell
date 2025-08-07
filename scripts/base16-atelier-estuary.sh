#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Atelier Estuary
# Scheme author: Bram de Haan (http://atelierbramdehaan.nl)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-atelier-estuary"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="atelier-estuary"
fi

color00="22/22/1b" # Base 00 - Black
color01="ba/62/36" # Base 08 - Red
color02="7d/97/26" # Base 0B - Green
color03="a5/98/0d" # Base 0A - Yellow
color04="36/a1/66" # Base 0D - Blue
color05="5f/91/82" # Base 0E - Magenta
color06="5b/9d/48" # Base 0C - Cyan
color07="92/91/81" # Base 05 - White
color08="6c/6b/5a" # Base 03 - Bright Black
color09="d1/87/62" # Base 12 - Bright Red
color10="ad/cf/3f" # Base 14 - Bright Green
color11="ed/db/18" # Base 13 - Bright Yellow
color12="59/c7/8b" # Base 16 - Bright Blue
color13="85/af/a2" # Base 17 - Bright Magenta
color14="80/bd/6f" # Base 15 - Bright Cyan
color15="f4/f3/ec" # Base 07 - Bright White
color16="ae/73/13" # Base 09
color17="9d/6c/7c" # Base 0F
color18="30/2f/27" # Base 01
color19="5f/5e/4e" # Base 02
color20="87/85/73" # Base 04
color21="e7/e6/df" # Base 06
color_foreground="92/91/81" # Base 05
color_background="22/22/1b" # Base 00


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
  put_template_custom Pg 929181 # foreground
  put_template_custom Ph 22221b # background
  put_template_custom Pi 929181 # bold color
  put_template_custom Pj 5f5e4e # selection color
  put_template_custom Pk 929181 # selected text color
  put_template_custom Pl 929181 # cursor
  put_template_custom Pm 22221b # cursor text
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

export TINTED_COLOR_00_RGB="22221b"
export TINTED_COLOR_01_RGB="302f27"
export TINTED_COLOR_02_RGB="5f5e4e"
export TINTED_COLOR_03_RGB="6c6b5a"
export TINTED_COLOR_04_RGB="878573"
export TINTED_COLOR_05_RGB="929181"
export TINTED_COLOR_06_RGB="e7e6df"
export TINTED_COLOR_07_RGB="f4f3ec"
export TINTED_COLOR_08_RGB="ba6236"
export TINTED_COLOR_09_RGB="ae7313"
export TINTED_COLOR_0A_RGB="a5980d"
export TINTED_COLOR_0B_RGB="7d9726"
export TINTED_COLOR_0C_RGB="5b9d48"
export TINTED_COLOR_0D_RGB="36a166"
export TINTED_COLOR_0E_RGB="5f9182"
export TINTED_COLOR_0F_RGB="9d6c7c"
export TINTED_COLOR_10_RGB="22221b"
export TINTED_COLOR_11_RGB="22221b"
export TINTED_COLOR_12_RGB="d18762"
export TINTED_COLOR_13_RGB="eddb18"
export TINTED_COLOR_14_RGB="adcf3f"
export TINTED_COLOR_15_RGB="80bd6f"
export TINTED_COLOR_16_RGB="59c78b"
export TINTED_COLOR_17_RGB="85afa2"

export TINTED_COLOR_BRIGHT08_RGB="d18762"
export TINTED_COLOR_BRIGHT09_RGB="e89f29"
export TINTED_COLOR_BRIGHT0A_RGB="eddb18"
export TINTED_COLOR_BRIGHT0B_RGB="adcf3f"
export TINTED_COLOR_BRIGHT0C_RGB="80bd6f"
export TINTED_COLOR_BRIGHT0D_RGB="59c78b"
export TINTED_COLOR_BRIGHT0E_RGB="85afa2"
export TINTED_COLOR_BRIGHT0F_RGB="b6919d"
