#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Woodland
# Scheme author: Jay Cornwall (https://jcornwall.com)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-woodland"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="woodland"
fi

color00="23/1e/18" # Base 00 - Black
color01="d3/5c/5c" # Base 08 - Red
color02="b7/ba/53" # Base 0B - Green
color03="e0/ac/16" # Base 0A - Yellow
color04="88/a4/d3" # Base 0D - Blue
color05="bb/90/e2" # Base 0E - Magenta
color06="6e/b9/58" # Base 0C - Cyan
color07="ca/bc/b1" # Base 05 - White
color08="9d/8b/70" # Base 03 - Bright Black
color09="de/85/85" # Base 12 - Bright Red
color10="c9/cb/7e" # Base 14 - Bright Green
color11="ed/c3/4b" # Base 13 - Bright Yellow
color12="a6/bb/de" # Base 16 - Bright Blue
color13="cc/ac/e9" # Base 17 - Bright Magenta
color14="92/cb/82" # Base 15 - Bright Cyan
color15="e4/d4/c8" # Base 07 - Bright White
color16="ca/7f/32" # Base 09
color17="b4/93/68" # Base 0F
color18="30/2b/25" # Base 01
color19="48/41/3a" # Base 02
color20="b4/a4/90" # Base 04
color21="d7/c8/bc" # Base 06
color_foreground="ca/bc/b1" # Base 05
color_background="23/1e/18" # Base 00


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
  put_template_custom Pg cabcb1 # foreground
  put_template_custom Ph 231e18 # background
  put_template_custom Pi cabcb1 # bold color
  put_template_custom Pj 48413a # selection color
  put_template_custom Pk cabcb1 # selected text color
  put_template_custom Pl cabcb1 # cursor
  put_template_custom Pm 231e18 # cursor text
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

export TINTED_COLOR_00_RGB="231e18"
export TINTED_COLOR_01_RGB="302b25"
export TINTED_COLOR_02_RGB="48413a"
export TINTED_COLOR_03_RGB="9d8b70"
export TINTED_COLOR_04_RGB="b4a490"
export TINTED_COLOR_05_RGB="cabcb1"
export TINTED_COLOR_06_RGB="d7c8bc"
export TINTED_COLOR_07_RGB="e4d4c8"
export TINTED_COLOR_08_RGB="d35c5c"
export TINTED_COLOR_09_RGB="ca7f32"
export TINTED_COLOR_0A_RGB="e0ac16"
export TINTED_COLOR_0B_RGB="b7ba53"
export TINTED_COLOR_0C_RGB="6eb958"
export TINTED_COLOR_0D_RGB="88a4d3"
export TINTED_COLOR_0E_RGB="bb90e2"
export TINTED_COLOR_0F_RGB="b49368"
export TINTED_COLOR_10_RGB="231e18"
export TINTED_COLOR_11_RGB="231e18"
export TINTED_COLOR_12_RGB="de8585"
export TINTED_COLOR_13_RGB="edc34b"
export TINTED_COLOR_14_RGB="c9cb7e"
export TINTED_COLOR_15_RGB="92cb82"
export TINTED_COLOR_16_RGB="a6bbde"
export TINTED_COLOR_17_RGB="ccace9"

export TINTED_COLOR_BRIGHT08_RGB="de8585"
export TINTED_COLOR_BRIGHT09_RGB="d99f64"
export TINTED_COLOR_BRIGHT0A_RGB="edc34b"
export TINTED_COLOR_BRIGHT0B_RGB="c9cb7e"
export TINTED_COLOR_BRIGHT0C_RGB="92cb82"
export TINTED_COLOR_BRIGHT0D_RGB="a6bbde"
export TINTED_COLOR_BRIGHT0E_RGB="ccace9"
export TINTED_COLOR_BRIGHT0F_RGB="c7ae8e"
