#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Silk Light
# Scheme author: Gabriel Fontes (https://github.com/Misterio77)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-silk-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="silk-light"
fi

color00="e9/f1/ef" # Base 00 - Black
color01="cf/43/2e" # Base 08 - Red
color02="6c/a3/8c" # Base 0B - Green
color03="cf/ad/25" # Base 0A - Yellow
color04="39/aa/c9" # Base 0D - Blue
color05="6e/65/82" # Base 0E - Magenta
color06="32/9c/a2" # Base 0C - Cyan
color07="38/51/56" # Base 05 - White
color08="5c/78/7b" # Base 03 - Bright Black
color09="a4/2c/1a" # Base 12 - Bright Red
color10="3b/91/6d" # Base 14 - Bright Green
color11="a2/86/15" # Base 13 - Bright Yellow
color12="1f/86/a2" # Base 16 - Bright Blue
color13="4b/39/74" # Base 17 - Bright Magenta
color14="1c/7d/83" # Base 15 - Bright Cyan
color15="d2/fa/ff" # Base 07 - Bright White
color16="d2/7f/46" # Base 09
color17="86/53/69" # Base 0F
color18="cc/d4/d3" # Base 01
color19="90/b7/b6" # Base 02
color20="4b/5b/5f" # Base 04
color21="0e/3c/46" # Base 06
color_foreground="38/51/56" # Base 05
color_background="e9/f1/ef" # Base 00


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
  put_template_custom Pg 385156 # foreground
  put_template_custom Ph e9f1ef # background
  put_template_custom Pi 385156 # bold color
  put_template_custom Pj 90b7b6 # selection color
  put_template_custom Pk 385156 # selected text color
  put_template_custom Pl 385156 # cursor
  put_template_custom Pm e9f1ef # cursor text
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

export TINTED_COLOR_00_RGB="e9f1ef"
export TINTED_COLOR_01_RGB="ccd4d3"
export TINTED_COLOR_02_RGB="90b7b6"
export TINTED_COLOR_03_RGB="5c787b"
export TINTED_COLOR_04_RGB="4b5b5f"
export TINTED_COLOR_05_RGB="385156"
export TINTED_COLOR_06_RGB="0e3c46"
export TINTED_COLOR_07_RGB="d2faff"
export TINTED_COLOR_08_RGB="cf432e"
export TINTED_COLOR_09_RGB="d27f46"
export TINTED_COLOR_0A_RGB="cfad25"
export TINTED_COLOR_0B_RGB="6ca38c"
export TINTED_COLOR_0C_RGB="329ca2"
export TINTED_COLOR_0D_RGB="39aac9"
export TINTED_COLOR_0E_RGB="6e6582"
export TINTED_COLOR_0F_RGB="865369"
export TINTED_COLOR_10_RGB="e9f1ef"
export TINTED_COLOR_11_RGB="e9f1ef"
export TINTED_COLOR_12_RGB="a42c1a"
export TINTED_COLOR_13_RGB="a28615"
export TINTED_COLOR_14_RGB="3b916d"
export TINTED_COLOR_15_RGB="1c7d83"
export TINTED_COLOR_16_RGB="1f86a2"
export TINTED_COLOR_17_RGB="4b3974"

export TINTED_COLOR_BRIGHT08_RGB="a42c1a"
export TINTED_COLOR_BRIGHT09_RGB="b35b1f"
export TINTED_COLOR_BRIGHT0A_RGB="a28615"
export TINTED_COLOR_BRIGHT0B_RGB="3b916d"
export TINTED_COLOR_BRIGHT0C_RGB="1c7d83"
export TINTED_COLOR_BRIGHT0D_RGB="1f86a2"
export TINTED_COLOR_BRIGHT0E_RGB="4b3974"
export TINTED_COLOR_BRIGHT0F_RGB="742f4d"
