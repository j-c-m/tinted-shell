#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Earthsong
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-earthsong"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="earthsong"
fi

color00="28/24/20" # Base 00 - Black
color01="c8/41/34" # Base 08 - Red
color02="84/c4/4b" # Base 0B - Green
color03="5e/d9/ff" # Base 0A - Yellow
color04="13/97/b9" # Base 0D - Blue
color05="d0/62/3c" # Base 0E - Magenta
color06="4f/94/52" # Base 0C - Cyan
color07="c5/ab/93" # Base 05 - White
color08="85/77/69" # Base 03 - Bright Black
color09="ff/64/59" # Base 12 - Bright Red
color10="97/e0/35" # Base 14 - Bright Green
color11="df/d5/61" # Base 13 - Bright Yellow
color12="5e/d9/ff" # Base 16 - Bright Blue
color13="ff/91/68" # Base 17 - Bright Magenta
color14="83/ef/88" # Base 15 - Bright Cyan
color15="f6/f6/ec" # Base 07 - Bright White
color16="f4/ae/2e" # Base 09
color17="64/20/1a" # Base 0F
color18="11/14/17" # Base 01
color19="66/5e/54" # Base 02
color20="a5/91/7e" # Base 04
color21="e5/c5/a9" # Base 06
color_foreground="c5/ab/93" # Base 05
color_background="28/24/20" # Base 00


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
  put_template_custom Pg c5ab93 # foreground
  put_template_custom Ph 282420 # background
  put_template_custom Pi c5ab93 # bold color
  put_template_custom Pj 665e54 # selection color
  put_template_custom Pk c5ab93 # selected text color
  put_template_custom Pl c5ab93 # cursor
  put_template_custom Pm 282420 # cursor text
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

export TINTED_COLOR_00_RGB="282420"
export TINTED_COLOR_01_RGB="111417"
export TINTED_COLOR_02_RGB="665e54"
export TINTED_COLOR_03_RGB="857769"
export TINTED_COLOR_04_RGB="a5917e"
export TINTED_COLOR_05_RGB="c5ab93"
export TINTED_COLOR_06_RGB="e5c5a9"
export TINTED_COLOR_07_RGB="f6f6ec"
export TINTED_COLOR_08_RGB="c84134"
export TINTED_COLOR_09_RGB="f4ae2e"
export TINTED_COLOR_0A_RGB="5ed9ff"
export TINTED_COLOR_0B_RGB="84c44b"
export TINTED_COLOR_0C_RGB="4f9452"
export TINTED_COLOR_0D_RGB="1397b9"
export TINTED_COLOR_0E_RGB="d0623c"
export TINTED_COLOR_0F_RGB="64201a"
export TINTED_COLOR_10_RGB="443e38"
export TINTED_COLOR_11_RGB="221f1c"
export TINTED_COLOR_12_RGB="ff6459"
export TINTED_COLOR_13_RGB="dfd561"
export TINTED_COLOR_14_RGB="97e035"
export TINTED_COLOR_15_RGB="83ef88"
export TINTED_COLOR_16_RGB="5ed9ff"
export TINTED_COLOR_17_RGB="ff9168"

export TINTED_COLOR_BRIGHT08_RGB="ff6459"
export TINTED_COLOR_BRIGHT09_RGB="f7c262"
export TINTED_COLOR_BRIGHT0A_RGB="dfd561"
export TINTED_COLOR_BRIGHT0B_RGB="97e035"
export TINTED_COLOR_BRIGHT0C_RGB="83ef88"
export TINTED_COLOR_BRIGHT0D_RGB="5ed9ff"
export TINTED_COLOR_BRIGHT0E_RGB="ff9168"
export TINTED_COLOR_BRIGHT0F_RGB="b0382e"
