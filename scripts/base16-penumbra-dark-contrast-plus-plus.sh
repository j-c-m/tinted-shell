#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Penumbra Dark Contrast Plus Plus
# Scheme author: Zachary Weiss (https://github.com/zacharyweiss)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-penumbra-dark-contrast-plus-plus"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="penumbra-dark-contrast-plus-plus"
fi

color00="0d/0f/13" # Base 00 - Black
color01="f5/8c/81" # Base 08 - Red
color02="54/c7/94" # Base 0B - Green
color03="a9/b8/52" # Base 0A - Yellow
color04="6e/b2/fd" # Base 0D - Blue
color05="b6/9c/f6" # Base 0E - Magenta
color06="00/c4/d7" # Base 0C - Cyan
color07="de/de/de" # Base 05 - White
color08="63/63/63" # Base 03 - Bright Black
color09="f8/a9/a1" # Base 12 - Bright Red
color10="7f/d5/af" # Base 14 - Bright Green
color11="bf/ca/7d" # Base 13 - Bright Yellow
color12="92/c5/fd" # Base 16 - Bright Blue
color13="c8/b5/f8" # Base 17 - Bright Magenta
color14="22/eb/ff" # Base 15 - Bright Cyan
color15="ff/fd/fb" # Base 07 - Bright White
color16="e0/9f/47" # Base 09
color17="e5/8c/c5" # Base 0F
color18="18/1b/1f" # Base 01
color19="3e/40/44" # Base 02
color20="ae/ae/ae" # Base 04
color21="ff/f7/ed" # Base 06
color_foreground="de/de/de" # Base 05
color_background="0d/0f/13" # Base 00


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
  put_template_custom Pg dedede # foreground
  put_template_custom Ph 0d0f13 # background
  put_template_custom Pi dedede # bold color
  put_template_custom Pj 3e4044 # selection color
  put_template_custom Pk dedede # selected text color
  put_template_custom Pl dedede # cursor
  put_template_custom Pm 0d0f13 # cursor text
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

export TINTED_COLOR_00_RGB="0d0f13"
export TINTED_COLOR_01_RGB="181b1f"
export TINTED_COLOR_02_RGB="3e4044"
export TINTED_COLOR_03_RGB="636363"
export TINTED_COLOR_04_RGB="aeaeae"
export TINTED_COLOR_05_RGB="dedede"
export TINTED_COLOR_06_RGB="fff7ed"
export TINTED_COLOR_07_RGB="fffdfb"
export TINTED_COLOR_08_RGB="f58c81"
export TINTED_COLOR_09_RGB="e09f47"
export TINTED_COLOR_0A_RGB="a9b852"
export TINTED_COLOR_0B_RGB="54c794"
export TINTED_COLOR_0C_RGB="00c4d7"
export TINTED_COLOR_0D_RGB="6eb2fd"
export TINTED_COLOR_0E_RGB="b69cf6"
export TINTED_COLOR_0F_RGB="e58cc5"
export TINTED_COLOR_10_RGB="0d0f13"
export TINTED_COLOR_11_RGB="0d0f13"
export TINTED_COLOR_12_RGB="f8a9a1"
export TINTED_COLOR_13_RGB="bfca7d"
export TINTED_COLOR_14_RGB="7fd5af"
export TINTED_COLOR_15_RGB="22ebff"
export TINTED_COLOR_16_RGB="92c5fd"
export TINTED_COLOR_17_RGB="c8b5f8"

export TINTED_COLOR_BRIGHT08_RGB="f8a9a1"
export TINTED_COLOR_BRIGHT09_RGB="e8b775"
export TINTED_COLOR_BRIGHT0A_RGB="bfca7d"
export TINTED_COLOR_BRIGHT0B_RGB="7fd5af"
export TINTED_COLOR_BRIGHT0C_RGB="22ebff"
export TINTED_COLOR_BRIGHT0D_RGB="92c5fd"
export TINTED_COLOR_BRIGHT0E_RGB="c8b5f8"
export TINTED_COLOR_BRIGHT0F_RGB="eca9d4"
