#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Twilight
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-twilight"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="twilight"
fi

color00="14/14/14" # Base 00 - Black
color01="c0/6c/43" # Base 08 - Red
color02="af/b9/79" # Base 0B - Green
color03="5a/5d/61" # Base 0A - Yellow
color04="44/46/49" # Base 0D - Blue
color05="b4/be/7b" # Base 0E - Magenta
color06="77/82/84" # Base 0C - Cyan
color07="c8/c8/a7" # Base 05 - White
color08="5c/5c/51" # Base 03 - Bright Black
color09="dd/7c/4c" # Base 12 - Bright Red
color10="cb/d8/8c" # Base 14 - Bright Green
color11="e1/c4/7d" # Base 13 - Bright Yellow
color12="5a/5d/61" # Base 16 - Bright Blue
color13="d0/db/8e" # Base 17 - Bright Magenta
color14="8a/98/9a" # Base 15 - Bright Cyan
color15="fe/ff/d3" # Base 07 - Bright White
color16="c2/a8/6c" # Base 09
color17="60/36/21" # Base 0F
color18="14/14/14" # Base 01
color19="26/26/26" # Base 02
color20="92/92/7c" # Base 04
color21="fe/ff/d3" # Base 06
color_foreground="c8/c8/a7" # Base 05
color_background="14/14/14" # Base 00


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
  put_template_custom Pg c8c8a7 # foreground
  put_template_custom Ph 141414 # background
  put_template_custom Pi c8c8a7 # bold color
  put_template_custom Pj 262626 # selection color
  put_template_custom Pk c8c8a7 # selected text color
  put_template_custom Pl c8c8a7 # cursor
  put_template_custom Pm 141414 # cursor text
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

export TINTED_COLOR_00_RGB="141414"
export TINTED_COLOR_01_RGB="141414"
export TINTED_COLOR_02_RGB="262626"
export TINTED_COLOR_03_RGB="5c5c51"
export TINTED_COLOR_04_RGB="92927c"
export TINTED_COLOR_05_RGB="c8c8a7"
export TINTED_COLOR_06_RGB="feffd3"
export TINTED_COLOR_07_RGB="feffd3"
export TINTED_COLOR_08_RGB="c06c43"
export TINTED_COLOR_09_RGB="c2a86c"
export TINTED_COLOR_0A_RGB="5a5d61"
export TINTED_COLOR_0B_RGB="afb979"
export TINTED_COLOR_0C_RGB="778284"
export TINTED_COLOR_0D_RGB="444649"
export TINTED_COLOR_0E_RGB="b4be7b"
export TINTED_COLOR_0F_RGB="603621"
export TINTED_COLOR_10_RGB="191919"
export TINTED_COLOR_11_RGB="0c0c0c"
export TINTED_COLOR_12_RGB="dd7c4c"
export TINTED_COLOR_13_RGB="e1c47d"
export TINTED_COLOR_14_RGB="cbd88c"
export TINTED_COLOR_15_RGB="8a989a"
export TINTED_COLOR_16_RGB="5a5d61"
export TINTED_COLOR_17_RGB="d0db8e"

export TINTED_COLOR_BRIGHT08_RGB="dd7c4c"
export TINTED_COLOR_BRIGHT09_RGB="d1be91"
export TINTED_COLOR_BRIGHT0A_RGB="e1c47d"
export TINTED_COLOR_BRIGHT0B_RGB="cbd88c"
export TINTED_COLOR_BRIGHT0C_RGB="8a989a"
export TINTED_COLOR_BRIGHT0D_RGB="5a5d61"
export TINTED_COLOR_BRIGHT0E_RGB="d0db8e"
export TINTED_COLOR_BRIGHT0F_RGB="a75e39"
