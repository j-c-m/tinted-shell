#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Atelier Cave Light
# Scheme author: Bram de Haan (http://atelierbramdehaan.nl)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-atelier-cave-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="atelier-cave-light"
fi

color00="ef/ec/f4" # Base 00 - Black
color01="be/46/78" # Base 08 - Red
color02="2a/92/92" # Base 0B - Green
color03="a0/6e/3b" # Base 0A - Yellow
color04="57/6d/db" # Base 0D - Blue
color05="95/5a/e7" # Base 0E - Magenta
color06="39/8b/c6" # Base 0C - Cyan
color07="58/52/60" # Base 05 - White
color08="7e/78/87" # Base 03 - Bright Black
color09="9d/26/58" # Base 12 - Bright Red
color10="18/75/75" # Base 14 - Bright Green
color11="83/53/21" # Base 13 - Bright Yellow
color12="1e/3b/c7" # Base 16 - Bright Blue
color13="68/17/da" # Base 17 - Bright Magenta
color14="20/6a/9f" # Base 15 - Bright Cyan
color15="19/17/1c" # Base 07 - Bright White
color16="aa/57/3c" # Base 09
color17="bf/40/bf" # Base 0F
color18="e2/df/e7" # Base 01
color19="8b/87/92" # Base 02
color20="65/5f/6d" # Base 04
color21="26/23/2a" # Base 06
color_foreground="58/52/60" # Base 05
color_background="ef/ec/f4" # Base 00


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
  put_template_custom Pg 585260 # foreground
  put_template_custom Ph efecf4 # background
  put_template_custom Pi 585260 # bold color
  put_template_custom Pj 8b8792 # selection color
  put_template_custom Pk 585260 # selected text color
  put_template_custom Pl 585260 # cursor
  put_template_custom Pm efecf4 # cursor text
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

export TINTED_COLOR_00_RGB="efecf4"
export TINTED_COLOR_01_RGB="e2dfe7"
export TINTED_COLOR_02_RGB="8b8792"
export TINTED_COLOR_03_RGB="7e7887"
export TINTED_COLOR_04_RGB="655f6d"
export TINTED_COLOR_05_RGB="585260"
export TINTED_COLOR_06_RGB="26232a"
export TINTED_COLOR_07_RGB="19171c"
export TINTED_COLOR_08_RGB="be4678"
export TINTED_COLOR_09_RGB="aa573c"
export TINTED_COLOR_0A_RGB="a06e3b"
export TINTED_COLOR_0B_RGB="2a9292"
export TINTED_COLOR_0C_RGB="398bc6"
export TINTED_COLOR_0D_RGB="576ddb"
export TINTED_COLOR_0E_RGB="955ae7"
export TINTED_COLOR_0F_RGB="bf40bf"
export TINTED_COLOR_10_RGB="efecf4"
export TINTED_COLOR_11_RGB="efecf4"
export TINTED_COLOR_12_RGB="9d2658"
export TINTED_COLOR_13_RGB="835321"
export TINTED_COLOR_14_RGB="187575"
export TINTED_COLOR_15_RGB="206a9f"
export TINTED_COLOR_16_RGB="1e3bc7"
export TINTED_COLOR_17_RGB="6817da"

export TINTED_COLOR_BRIGHT08_RGB="9d2658"
export TINTED_COLOR_BRIGHT09_RGB="8b3c22"
export TINTED_COLOR_BRIGHT0A_RGB="835321"
export TINTED_COLOR_BRIGHT0B_RGB="187575"
export TINTED_COLOR_BRIGHT0C_RGB="206a9f"
export TINTED_COLOR_BRIGHT0D_RGB="1e3bc7"
export TINTED_COLOR_BRIGHT0E_RGB="6817da"
export TINTED_COLOR_BRIGHT0F_RGB="9b249b"
