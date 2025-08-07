#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Synth Midnight Terminal Light
# Scheme author: Michaël Ball (http://github.com/michael-ball/)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-synth-midnight-light"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="synth-midnight-light"
fi

color00="dd/df/e0" # Base 00 - Black
color01="b5/3b/50" # Base 08 - Red
color02="06/ea/61" # Base 0B - Green
color03="c9/d3/64" # Base 0A - Yellow
color04="03/ae/ff" # Base 0D - Blue
color05="ea/5c/e2" # Base 0E - Magenta
color06="42/ff/f9" # Base 0C - Cyan
color07="28/29/2a" # Base 05 - White
color08="a3/a5/a6" # Base 03 - Bright Black
color09="93/21/35" # Base 12 - Bright Red
color10="03/b1/49" # Base 14 - Bright Green
color11="b5/c3/27" # Base 13 - Bright Yellow
color12="00/83/c2" # Base 16 - Bright Blue
color13="e0/15/d4" # Base 17 - Bright Magenta
color14="00/f1/e9" # Base 15 - Bright Cyan
color15="05/06/08" # Base 07 - Bright White
color16="ea/77/0d" # Base 09
color17="cd/63/20" # Base 0F
color18="cf/d1/d2" # Base 01
color19="c1/c3/c4" # Base 02
color20="47/48/49" # Base 04
color21="1a/1b/1c" # Base 06
color_foreground="28/29/2a" # Base 05
color_background="dd/df/e0" # Base 00


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
  put_template_custom Pg 28292a # foreground
  put_template_custom Ph dddfe0 # background
  put_template_custom Pi 28292a # bold color
  put_template_custom Pj c1c3c4 # selection color
  put_template_custom Pk 28292a # selected text color
  put_template_custom Pl 28292a # cursor
  put_template_custom Pm dddfe0 # cursor text
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

export TINTED_COLOR_00_RGB="dddfe0"
export TINTED_COLOR_01_RGB="cfd1d2"
export TINTED_COLOR_02_RGB="c1c3c4"
export TINTED_COLOR_03_RGB="a3a5a6"
export TINTED_COLOR_04_RGB="474849"
export TINTED_COLOR_05_RGB="28292a"
export TINTED_COLOR_06_RGB="1a1b1c"
export TINTED_COLOR_07_RGB="050608"
export TINTED_COLOR_08_RGB="b53b50"
export TINTED_COLOR_09_RGB="ea770d"
export TINTED_COLOR_0A_RGB="c9d364"
export TINTED_COLOR_0B_RGB="06ea61"
export TINTED_COLOR_0C_RGB="42fff9"
export TINTED_COLOR_0D_RGB="03aeff"
export TINTED_COLOR_0E_RGB="ea5ce2"
export TINTED_COLOR_0F_RGB="cd6320"
export TINTED_COLOR_10_RGB="dddfe0"
export TINTED_COLOR_11_RGB="dddfe0"
export TINTED_COLOR_12_RGB="932135"
export TINTED_COLOR_13_RGB="b5c327"
export TINTED_COLOR_14_RGB="03b149"
export TINTED_COLOR_15_RGB="00f1e9"
export TINTED_COLOR_16_RGB="0083c2"
export TINTED_COLOR_17_RGB="e015d4"

export TINTED_COLOR_BRIGHT08_RGB="932135"
export TINTED_COLOR_BRIGHT09_RGB="b25907"
export TINTED_COLOR_BRIGHT0A_RGB="b5c327"
export TINTED_COLOR_BRIGHT0B_RGB="03b149"
export TINTED_COLOR_BRIGHT0C_RGB="00f1e9"
export TINTED_COLOR_BRIGHT0D_RGB="0083c2"
export TINTED_COLOR_BRIGHT0E_RGB="e015d4"
export TINTED_COLOR_BRIGHT0F_RGB="a04912"
