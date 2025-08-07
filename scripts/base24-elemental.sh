#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Elemental
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-elemental"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="elemental"
fi

color00="21/21/1c" # Base 00 - Black
color01="97/28/0f" # Base 08 - Red
color02="47/99/42" # Base 0B - Green
color03="78/d8/d8" # Base 0A - Yellow
color04="49/7f/7d" # Base 0D - Blue
color05="7e/4e/2e" # Base 0E - Magenta
color06="38/7f/58" # Base 0C - Cyan
color07="75/6f/68" # Base 05 - White
color08="5f/5d/50" # Base 03 - Bright Black
color09="df/50/2a" # Base 12 - Bright Red
color10="60/e0/6f" # Base 14 - Bright Green
color11="d6/98/27" # Base 13 - Bright Yellow
color12="78/d8/d8" # Base 16 - Bright Blue
color13="cd/7c/53" # Base 17 - Bright Magenta
color14="58/d5/98" # Base 15 - Bright Cyan
color15="ff/f1/e8" # Base 07 - Bright White
color16="7f/71/10" # Base 09
color17="4b/14/07" # Base 0F
color18="3c/3b/30" # Base 01
color19="54/54/44" # Base 02
color20="6a/66/5c" # Base 04
color21="80/79/74" # Base 06
color_foreground="75/6f/68" # Base 05
color_background="21/21/1c" # Base 00


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
  put_template_custom Pg 756f68 # foreground
  put_template_custom Ph 21211c # background
  put_template_custom Pi 756f68 # bold color
  put_template_custom Pj 545444 # selection color
  put_template_custom Pk 756f68 # selected text color
  put_template_custom Pl 756f68 # cursor
  put_template_custom Pm 21211c # cursor text
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

export TINTED_COLOR_00_RGB="21211c"
export TINTED_COLOR_01_RGB="3c3b30"
export TINTED_COLOR_02_RGB="545444"
export TINTED_COLOR_03_RGB="5f5d50"
export TINTED_COLOR_04_RGB="6a665c"
export TINTED_COLOR_05_RGB="756f68"
export TINTED_COLOR_06_RGB="807974"
export TINTED_COLOR_07_RGB="fff1e8"
export TINTED_COLOR_08_RGB="97280f"
export TINTED_COLOR_09_RGB="7f7110"
export TINTED_COLOR_0A_RGB="78d8d8"
export TINTED_COLOR_0B_RGB="479942"
export TINTED_COLOR_0C_RGB="387f58"
export TINTED_COLOR_0D_RGB="497f7d"
export TINTED_COLOR_0E_RGB="7e4e2e"
export TINTED_COLOR_0F_RGB="4b1407"
export TINTED_COLOR_10_RGB="38382d"
export TINTED_COLOR_11_RGB="1c1c16"
export TINTED_COLOR_12_RGB="df502a"
export TINTED_COLOR_13_RGB="d69827"
export TINTED_COLOR_14_RGB="60e06f"
export TINTED_COLOR_15_RGB="58d598"
export TINTED_COLOR_16_RGB="78d8d8"
export TINTED_COLOR_17_RGB="cd7c53"

export TINTED_COLOR_BRIGHT08_RGB="df502a"
export TINTED_COLOR_BRIGHT09_RGB="d0ba1a"
export TINTED_COLOR_BRIGHT0A_RGB="d69827"
export TINTED_COLOR_BRIGHT0B_RGB="60e06f"
export TINTED_COLOR_BRIGHT0C_RGB="58d598"
export TINTED_COLOR_BRIGHT0D_RGB="78d8d8"
export TINTED_COLOR_BRIGHT0E_RGB="cd7c53"
export TINTED_COLOR_BRIGHT0F_RGB="ad2e10"
