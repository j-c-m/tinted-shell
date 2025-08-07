#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Hybrid
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-hybrid"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="hybrid"
fi

color00="16/17/18" # Base 00 - Black
color01="b7/4d/50" # Base 08 - Red
color02="b3/be/5a" # Base 0B - Green
color03="4b/6b/88" # Base 0A - Yellow
color04="6d/90/b0" # Base 0D - Blue
color05="a0/7e/ab" # Base 0E - Magenta
color06="7f/be/b3" # Base 0C - Cyan
color07="8f/91/90" # Base 05 - White
color08="43/44/46" # Base 03 - Bright Black
color09="8c/2d/32" # Base 12 - Bright Red
color10="78/83/31" # Base 14 - Bright Green
color11="e5/89/4f" # Base 13 - Bright Yellow
color12="4b/6b/88" # Base 16 - Bright Blue
color13="6e/4f/79" # Base 17 - Bright Magenta
color14="4d/7b/73" # Base 15 - Bright Cyan
color15="5a/61/69" # Base 07 - Bright White
color16="e3/b5/5e" # Base 09
color17="5b/26/28" # Base 0F
color18="2a/2e/33" # Base 01
color19="1d/1e/21" # Base 02
color20="69/6b/6b" # Base 04
color21="b5/b8/b6" # Base 06
color_foreground="8f/91/90" # Base 05
color_background="16/17/18" # Base 00


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
  put_template_custom Pg 8f9190 # foreground
  put_template_custom Ph 161718 # background
  put_template_custom Pi 8f9190 # bold color
  put_template_custom Pj 1d1e21 # selection color
  put_template_custom Pk 8f9190 # selected text color
  put_template_custom Pl 8f9190 # cursor
  put_template_custom Pm 161718 # cursor text
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

export TINTED_COLOR_00_RGB="161718"
export TINTED_COLOR_01_RGB="2a2e33"
export TINTED_COLOR_02_RGB="1d1e21"
export TINTED_COLOR_03_RGB="434446"
export TINTED_COLOR_04_RGB="696b6b"
export TINTED_COLOR_05_RGB="8f9190"
export TINTED_COLOR_06_RGB="b5b8b6"
export TINTED_COLOR_07_RGB="5a6169"
export TINTED_COLOR_08_RGB="b74d50"
export TINTED_COLOR_09_RGB="e3b55e"
export TINTED_COLOR_0A_RGB="4b6b88"
export TINTED_COLOR_0B_RGB="b3be5a"
export TINTED_COLOR_0C_RGB="7fbeb3"
export TINTED_COLOR_0D_RGB="6d90b0"
export TINTED_COLOR_0E_RGB="a07eab"
export TINTED_COLOR_0F_RGB="5b2628"
export TINTED_COLOR_10_RGB="131416"
export TINTED_COLOR_11_RGB="090a0b"
export TINTED_COLOR_12_RGB="8c2d32"
export TINTED_COLOR_13_RGB="e5894f"
export TINTED_COLOR_14_RGB="788331"
export TINTED_COLOR_15_RGB="4d7b73"
export TINTED_COLOR_16_RGB="4b6b88"
export TINTED_COLOR_17_RGB="6e4f79"

export TINTED_COLOR_BRIGHT08_RGB="8c2d32"
export TINTED_COLOR_BRIGHT09_RGB="eac886"
export TINTED_COLOR_BRIGHT0A_RGB="e5894f"
export TINTED_COLOR_BRIGHT0B_RGB="788331"
export TINTED_COLOR_BRIGHT0C_RGB="4d7b73"
export TINTED_COLOR_BRIGHT0D_RGB="4b6b88"
export TINTED_COLOR_BRIGHT0E_RGB="6e4f79"
export TINTED_COLOR_BRIGHT0F_RGB="9e4246"
