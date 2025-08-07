#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Mission Brogue
# Scheme author: Thomas Leon Highbaugh
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-mission-brogue"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="mission-brogue"
fi

color00="28/31/39" # Base 00 - Black
color01="ef/a9/a9" # Base 08 - Red
color02="8c/d4/b0" # Base 0B - Green
color03="e0/b8/8a" # Base 0A - Yellow
color04="a2/c5/fd" # Base 0D - Blue
color05="cc/b7/db" # Base 0E - Magenta
color06="93/df/ec" # Base 0C - Cyan
color07="93/a5/b4" # Base 05 - White
color08="60/77/8a" # Base 03 - Bright Black
color09="f6/bf/bf" # Base 12 - Bright Red
color10="b5/e0/90" # Base 14 - Bright Green
color11="ff/f0/b2" # Base 13 - Bright Yellow
color12="c3/d9/fd" # Base 16 - Bright Blue
color13="e3/c3/e6" # Base 17 - Bright Magenta
color14="b2/f0/fd" # Base 15 - Bright Cyan
color15="e7/eb/ee" # Base 07 - Bright White
color16="f2/db/78" # Base 09
color17="8e/9e/cb" # Base 0F
color18="3b/49/54" # Base 01
color19="4d/60/6f" # Base 02
color20="78/8e/a1" # Base 04
color21="ab/b9/c4" # Base 06
color_foreground="93/a5/b4" # Base 05
color_background="28/31/39" # Base 00


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
  put_template_custom Pg 93a5b4 # foreground
  put_template_custom Ph 283139 # background
  put_template_custom Pi 93a5b4 # bold color
  put_template_custom Pj 4d606f # selection color
  put_template_custom Pk 93a5b4 # selected text color
  put_template_custom Pl 93a5b4 # cursor
  put_template_custom Pm 283139 # cursor text
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

export TINTED_COLOR_00_RGB="283139"
export TINTED_COLOR_01_RGB="3b4954"
export TINTED_COLOR_02_RGB="4d606f"
export TINTED_COLOR_03_RGB="60778a"
export TINTED_COLOR_04_RGB="788ea1"
export TINTED_COLOR_05_RGB="93a5b4"
export TINTED_COLOR_06_RGB="abb9c4"
export TINTED_COLOR_07_RGB="e7ebee"
export TINTED_COLOR_08_RGB="efa9a9"
export TINTED_COLOR_09_RGB="f2db78"
export TINTED_COLOR_0A_RGB="e0b88a"
export TINTED_COLOR_0B_RGB="8cd4b0"
export TINTED_COLOR_0C_RGB="93dfec"
export TINTED_COLOR_0D_RGB="a2c5fd"
export TINTED_COLOR_0E_RGB="ccb7db"
export TINTED_COLOR_0F_RGB="8e9ecb"
export TINTED_COLOR_10_RGB="3e3e3b"
export TINTED_COLOR_11_RGB="79797a"
export TINTED_COLOR_12_RGB="f6bfbf"
export TINTED_COLOR_13_RGB="fff0b2"
export TINTED_COLOR_14_RGB="b5e090"
export TINTED_COLOR_15_RGB="b2f0fd"
export TINTED_COLOR_16_RGB="c3d9fd"
export TINTED_COLOR_17_RGB="e3c3e6"

export TINTED_COLOR_BRIGHT08_RGB="f6bfbf"
export TINTED_COLOR_BRIGHT09_RGB="f5e49a"
export TINTED_COLOR_BRIGHT0A_RGB="fff0b2"
export TINTED_COLOR_BRIGHT0B_RGB="b5e090"
export TINTED_COLOR_BRIGHT0C_RGB="b2f0fd"
export TINTED_COLOR_BRIGHT0D_RGB="c3d9fd"
export TINTED_COLOR_BRIGHT0E_RGB="e3c3e6"
export TINTED_COLOR_BRIGHT0F_RGB="aab6d8"
