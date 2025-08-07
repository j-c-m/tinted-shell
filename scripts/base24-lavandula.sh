#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Lavandula
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-lavandula"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="lavandula"
fi

color00="05/00/14" # Base 00 - Black
color01="7c/15/25" # Base 08 - Red
color02="33/7e/6f" # Base 0B - Green
color03="8e/86/df" # Base 0A - Yellow
color04="4f/4a/7f" # Base 0D - Blue
color05="59/3f/7e" # Base 0E - Magenta
color06="57/76/7f" # Base 0C - Cyan
color07="64/5d/6f" # Base 05 - White
color08="46/3c/53" # Base 03 - Bright Black
color09="df/50/66" # Base 12 - Bright Red
color10="52/e0/c4" # Base 14 - Bright Green
color11="e0/c2/86" # Base 13 - Bright Yellow
color12="8e/86/df" # Base 16 - Bright Blue
color13="a6/75/df" # Base 17 - Bright Magenta
color14="9a/d3/df" # Base 15 - Bright Cyan
color15="8c/91/fa" # Base 07 - Bright White
color16="7f/6f/49" # Base 09
color17="3e/0a/12" # Base 0F
color18="23/00/45" # Base 01
color19="37/2c/46" # Base 02
color20="55/4d/61" # Base 04
color21="73/6e/7d" # Base 06
color_foreground="64/5d/6f" # Base 05
color_background="05/00/14" # Base 00


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
  put_template_custom Pg 645d6f # foreground
  put_template_custom Ph 050014 # background
  put_template_custom Pi 645d6f # bold color
  put_template_custom Pj 372c46 # selection color
  put_template_custom Pk 645d6f # selected text color
  put_template_custom Pl 645d6f # cursor
  put_template_custom Pm 050014 # cursor text
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

export TINTED_COLOR_00_RGB="050014"
export TINTED_COLOR_01_RGB="230045"
export TINTED_COLOR_02_RGB="372c46"
export TINTED_COLOR_03_RGB="463c53"
export TINTED_COLOR_04_RGB="554d61"
export TINTED_COLOR_05_RGB="645d6f"
export TINTED_COLOR_06_RGB="736e7d"
export TINTED_COLOR_07_RGB="8c91fa"
export TINTED_COLOR_08_RGB="7c1525"
export TINTED_COLOR_09_RGB="7f6f49"
export TINTED_COLOR_0A_RGB="8e86df"
export TINTED_COLOR_0B_RGB="337e6f"
export TINTED_COLOR_0C_RGB="57767f"
export TINTED_COLOR_0D_RGB="4f4a7f"
export TINTED_COLOR_0E_RGB="593f7e"
export TINTED_COLOR_0F_RGB="3e0a12"
export TINTED_COLOR_10_RGB="241d2e"
export TINTED_COLOR_11_RGB="120e17"
export TINTED_COLOR_12_RGB="df5066"
export TINTED_COLOR_13_RGB="e0c286"
export TINTED_COLOR_14_RGB="52e0c4"
export TINTED_COLOR_15_RGB="9ad3df"
export TINTED_COLOR_16_RGB="8e86df"
export TINTED_COLOR_17_RGB="a675df"

export TINTED_COLOR_BRIGHT08_RGB="df5066"
export TINTED_COLOR_BRIGHT09_RGB="aa986b"
export TINTED_COLOR_BRIGHT0A_RGB="e0c286"
export TINTED_COLOR_BRIGHT0B_RGB="52e0c4"
export TINTED_COLOR_BRIGHT0C_RGB="9ad3df"
export TINTED_COLOR_BRIGHT0D_RGB="8e86df"
export TINTED_COLOR_BRIGHT0E_RGB="a675df"
export TINTED_COLOR_BRIGHT0F_RGB="9c192d"
