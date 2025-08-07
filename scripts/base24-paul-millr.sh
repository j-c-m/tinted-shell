#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Paul Millr
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-paul-millr"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="paul-millr"
fi

color00="00/00/00" # Base 00 - Black
color01="ff/00/00" # Base 08 - Red
color02="79/ff/0f" # Base 0B - Green
color03="70/9a/ed" # Base 0A - Yellow
color04="38/6b/d7" # Base 0D - Blue
color05="b3/49/be" # Base 0E - Magenta
color06="66/cc/ff" # Base 0C - Cyan
color07="a5/a5/a5" # Base 05 - White
color08="7b/7b/7b" # Base 03 - Bright Black
color09="ff/00/80" # Base 12 - Bright Red
color10="66/ff/66" # Base 14 - Bright Green
color11="f3/d6/4e" # Base 13 - Bright Yellow
color12="70/9a/ed" # Base 16 - Bright Blue
color13="db/67/e6" # Base 17 - Bright Magenta
color14="79/df/f2" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="e7/bf/00" # Base 09
color17="7f/00/00" # Base 0F
color18="2a/2a/2a" # Base 01
color19="66/66/66" # Base 02
color20="90/90/90" # Base 04
color21="bb/bb/bb" # Base 06
color_foreground="a5/a5/a5" # Base 05
color_background="00/00/00" # Base 00


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
  put_template_custom Pg a5a5a5 # foreground
  put_template_custom Ph 000000 # background
  put_template_custom Pi a5a5a5 # bold color
  put_template_custom Pj 666666 # selection color
  put_template_custom Pk a5a5a5 # selected text color
  put_template_custom Pl a5a5a5 # cursor
  put_template_custom Pm 000000 # cursor text
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

export TINTED_COLOR_00_RGB="000000"
export TINTED_COLOR_01_RGB="2a2a2a"
export TINTED_COLOR_02_RGB="666666"
export TINTED_COLOR_03_RGB="7b7b7b"
export TINTED_COLOR_04_RGB="909090"
export TINTED_COLOR_05_RGB="a5a5a5"
export TINTED_COLOR_06_RGB="bbbbbb"
export TINTED_COLOR_07_RGB="ffffff"
export TINTED_COLOR_08_RGB="ff0000"
export TINTED_COLOR_09_RGB="e7bf00"
export TINTED_COLOR_0A_RGB="709aed"
export TINTED_COLOR_0B_RGB="79ff0f"
export TINTED_COLOR_0C_RGB="66ccff"
export TINTED_COLOR_0D_RGB="386bd7"
export TINTED_COLOR_0E_RGB="b349be"
export TINTED_COLOR_0F_RGB="7f0000"
export TINTED_COLOR_10_RGB="444444"
export TINTED_COLOR_11_RGB="222222"
export TINTED_COLOR_12_RGB="ff0080"
export TINTED_COLOR_13_RGB="f3d64e"
export TINTED_COLOR_14_RGB="66ff66"
export TINTED_COLOR_15_RGB="79dff2"
export TINTED_COLOR_16_RGB="709aed"
export TINTED_COLOR_17_RGB="db67e6"

export TINTED_COLOR_BRIGHT08_RGB="ff0080"
export TINTED_COLOR_BRIGHT09_RGB="ffdb2e"
export TINTED_COLOR_BRIGHT0A_RGB="f3d64e"
export TINTED_COLOR_BRIGHT0B_RGB="66ff66"
export TINTED_COLOR_BRIGHT0C_RGB="79dff2"
export TINTED_COLOR_BRIGHT0D_RGB="709aed"
export TINTED_COLOR_BRIGHT0E_RGB="db67e6"
export TINTED_COLOR_BRIGHT0F_RGB="df0000"
