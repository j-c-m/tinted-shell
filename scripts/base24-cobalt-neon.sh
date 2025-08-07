#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Cobalt Neon
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-cobalt-neon"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="cobalt-neon"
fi

color00="14/28/38" # Base 00 - Black
color01="ff/23/20" # Base 08 - Red
color02="3a/a5/ff" # Base 0B - Green
color03="3c/7d/d2" # Base 0A - Yellow
color04="8f/f5/86" # Base 0D - Blue
color05="78/1a/a0" # Base 0E - Magenta
color06="8f/f5/86" # Base 0C - Cyan
color07="cc/72/a6" # Base 05 - White
color08="ee/ca/92" # Base 03 - Bright Black
color09="d4/31/2e" # Base 12 - Bright Red
color10="8f/f5/86" # Base 14 - Bright Green
color11="e9/f0/6d" # Base 13 - Bright Yellow
color12="3c/7d/d2" # Base 16 - Bright Blue
color13="82/30/a7" # Base 17 - Bright Magenta
color14="6c/bc/67" # Base 15 - Bright Cyan
color15="8f/f5/86" # Base 07 - Bright White
color16="e9/e7/5c" # Base 09
color17="7f/11/10" # Base 0F
color18="14/26/30" # Base 01
color19="ff/f6/88" # Base 02
color20="dd/9e/9c" # Base 04
color21="ba/45/b1" # Base 06
color_foreground="cc/72/a6" # Base 05
color_background="14/28/38" # Base 00


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
  put_template_custom Pg cc72a6 # foreground
  put_template_custom Ph 142838 # background
  put_template_custom Pi cc72a6 # bold color
  put_template_custom Pj fff688 # selection color
  put_template_custom Pk cc72a6 # selected text color
  put_template_custom Pl cc72a6 # cursor
  put_template_custom Pm 142838 # cursor text
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

export TINTED_COLOR_00_RGB="142838"
export TINTED_COLOR_01_RGB="142630"
export TINTED_COLOR_02_RGB="fff688"
export TINTED_COLOR_03_RGB="eeca92"
export TINTED_COLOR_04_RGB="dd9e9c"
export TINTED_COLOR_05_RGB="cc72a6"
export TINTED_COLOR_06_RGB="ba45b1"
export TINTED_COLOR_07_RGB="8ff586"
export TINTED_COLOR_08_RGB="ff2320"
export TINTED_COLOR_09_RGB="e9e75c"
export TINTED_COLOR_0A_RGB="3c7dd2"
export TINTED_COLOR_0B_RGB="3aa5ff"
export TINTED_COLOR_0C_RGB="8ff586"
export TINTED_COLOR_0D_RGB="8ff586"
export TINTED_COLOR_0E_RGB="781aa0"
export TINTED_COLOR_0F_RGB="7f1110"
export TINTED_COLOR_10_RGB="aaa45a"
export TINTED_COLOR_11_RGB="55522d"
export TINTED_COLOR_12_RGB="d4312e"
export TINTED_COLOR_13_RGB="e9f06d"
export TINTED_COLOR_14_RGB="8ff586"
export TINTED_COLOR_15_RGB="6cbc67"
export TINTED_COLOR_16_RGB="3c7dd2"
export TINTED_COLOR_17_RGB="8230a7"

export TINTED_COLOR_BRIGHT08_RGB="d4312e"
export TINTED_COLOR_BRIGHT09_RGB="efed85"
export TINTED_COLOR_BRIGHT0A_RGB="e9f06d"
export TINTED_COLOR_BRIGHT0B_RGB="8ff586"
export TINTED_COLOR_BRIGHT0C_RGB="6cbc67"
export TINTED_COLOR_BRIGHT0D_RGB="3c7dd2"
export TINTED_COLOR_BRIGHT0E_RGB="8230a7"
export TINTED_COLOR_BRIGHT0F_RGB="d01c1a"
