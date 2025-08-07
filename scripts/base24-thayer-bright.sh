#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Thayer Bright
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-thayer-bright"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="thayer-bright"
fi

color00="1b/1d/1e" # Base 00 - Black
color01="f9/26/72" # Base 08 - Red
color02="4d/f7/40" # Base 0B - Green
color03="3f/78/ff" # Base 0A - Yellow
color04="26/56/d6" # Base 0D - Blue
color05="8c/54/fe" # Base 0E - Magenta
color06="37/c8/b4" # Base 0C - Cyan
color07="ad/ad/a9" # Base 05 - White
color08="6f/71/70" # Base 03 - Bright Black
color09="ff/59/95" # Base 12 - Bright Red
color10="b6/e3/54" # Base 14 - Bright Green
color11="fe/ed/6c" # Base 13 - Bright Yellow
color12="3f/78/ff" # Base 16 - Bright Blue
color13="9e/6f/fe" # Base 17 - Bright Magenta
color14="23/ce/d4" # Base 15 - Bright Cyan
color15="f8/f8/f2" # Base 07 - Bright White
color16="f3/fd/21" # Base 09
color17="7c/13/39" # Base 0F
color18="1b/1d/1e" # Base 01
color19="50/53/54" # Base 02
color20="8e/8f/8d" # Base 04
color21="cc/cc/c6" # Base 06
color_foreground="ad/ad/a9" # Base 05
color_background="1b/1d/1e" # Base 00


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
  put_template_custom Pg adada9 # foreground
  put_template_custom Ph 1b1d1e # background
  put_template_custom Pi adada9 # bold color
  put_template_custom Pj 505354 # selection color
  put_template_custom Pk adada9 # selected text color
  put_template_custom Pl adada9 # cursor
  put_template_custom Pm 1b1d1e # cursor text
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

export TINTED_COLOR_00_RGB="1b1d1e"
export TINTED_COLOR_01_RGB="1b1d1e"
export TINTED_COLOR_02_RGB="505354"
export TINTED_COLOR_03_RGB="6f7170"
export TINTED_COLOR_04_RGB="8e8f8d"
export TINTED_COLOR_05_RGB="adada9"
export TINTED_COLOR_06_RGB="ccccc6"
export TINTED_COLOR_07_RGB="f8f8f2"
export TINTED_COLOR_08_RGB="f92672"
export TINTED_COLOR_09_RGB="f3fd21"
export TINTED_COLOR_0A_RGB="3f78ff"
export TINTED_COLOR_0B_RGB="4df740"
export TINTED_COLOR_0C_RGB="37c8b4"
export TINTED_COLOR_0D_RGB="2656d6"
export TINTED_COLOR_0E_RGB="8c54fe"
export TINTED_COLOR_0F_RGB="7c1339"
export TINTED_COLOR_10_RGB="353738"
export TINTED_COLOR_11_RGB="1a1b1c"
export TINTED_COLOR_12_RGB="ff5995"
export TINTED_COLOR_13_RGB="feed6c"
export TINTED_COLOR_14_RGB="b6e354"
export TINTED_COLOR_15_RGB="23ced4"
export TINTED_COLOR_16_RGB="3f78ff"
export TINTED_COLOR_17_RGB="9e6ffe"

export TINTED_COLOR_BRIGHT08_RGB="ff5995"
export TINTED_COLOR_BRIGHT09_RGB="f6fe58"
export TINTED_COLOR_BRIGHT0A_RGB="feed6c"
export TINTED_COLOR_BRIGHT0B_RGB="b6e354"
export TINTED_COLOR_BRIGHT0C_RGB="23ced4"
export TINTED_COLOR_BRIGHT0D_RGB="3f78ff"
export TINTED_COLOR_BRIGHT0E_RGB="9e6ffe"
export TINTED_COLOR_BRIGHT0F_RGB="cc1f5e"
