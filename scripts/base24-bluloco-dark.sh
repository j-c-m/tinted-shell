#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Bluloco Dark
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-bluloco-dark"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="bluloco-dark"
fi

color00="1e/20/27" # Base 00 - Black
color01="f7/10/41" # Base 08 - Red
color02="23/97/4a" # Base 0B - Green
color03="18/9f/fd" # Base 0A - Yellow
color04="28/5a/fe" # Base 0D - Blue
color05="8c/62/fd" # Base 0E - Magenta
color06="36/6f/99" # Base 0C - Cyan
color07="b1/ba/c9" # Base 05 - White
color08="7b/84/94" # Base 03 - Bright Black
color09="fb/49/6d" # Base 12 - Bright Red
color10="37/bc/58" # Base 14 - Bright Green
color11="f6/bd/47" # Base 13 - Bright Yellow
color12="18/9f/fd" # Base 16 - Bright Blue
color13="fb/57/f6" # Base 17 - Bright Magenta
color14="4f/ab/ad" # Base 15 - Bright Cyan
color15="fe/fe/fe" # Base 07 - Bright White
color16="fc/7e/57" # Base 09
color17="7b/08/20" # Base 0F
color18="49/4f/5c" # Base 01
color19="60/69/7a" # Base 02
color20="96/9f/af" # Base 04
color21="cc/d5/e4" # Base 06
color_foreground="b1/ba/c9" # Base 05
color_background="1e/20/27" # Base 00


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
  put_template_custom Pg b1bac9 # foreground
  put_template_custom Ph 1e2027 # background
  put_template_custom Pi b1bac9 # bold color
  put_template_custom Pj 60697a # selection color
  put_template_custom Pk b1bac9 # selected text color
  put_template_custom Pl b1bac9 # cursor
  put_template_custom Pm 1e2027 # cursor text
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

export TINTED_COLOR_00_RGB="1e2027"
export TINTED_COLOR_01_RGB="494f5c"
export TINTED_COLOR_02_RGB="60697a"
export TINTED_COLOR_03_RGB="7b8494"
export TINTED_COLOR_04_RGB="969faf"
export TINTED_COLOR_05_RGB="b1bac9"
export TINTED_COLOR_06_RGB="ccd5e4"
export TINTED_COLOR_07_RGB="fefefe"
export TINTED_COLOR_08_RGB="f71041"
export TINTED_COLOR_09_RGB="fc7e57"
export TINTED_COLOR_0A_RGB="189ffd"
export TINTED_COLOR_0B_RGB="23974a"
export TINTED_COLOR_0C_RGB="366f99"
export TINTED_COLOR_0D_RGB="285afe"
export TINTED_COLOR_0E_RGB="8c62fd"
export TINTED_COLOR_0F_RGB="7b0820"
export TINTED_COLOR_10_RGB="404651"
export TINTED_COLOR_11_RGB="202328"
export TINTED_COLOR_12_RGB="fb496d"
export TINTED_COLOR_13_RGB="f6bd47"
export TINTED_COLOR_14_RGB="37bc58"
export TINTED_COLOR_15_RGB="4fabad"
export TINTED_COLOR_16_RGB="189ffd"
export TINTED_COLOR_17_RGB="fb57f6"

export TINTED_COLOR_BRIGHT08_RGB="fb496d"
export TINTED_COLOR_BRIGHT09_RGB="fd9e81"
export TINTED_COLOR_BRIGHT0A_RGB="f6bd47"
export TINTED_COLOR_BRIGHT0B_RGB="37bc58"
export TINTED_COLOR_BRIGHT0C_RGB="4fabad"
export TINTED_COLOR_BRIGHT0D_RGB="189ffd"
export TINTED_COLOR_BRIGHT0E_RGB="fb57f6"
export TINTED_COLOR_BRIGHT0F_RGB="d40e37"
