#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Cobalt2
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-cobalt2"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="cobalt2"
fi

color00="12/26/37" # Base 00 - Black
color01="ff/00/00" # Base 08 - Red
color02="37/dd/21" # Base 0B - Green
color03="55/55/ff" # Base 0A - Yellow
color04="14/60/d2" # Base 0D - Blue
color05="ff/00/5d" # Base 0E - Magenta
color06="00/bb/bb" # Base 0C - Cyan
color07="a1/a1/a1" # Base 05 - White
color08="6e/6e/6e" # Base 03 - Bright Black
color09="f4/0d/17" # Base 12 - Bright Red
color10="3b/cf/1d" # Base 14 - Bright Green
color11="ec/c8/09" # Base 13 - Bright Yellow
color12="55/55/ff" # Base 16 - Bright Blue
color13="ff/55/ff" # Base 17 - Bright Magenta
color14="6a/e3/f9" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="fe/e4/09" # Base 09
color17="7f/00/00" # Base 0F
color18="00/00/00" # Base 01
color19="55/55/55" # Base 02
color20="88/88/88" # Base 04
color21="bb/bb/bb" # Base 06
color_foreground="a1/a1/a1" # Base 05
color_background="12/26/37" # Base 00


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
  put_template_custom Pg a1a1a1 # foreground
  put_template_custom Ph 122637 # background
  put_template_custom Pi a1a1a1 # bold color
  put_template_custom Pj 555555 # selection color
  put_template_custom Pk a1a1a1 # selected text color
  put_template_custom Pl a1a1a1 # cursor
  put_template_custom Pm 122637 # cursor text
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

export TINTED_COLOR_00_RGB="122637"
export TINTED_COLOR_01_RGB="000000"
export TINTED_COLOR_02_RGB="555555"
export TINTED_COLOR_03_RGB="6e6e6e"
export TINTED_COLOR_04_RGB="888888"
export TINTED_COLOR_05_RGB="a1a1a1"
export TINTED_COLOR_06_RGB="bbbbbb"
export TINTED_COLOR_07_RGB="ffffff"
export TINTED_COLOR_08_RGB="ff0000"
export TINTED_COLOR_09_RGB="fee409"
export TINTED_COLOR_0A_RGB="5555ff"
export TINTED_COLOR_0B_RGB="37dd21"
export TINTED_COLOR_0C_RGB="00bbbb"
export TINTED_COLOR_0D_RGB="1460d2"
export TINTED_COLOR_0E_RGB="ff005d"
export TINTED_COLOR_0F_RGB="7f0000"
export TINTED_COLOR_10_RGB="383838"
export TINTED_COLOR_11_RGB="1c1c1c"
export TINTED_COLOR_12_RGB="f40d17"
export TINTED_COLOR_13_RGB="ecc809"
export TINTED_COLOR_14_RGB="3bcf1d"
export TINTED_COLOR_15_RGB="6ae3f9"
export TINTED_COLOR_16_RGB="5555ff"
export TINTED_COLOR_17_RGB="ff55ff"

export TINTED_COLOR_BRIGHT08_RGB="f40d17"
export TINTED_COLOR_BRIGHT09_RGB="feeb46"
export TINTED_COLOR_BRIGHT0A_RGB="ecc809"
export TINTED_COLOR_BRIGHT0B_RGB="3bcf1d"
export TINTED_COLOR_BRIGHT0C_RGB="6ae3f9"
export TINTED_COLOR_BRIGHT0D_RGB="5555ff"
export TINTED_COLOR_BRIGHT0E_RGB="ff55ff"
export TINTED_COLOR_BRIGHT0F_RGB="df0000"
