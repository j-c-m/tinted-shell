#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Gruvbox light, hard
# Scheme author: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-gruvbox-light-hard"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="gruvbox-light-hard"
fi

color00="f9/f5/d7" # Base 00 - Black
color01="9d/00/06" # Base 08 - Red
color02="79/74/0e" # Base 0B - Green
color03="b5/76/14" # Base 0A - Yellow
color04="07/66/78" # Base 0D - Blue
color05="8f/3f/71" # Base 0E - Magenta
color06="42/7b/58" # Base 0C - Cyan
color07="50/49/45" # Base 05 - White
color08="bd/ae/93" # Base 03 - Bright Black
color09="76/00/05" # Base 12 - Bright Red
color10="5d/59/08" # Base 14 - Bright Green
color11="8c/59/0b" # Base 13 - Bright Yellow
color12="04/4d/5b" # Base 16 - Bright Blue
color13="77/23/58" # Base 17 - Bright Magenta
color14="25/69/3f" # Base 15 - Bright Cyan
color15="28/28/28" # Base 07 - Bright White
color16="af/3a/03" # Base 09
color17="d6/5d/0e" # Base 0F
color18="eb/db/b2" # Base 01
color19="d5/c4/a1" # Base 02
color20="66/5c/54" # Base 04
color21="3c/38/36" # Base 06
color_foreground="50/49/45" # Base 05
color_background="f9/f5/d7" # Base 00


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
  put_template_custom Pg 504945 # foreground
  put_template_custom Ph f9f5d7 # background
  put_template_custom Pi 504945 # bold color
  put_template_custom Pj d5c4a1 # selection color
  put_template_custom Pk 504945 # selected text color
  put_template_custom Pl 504945 # cursor
  put_template_custom Pm f9f5d7 # cursor text
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

export TINTED_COLOR_00_RGB="f9f5d7"
export TINTED_COLOR_01_RGB="ebdbb2"
export TINTED_COLOR_02_RGB="d5c4a1"
export TINTED_COLOR_03_RGB="bdae93"
export TINTED_COLOR_04_RGB="665c54"
export TINTED_COLOR_05_RGB="504945"
export TINTED_COLOR_06_RGB="3c3836"
export TINTED_COLOR_07_RGB="282828"
export TINTED_COLOR_08_RGB="9d0006"
export TINTED_COLOR_09_RGB="af3a03"
export TINTED_COLOR_0A_RGB="b57614"
export TINTED_COLOR_0B_RGB="79740e"
export TINTED_COLOR_0C_RGB="427b58"
export TINTED_COLOR_0D_RGB="076678"
export TINTED_COLOR_0E_RGB="8f3f71"
export TINTED_COLOR_0F_RGB="d65d0e"
export TINTED_COLOR_10_RGB="f9f5d7"
export TINTED_COLOR_11_RGB="f9f5d7"
export TINTED_COLOR_12_RGB="760005"
export TINTED_COLOR_13_RGB="8c590b"
export TINTED_COLOR_14_RGB="5d5908"
export TINTED_COLOR_15_RGB="25693f"
export TINTED_COLOR_16_RGB="044d5b"
export TINTED_COLOR_17_RGB="772358"

export TINTED_COLOR_BRIGHT08_RGB="760005"
export TINTED_COLOR_BRIGHT09_RGB="842b02"
export TINTED_COLOR_BRIGHT0A_RGB="8c590b"
export TINTED_COLOR_BRIGHT0B_RGB="5d5908"
export TINTED_COLOR_BRIGHT0C_RGB="25693f"
export TINTED_COLOR_BRIGHT0D_RGB="044d5b"
export TINTED_COLOR_BRIGHT0E_RGB="772358"
export TINTED_COLOR_BRIGHT0F_RGB="a34508"
