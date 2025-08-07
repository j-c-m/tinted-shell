#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Fideloper
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-fideloper"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="fideloper"
fi

color00="28/2f/32" # Base 00 - Black
color01="ca/1d/2c" # Base 08 - Red
color02="ed/b7/ab" # Base 0B - Green
color03="7c/84/c4" # Base 0A - Yellow
color04="2e/78/c1" # Base 0D - Blue
color05="c0/22/6e" # Base 0E - Magenta
color06="30/91/85" # Base 0C - Cyan
color07="b1/b1/a3" # Base 05 - White
color08="41/50/50" # Base 03 - Bright Black
color09="d3/5f/5a" # Base 12 - Bright Red
color10="d3/5f/5a" # Base 14 - Bright Green
color11="a8/65/71" # Base 13 - Bright Yellow
color12="7c/84/c4" # Base 16 - Bright Blue
color13="5b/5d/b2" # Base 17 - Bright Magenta
color14="81/90/8f" # Base 15 - Bright Cyan
color15="fc/f4/de" # Base 07 - Bright White
color16="b7/aa/9a" # Base 09
color17="65/0e/16" # Base 0F
color18="28/2f/32" # Base 01
color19="09/20/27" # Base 02
color20="79/81/7a" # Base 04
color21="e9/e2/cd" # Base 06
color_foreground="b1/b1/a3" # Base 05
color_background="28/2f/32" # Base 00


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
  put_template_custom Pg b1b1a3 # foreground
  put_template_custom Ph 282f32 # background
  put_template_custom Pi b1b1a3 # bold color
  put_template_custom Pj 092027 # selection color
  put_template_custom Pk b1b1a3 # selected text color
  put_template_custom Pl b1b1a3 # cursor
  put_template_custom Pm 282f32 # cursor text
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

export TINTED_COLOR_00_RGB="282f32"
export TINTED_COLOR_01_RGB="282f32"
export TINTED_COLOR_02_RGB="092027"
export TINTED_COLOR_03_RGB="415050"
export TINTED_COLOR_04_RGB="79817a"
export TINTED_COLOR_05_RGB="b1b1a3"
export TINTED_COLOR_06_RGB="e9e2cd"
export TINTED_COLOR_07_RGB="fcf4de"
export TINTED_COLOR_08_RGB="ca1d2c"
export TINTED_COLOR_09_RGB="b7aa9a"
export TINTED_COLOR_0A_RGB="7c84c4"
export TINTED_COLOR_0B_RGB="edb7ab"
export TINTED_COLOR_0C_RGB="309185"
export TINTED_COLOR_0D_RGB="2e78c1"
export TINTED_COLOR_0E_RGB="c0226e"
export TINTED_COLOR_0F_RGB="650e16"
export TINTED_COLOR_10_RGB="06151a"
export TINTED_COLOR_11_RGB="030a0d"
export TINTED_COLOR_12_RGB="d35f5a"
export TINTED_COLOR_13_RGB="a86571"
export TINTED_COLOR_14_RGB="d35f5a"
export TINTED_COLOR_15_RGB="81908f"
export TINTED_COLOR_16_RGB="7c84c4"
export TINTED_COLOR_17_RGB="5b5db2"

export TINTED_COLOR_BRIGHT08_RGB="d35f5a"
export TINTED_COLOR_BRIGHT09_RGB="c9bfb3"
export TINTED_COLOR_BRIGHT0A_RGB="a86571"
export TINTED_COLOR_BRIGHT0B_RGB="d35f5a"
export TINTED_COLOR_BRIGHT0C_RGB="81908f"
export TINTED_COLOR_BRIGHT0D_RGB="7c84c4"
export TINTED_COLOR_BRIGHT0E_RGB="5b5db2"
export TINTED_COLOR_BRIGHT0F_RGB="bc1a29"
