#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Framer
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-framer"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="framer"
fi

color00="11/11/11" # Base 00 - Black
color01="ff/55/55" # Base 08 - Red
color02="98/ec/65" # Base 0B - Green
color03="33/bb/ff" # Base 0A - Yellow
color04="00/aa/ff" # Base 0D - Blue
color05="aa/88/ff" # Base 0E - Magenta
color06="88/dd/ff" # Base 0C - Cyan
color07="a9/a9/a9" # Base 05 - White
color08="63/63/63" # Base 03 - Bright Black
color09="ff/88/88" # Base 12 - Bright Red
color10="b6/f2/92" # Base 14 - Bright Green
color11="ff/d9/66" # Base 13 - Bright Yellow
color12="33/bb/ff" # Base 16 - Bright Blue
color13="ce/bb/ff" # Base 17 - Bright Magenta
color14="bb/ec/ff" # Base 15 - Bright Cyan
color15="ff/ff/ff" # Base 07 - Bright White
color16="ff/cc/33" # Base 09
color17="7f/2a/2a" # Base 0F
color18="14/14/14" # Base 01
color19="41/41/41" # Base 02
color20="86/86/86" # Base 04
color21="cc/cc/cc" # Base 06
color_foreground="a9/a9/a9" # Base 05
color_background="11/11/11" # Base 00


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
  put_template_custom Pg a9a9a9 # foreground
  put_template_custom Ph 111111 # background
  put_template_custom Pi a9a9a9 # bold color
  put_template_custom Pj 414141 # selection color
  put_template_custom Pk a9a9a9 # selected text color
  put_template_custom Pl a9a9a9 # cursor
  put_template_custom Pm 111111 # cursor text
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

export TINTED_COLOR_00_RGB="111111"
export TINTED_COLOR_01_RGB="141414"
export TINTED_COLOR_02_RGB="414141"
export TINTED_COLOR_03_RGB="636363"
export TINTED_COLOR_04_RGB="868686"
export TINTED_COLOR_05_RGB="a9a9a9"
export TINTED_COLOR_06_RGB="cccccc"
export TINTED_COLOR_07_RGB="ffffff"
export TINTED_COLOR_08_RGB="ff5555"
export TINTED_COLOR_09_RGB="ffcc33"
export TINTED_COLOR_0A_RGB="33bbff"
export TINTED_COLOR_0B_RGB="98ec65"
export TINTED_COLOR_0C_RGB="88ddff"
export TINTED_COLOR_0D_RGB="00aaff"
export TINTED_COLOR_0E_RGB="aa88ff"
export TINTED_COLOR_0F_RGB="7f2a2a"
export TINTED_COLOR_10_RGB="2b2b2b"
export TINTED_COLOR_11_RGB="151515"
export TINTED_COLOR_12_RGB="ff8888"
export TINTED_COLOR_13_RGB="ffd966"
export TINTED_COLOR_14_RGB="b6f292"
export TINTED_COLOR_15_RGB="bbecff"
export TINTED_COLOR_16_RGB="33bbff"
export TINTED_COLOR_17_RGB="cebbff"

export TINTED_COLOR_BRIGHT08_RGB="ff8888"
export TINTED_COLOR_BRIGHT09_RGB="ffd966"
export TINTED_COLOR_BRIGHT0A_RGB="ffd966"
export TINTED_COLOR_BRIGHT0B_RGB="b6f292"
export TINTED_COLOR_BRIGHT0C_RGB="bbecff"
export TINTED_COLOR_BRIGHT0D_RGB="33bbff"
export TINTED_COLOR_BRIGHT0E_RGB="cebbff"
export TINTED_COLOR_BRIGHT0F_RGB="bf3f3f"
