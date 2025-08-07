#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Hardcore
# Scheme author: Chris Caller
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-hardcore"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="hardcore"
fi

color00="21/21/21" # Base 00 - Black
color01="f9/26/72" # Base 08 - Red
color02="a6/e2/2e" # Base 0B - Green
color03="e6/db/74" # Base 0A - Yellow
color04="66/d9/ef" # Base 0D - Blue
color05="9e/6f/fe" # Base 0E - Magenta
color06="70/83/87" # Base 0C - Cyan
color07="cd/cd/cd" # Base 05 - White
color08="4a/4a/4a" # Base 03 - Bright Black
color09="fb/5c/95" # Base 12 - Bright Red
color10="bc/e9/62" # Base 14 - Bright Green
color11="ec/e4/97" # Base 13 - Bright Yellow
color12="8c/e3/f3" # Base 16 - Bright Blue
color13="b6/93/fe" # Base 17 - Bright Magenta
color14="93/a2/a6" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="fd/97/1f" # Base 09
color17="e8/b8/82" # Base 0F
color18="30/30/30" # Base 01
color19="35/35/35" # Base 02
color20="70/70/70" # Base 04
color21="e5/e5/e5" # Base 06
color_foreground="cd/cd/cd" # Base 05
color_background="21/21/21" # Base 00


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
  put_template_custom Pg cdcdcd # foreground
  put_template_custom Ph 212121 # background
  put_template_custom Pi cdcdcd # bold color
  put_template_custom Pj 353535 # selection color
  put_template_custom Pk cdcdcd # selected text color
  put_template_custom Pl cdcdcd # cursor
  put_template_custom Pm 212121 # cursor text
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

export TINTED_COLOR_00_RGB="212121"
export TINTED_COLOR_01_RGB="303030"
export TINTED_COLOR_02_RGB="353535"
export TINTED_COLOR_03_RGB="4a4a4a"
export TINTED_COLOR_04_RGB="707070"
export TINTED_COLOR_05_RGB="cdcdcd"
export TINTED_COLOR_06_RGB="e5e5e5"
export TINTED_COLOR_07_RGB="ffffff"
export TINTED_COLOR_08_RGB="f92672"
export TINTED_COLOR_09_RGB="fd971f"
export TINTED_COLOR_0A_RGB="e6db74"
export TINTED_COLOR_0B_RGB="a6e22e"
export TINTED_COLOR_0C_RGB="708387"
export TINTED_COLOR_0D_RGB="66d9ef"
export TINTED_COLOR_0E_RGB="9e6ffe"
export TINTED_COLOR_0F_RGB="e8b882"
export TINTED_COLOR_10_RGB="212121"
export TINTED_COLOR_11_RGB="212121"
export TINTED_COLOR_12_RGB="fb5c95"
export TINTED_COLOR_13_RGB="ece497"
export TINTED_COLOR_14_RGB="bce962"
export TINTED_COLOR_15_RGB="93a2a6"
export TINTED_COLOR_16_RGB="8ce3f3"
export TINTED_COLOR_17_RGB="b693fe"

export TINTED_COLOR_BRIGHT08_RGB="fb5c95"
export TINTED_COLOR_BRIGHT09_RGB="fdb157"
export TINTED_COLOR_BRIGHT0A_RGB="ece497"
export TINTED_COLOR_BRIGHT0B_RGB="bce962"
export TINTED_COLOR_BRIGHT0C_RGB="93a2a6"
export TINTED_COLOR_BRIGHT0D_RGB="8ce3f3"
export TINTED_COLOR_BRIGHT0E_RGB="b693fe"
export TINTED_COLOR_BRIGHT0F_RGB="eecaa1"
