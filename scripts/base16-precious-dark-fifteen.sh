#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Precious Dark Fifteen
# Scheme author: 4lex4 &lt;4lex49@zoho.com&gt;
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-precious-dark-fifteen"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="precious-dark-fifteen"
fi

color00="23/26/2b" # Base 00 - Black
color01="ff/87/82" # Base 08 - Red
color02="95/b6/59" # Base 0B - Green
color03="cf/a5/46" # Base 0A - Yellow
color04="66/b0/ef" # Base 0D - Blue
color05="b7/99/ff" # Base 0E - Magenta
color06="42/bd/a7" # Base 0C - Cyan
color07="ba/b9/b6" # Base 05 - White
color08="89/89/89" # Base 03 - Bright Black
color09="ff/a5/a1" # Base 12 - Bright Red
color10="b0/c8/82" # Base 14 - Bright Green
color11="db/bc/74" # Base 13 - Bright Yellow
color12="8c/c4/f3" # Base 16 - Bright Blue
color13="c9/b3/ff" # Base 17 - Bright Magenta
color14="71/ce/bd" # Base 15 - Bright Cyan
color15="ba/b9/b6" # Base 07 - Bright White
color16="e9/98/57" # Base 09
color17="f3/82/d8" # Base 0F
color18="30/33/37" # Base 01
color19="3e/40/44" # Base 02
color20="ab/aa/a8" # Base 04
color21="ba/b9/b6" # Base 06
color_foreground="ba/b9/b6" # Base 05
color_background="23/26/2b" # Base 00


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
  put_template_custom Pg bab9b6 # foreground
  put_template_custom Ph 23262b # background
  put_template_custom Pi bab9b6 # bold color
  put_template_custom Pj 3e4044 # selection color
  put_template_custom Pk bab9b6 # selected text color
  put_template_custom Pl bab9b6 # cursor
  put_template_custom Pm 23262b # cursor text
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

export TINTED_COLOR_00_RGB="23262b"
export TINTED_COLOR_01_RGB="303337"
export TINTED_COLOR_02_RGB="3e4044"
export TINTED_COLOR_03_RGB="898989"
export TINTED_COLOR_04_RGB="abaaa8"
export TINTED_COLOR_05_RGB="bab9b6"
export TINTED_COLOR_06_RGB="bab9b6"
export TINTED_COLOR_07_RGB="bab9b6"
export TINTED_COLOR_08_RGB="ff8782"
export TINTED_COLOR_09_RGB="e99857"
export TINTED_COLOR_0A_RGB="cfa546"
export TINTED_COLOR_0B_RGB="95b659"
export TINTED_COLOR_0C_RGB="42bda7"
export TINTED_COLOR_0D_RGB="66b0ef"
export TINTED_COLOR_0E_RGB="b799ff"
export TINTED_COLOR_0F_RGB="f382d8"
export TINTED_COLOR_10_RGB="23262b"
export TINTED_COLOR_11_RGB="23262b"
export TINTED_COLOR_12_RGB="ffa5a1"
export TINTED_COLOR_13_RGB="dbbc74"
export TINTED_COLOR_14_RGB="b0c882"
export TINTED_COLOR_15_RGB="71cebd"
export TINTED_COLOR_16_RGB="8cc4f3"
export TINTED_COLOR_17_RGB="c9b3ff"

export TINTED_COLOR_BRIGHT08_RGB="ffa5a1"
export TINTED_COLOR_BRIGHT09_RGB="efb281"
export TINTED_COLOR_BRIGHT0A_RGB="dbbc74"
export TINTED_COLOR_BRIGHT0B_RGB="b0c882"
export TINTED_COLOR_BRIGHT0C_RGB="71cebd"
export TINTED_COLOR_BRIGHT0D_RGB="8cc4f3"
export TINTED_COLOR_BRIGHT0E_RGB="c9b3ff"
export TINTED_COLOR_BRIGHT0F_RGB="f6a1e2"
