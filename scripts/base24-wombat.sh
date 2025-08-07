#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Wombat
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-wombat"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="wombat"
fi

color00="17/17/17" # Base 00 - Black
color01="ff/60/5a" # Base 08 - Red
color02="b1/e8/69" # Base 0B - Green
color03="a5/c7/ff" # Base 0A - Yellow
color04="5d/a9/f6" # Base 0D - Blue
color05="e8/6a/ff" # Base 0E - Magenta
color06="82/ff/f6" # Base 0C - Cyan
color07="b2/af/a6" # Base 05 - White
color08="5c/5b/58" # Base 03 - Bright Black
color09="f5/8b/7f" # Base 12 - Bright Red
color10="dc/f8/8f" # Base 14 - Bright Green
color11="ee/e5/b2" # Base 13 - Bright Yellow
color12="a5/c7/ff" # Base 16 - Bright Blue
color13="dd/aa/ff" # Base 17 - Bright Magenta
color14="b6/ff/f9" # Base 15 - Bright Cyan
color15="fe/ff/fe" # Base 07 - Bright White
color16="ea/d8/9c" # Base 09
color17="7f/30/2d" # Base 0F
color18="00/00/00" # Base 01
color19="31/31/31" # Base 02
color20="87/85/7f" # Base 04
color21="de/d9/ce" # Base 06
color_foreground="b2/af/a6" # Base 05
color_background="17/17/17" # Base 00


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
  put_template_custom Pg b2afa6 # foreground
  put_template_custom Ph 171717 # background
  put_template_custom Pi b2afa6 # bold color
  put_template_custom Pj 313131 # selection color
  put_template_custom Pk b2afa6 # selected text color
  put_template_custom Pl b2afa6 # cursor
  put_template_custom Pm 171717 # cursor text
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

export TINTED_COLOR_00_RGB="171717"
export TINTED_COLOR_01_RGB="000000"
export TINTED_COLOR_02_RGB="313131"
export TINTED_COLOR_03_RGB="5c5b58"
export TINTED_COLOR_04_RGB="87857f"
export TINTED_COLOR_05_RGB="b2afa6"
export TINTED_COLOR_06_RGB="ded9ce"
export TINTED_COLOR_07_RGB="fefffe"
export TINTED_COLOR_08_RGB="ff605a"
export TINTED_COLOR_09_RGB="ead89c"
export TINTED_COLOR_0A_RGB="a5c7ff"
export TINTED_COLOR_0B_RGB="b1e869"
export TINTED_COLOR_0C_RGB="82fff6"
export TINTED_COLOR_0D_RGB="5da9f6"
export TINTED_COLOR_0E_RGB="e86aff"
export TINTED_COLOR_0F_RGB="7f302d"
export TINTED_COLOR_10_RGB="202020"
export TINTED_COLOR_11_RGB="101010"
export TINTED_COLOR_12_RGB="f58b7f"
export TINTED_COLOR_13_RGB="eee5b2"
export TINTED_COLOR_14_RGB="dcf88f"
export TINTED_COLOR_15_RGB="b6fff9"
export TINTED_COLOR_16_RGB="a5c7ff"
export TINTED_COLOR_17_RGB="ddaaff"

export TINTED_COLOR_BRIGHT08_RGB="f58b7f"
export TINTED_COLOR_BRIGHT09_RGB="efe2b5"
export TINTED_COLOR_BRIGHT0A_RGB="eee5b2"
export TINTED_COLOR_BRIGHT0B_RGB="dcf88f"
export TINTED_COLOR_BRIGHT0C_RGB="b6fff9"
export TINTED_COLOR_BRIGHT0D_RGB="a5c7ff"
export TINTED_COLOR_BRIGHT0E_RGB="ddaaff"
export TINTED_COLOR_BRIGHT0F_RGB="bd4844"
