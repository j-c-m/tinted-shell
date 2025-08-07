#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Later This Evening
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-later-this-evening"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="later-this-evening"
fi

color00="21/21/21" # Base 00 - Black
color01="d3/5a/5f" # Base 08 - Red
color02="af/ba/66" # Base 0B - Green
color03="65/99/d5" # Base 0A - Yellow
color04="a0/b9/d5" # Base 0D - Blue
color05="bf/92/d5" # Base 0E - Magenta
color06="91/be/b6" # Base 0C - Cyan
color07="3e/3f/3f" # Base 05 - White
color08="42/45/45" # Base 03 - Bright Black
color09="d3/22/2e" # Base 12 - Bright Red
color10="aa/bb/39" # Base 14 - Bright Green
color11="e4/bd/39" # Base 13 - Bright Yellow
color12="65/99/d5" # Base 16 - Bright Blue
color13="aa/52/d5" # Base 17 - Bright Magenta
color14="5f/bf/ad" # Base 15 - Bright Cyan
color15="c0/c2/c2" # Base 07 - Bright White
color16="e5/d2/89" # Base 09
color17="69/2d/2f" # Base 0F
color18="2b/2b/2b" # Base 01
color19="44/47/47" # Base 02
color20="40/42/42" # Base 04
color21="3b/3c/3c" # Base 06
color_foreground="3e/3f/3f" # Base 05
color_background="21/21/21" # Base 00


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
  put_template_custom Pg 3e3f3f # foreground
  put_template_custom Ph 212121 # background
  put_template_custom Pi 3e3f3f # bold color
  put_template_custom Pj 444747 # selection color
  put_template_custom Pk 3e3f3f # selected text color
  put_template_custom Pl 3e3f3f # cursor
  put_template_custom Pm 212121 # cursor text
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

export TINTED_COLOR_00_RGB="212121"
export TINTED_COLOR_01_RGB="2b2b2b"
export TINTED_COLOR_02_RGB="444747"
export TINTED_COLOR_03_RGB="424545"
export TINTED_COLOR_04_RGB="404242"
export TINTED_COLOR_05_RGB="3e3f3f"
export TINTED_COLOR_06_RGB="3b3c3c"
export TINTED_COLOR_07_RGB="c0c2c2"
export TINTED_COLOR_08_RGB="d35a5f"
export TINTED_COLOR_09_RGB="e5d289"
export TINTED_COLOR_0A_RGB="6599d5"
export TINTED_COLOR_0B_RGB="afba66"
export TINTED_COLOR_0C_RGB="91beb6"
export TINTED_COLOR_0D_RGB="a0b9d5"
export TINTED_COLOR_0E_RGB="bf92d5"
export TINTED_COLOR_0F_RGB="692d2f"
export TINTED_COLOR_10_RGB="2d2f2f"
export TINTED_COLOR_11_RGB="161717"
export TINTED_COLOR_12_RGB="d3222e"
export TINTED_COLOR_13_RGB="e4bd39"
export TINTED_COLOR_14_RGB="aabb39"
export TINTED_COLOR_15_RGB="5fbfad"
export TINTED_COLOR_16_RGB="6599d5"
export TINTED_COLOR_17_RGB="aa52d5"

export TINTED_COLOR_BRIGHT08_RGB="d3222e"
export TINTED_COLOR_BRIGHT09_RGB="ecdda6"
export TINTED_COLOR_BRIGHT0A_RGB="e4bd39"
export TINTED_COLOR_BRIGHT0B_RGB="aabb39"
export TINTED_COLOR_BRIGHT0C_RGB="5fbfad"
export TINTED_COLOR_BRIGHT0D_RGB="6599d5"
export TINTED_COLOR_BRIGHT0E_RGB="aa52d5"
export TINTED_COLOR_BRIGHT0F_RGB="a8484b"
