#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Gruvbox dark, pale
# Scheme author: Dawid Kurek (dawikur@gmail.com), morhetz (https://github.com/morhetz/gruvbox)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-gruvbox-dark-pale"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="gruvbox-dark-pale"
fi

color00="26/26/26" # Base 00 - Black
color01="d7/5f/5f" # Base 08 - Red
color02="af/af/00" # Base 0B - Green
color03="ff/af/00" # Base 0A - Yellow
color04="83/ad/ad" # Base 0D - Blue
color05="d4/85/ad" # Base 0E - Magenta
color06="85/ad/85" # Base 0C - Cyan
color07="da/b9/97" # Base 05 - White
color08="8a/8a/8a" # Base 03 - Bright Black
color09="e1/87/87" # Base 12 - Bright Red
color10="ff/ff/04" # Base 14 - Bright Green
color11="ff/c3/40" # Base 13 - Bright Yellow
color12="a2/c2/c2" # Base 16 - Bright Blue
color13="df/a4/c2" # Base 17 - Bright Magenta
color14="a4/c2/a4" # Base 15 - Bright Cyan
color15="eb/db/b2" # Base 07 - Bright White
color16="ff/87/00" # Base 09
color17="d6/5d/0e" # Base 0F
color18="3a/3a/3a" # Base 01
color19="4e/4e/4e" # Base 02
color20="94/94/94" # Base 04
color21="d5/c4/a1" # Base 06
color_foreground="da/b9/97" # Base 05
color_background="26/26/26" # Base 00


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
  put_template_custom Pg dab997 # foreground
  put_template_custom Ph 262626 # background
  put_template_custom Pi dab997 # bold color
  put_template_custom Pj 4e4e4e # selection color
  put_template_custom Pk dab997 # selected text color
  put_template_custom Pl dab997 # cursor
  put_template_custom Pm 262626 # cursor text
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

export TINTED_COLOR_00_RGB="262626"
export TINTED_COLOR_01_RGB="3a3a3a"
export TINTED_COLOR_02_RGB="4e4e4e"
export TINTED_COLOR_03_RGB="8a8a8a"
export TINTED_COLOR_04_RGB="949494"
export TINTED_COLOR_05_RGB="dab997"
export TINTED_COLOR_06_RGB="d5c4a1"
export TINTED_COLOR_07_RGB="ebdbb2"
export TINTED_COLOR_08_RGB="d75f5f"
export TINTED_COLOR_09_RGB="ff8700"
export TINTED_COLOR_0A_RGB="ffaf00"
export TINTED_COLOR_0B_RGB="afaf00"
export TINTED_COLOR_0C_RGB="85ad85"
export TINTED_COLOR_0D_RGB="83adad"
export TINTED_COLOR_0E_RGB="d485ad"
export TINTED_COLOR_0F_RGB="d65d0e"
export TINTED_COLOR_10_RGB="262626"
export TINTED_COLOR_11_RGB="262626"
export TINTED_COLOR_12_RGB="e18787"
export TINTED_COLOR_13_RGB="ffc340"
export TINTED_COLOR_14_RGB="ffff04"
export TINTED_COLOR_15_RGB="a4c2a4"
export TINTED_COLOR_16_RGB="a2c2c2"
export TINTED_COLOR_17_RGB="dfa4c2"

export TINTED_COLOR_BRIGHT08_RGB="e18787"
export TINTED_COLOR_BRIGHT09_RGB="ffa540"
export TINTED_COLOR_BRIGHT0A_RGB="ffc340"
export TINTED_COLOR_BRIGHT0B_RGB="ffff04"
export TINTED_COLOR_BRIGHT0C_RGB="a4c2a4"
export TINTED_COLOR_BRIGHT0D_RGB="a2c2c2"
export TINTED_COLOR_BRIGHT0E_RGB="dfa4c2"
export TINTED_COLOR_BRIGHT0F_RGB="f28238"
