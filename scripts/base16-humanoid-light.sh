#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Humanoid light
# Scheme author: Thomas (tasmo) Friese
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-humanoid-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="humanoid-light"
fi

color00="f8/f8/f2" # Base 00 - Black
color01="b0/15/1a" # Base 08 - Red
color02="38/8e/3c" # Base 0B - Green
color03="ff/b6/27" # Base 0A - Yellow
color04="00/82/c9" # Base 0D - Blue
color05="70/0f/98" # Base 0E - Magenta
color06="00/8e/8e" # Base 0C - Cyan
color07="23/26/29" # Base 05 - White
color08="c0/c0/bd" # Base 03 - Bright Black
color09="88/0c/10" # Base 12 - Bright Red
color10="1f/75/23" # Base 14 - Bright Green
color11="dd/92/00" # Base 13 - Bright Yellow
color12="00/62/97" # Base 16 - Bright Blue
color13="55/08/75" # Base 17 - Bright Magenta
color14="00/6b/6a" # Base 15 - Bright Cyan
color15="07/07/08" # Base 07 - Bright White
color16="ff/3d/00" # Base 09
color17="b2/77/01" # Base 0F
color18="ef/ef/e9" # Base 01
color19="de/de/d8" # Base 02
color20="60/61/5d" # Base 04
color21="2f/33/37" # Base 06
color_foreground="23/26/29" # Base 05
color_background="f8/f8/f2" # Base 00


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
  put_template_custom Pg 232629 # foreground
  put_template_custom Ph f8f8f2 # background
  put_template_custom Pi 232629 # bold color
  put_template_custom Pj deded8 # selection color
  put_template_custom Pk 232629 # selected text color
  put_template_custom Pl 232629 # cursor
  put_template_custom Pm f8f8f2 # cursor text
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

export TINTED_COLOR_00_RGB="f8f8f2"
export TINTED_COLOR_01_RGB="efefe9"
export TINTED_COLOR_02_RGB="deded8"
export TINTED_COLOR_03_RGB="c0c0bd"
export TINTED_COLOR_04_RGB="60615d"
export TINTED_COLOR_05_RGB="232629"
export TINTED_COLOR_06_RGB="2f3337"
export TINTED_COLOR_07_RGB="070708"
export TINTED_COLOR_08_RGB="b0151a"
export TINTED_COLOR_09_RGB="ff3d00"
export TINTED_COLOR_0A_RGB="ffb627"
export TINTED_COLOR_0B_RGB="388e3c"
export TINTED_COLOR_0C_RGB="008e8e"
export TINTED_COLOR_0D_RGB="0082c9"
export TINTED_COLOR_0E_RGB="700f98"
export TINTED_COLOR_0F_RGB="b27701"
export TINTED_COLOR_10_RGB="f8f8f2"
export TINTED_COLOR_11_RGB="f8f8f2"
export TINTED_COLOR_12_RGB="880c10"
export TINTED_COLOR_13_RGB="dd9200"
export TINTED_COLOR_14_RGB="1f7523"
export TINTED_COLOR_15_RGB="006b6a"
export TINTED_COLOR_16_RGB="006297"
export TINTED_COLOR_17_RGB="550875"

export TINTED_COLOR_BRIGHT08_RGB="880c10"
export TINTED_COLOR_BRIGHT09_RGB="bf2e00"
export TINTED_COLOR_BRIGHT0A_RGB="dd9200"
export TINTED_COLOR_BRIGHT0B_RGB="1f7523"
export TINTED_COLOR_BRIGHT0C_RGB="006b6a"
export TINTED_COLOR_BRIGHT0D_RGB="006297"
export TINTED_COLOR_BRIGHT0E_RGB="550875"
export TINTED_COLOR_BRIGHT0F_RGB="865901"
