#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Idea
# Scheme author: FredHappyface (https://github.com/fredHappyface)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base24-idea"

if [ "base24" = "base16" ]; then
  export BASE16_THEME="idea"
fi

color00="20/20/20" # Base 00 - Black
color01="fb/52/55" # Base 08 - Red
color02="98/b6/1b" # Base 0B - Green
color03="6c/9b/ed" # Base 0A - Yellow
color04="43/7e/e6" # Base 0D - Blue
color05="9d/73/b0" # Base 0E - Magenta
color06="24/88/86" # Base 0C - Cyan
color07="51/51/51" # Base 05 - White
color08="c5/c5/c5" # Base 03 - Bright Black
color09="fc/6f/72" # Base 12 - Bright Red
color10="98/b6/1b" # Base 14 - Bright Green
color11="ff/ff/0a" # Base 13 - Bright Yellow
color12="6c/9b/ed" # Base 16 - Bright Blue
color13="fc/7e/fe" # Base 17 - Bright Magenta
color14="24/88/86" # Base 15 - Bright Cyan
color15="17/17/17" # Base 07 - Bright White
color16="cc/b3/43" # Base 09
color17="7d/29/2a" # Base 0F
color18="ac/ac/ac" # Base 01
color19="ff/fe/fe" # Base 02
color20="8b/8b/8b" # Base 04
color21="17/17/17" # Base 06
color_foreground="51/51/51" # Base 05
color_background="20/20/20" # Base 00


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
  put_template_custom Pg 515151 # foreground
  put_template_custom Ph 202020 # background
  put_template_custom Pi 515151 # bold color
  put_template_custom Pj fffefe # selection color
  put_template_custom Pk 515151 # selected text color
  put_template_custom Pl 515151 # cursor
  put_template_custom Pm 202020 # cursor text
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

export TINTED_COLOR_00_RGB="202020"
export TINTED_COLOR_01_RGB="acacac"
export TINTED_COLOR_02_RGB="fffefe"
export TINTED_COLOR_03_RGB="c5c5c5"
export TINTED_COLOR_04_RGB="8b8b8b"
export TINTED_COLOR_05_RGB="515151"
export TINTED_COLOR_06_RGB="171717"
export TINTED_COLOR_07_RGB="171717"
export TINTED_COLOR_08_RGB="fb5255"
export TINTED_COLOR_09_RGB="ccb343"
export TINTED_COLOR_0A_RGB="6c9bed"
export TINTED_COLOR_0B_RGB="98b61b"
export TINTED_COLOR_0C_RGB="248886"
export TINTED_COLOR_0D_RGB="437ee6"
export TINTED_COLOR_0E_RGB="9d73b0"
export TINTED_COLOR_0F_RGB="7d292a"
export TINTED_COLOR_10_RGB="aaa9a9"
export TINTED_COLOR_11_RGB="555454"
export TINTED_COLOR_12_RGB="fc6f72"
export TINTED_COLOR_13_RGB="ffff0a"
export TINTED_COLOR_14_RGB="98b61b"
export TINTED_COLOR_15_RGB="248886"
export TINTED_COLOR_16_RGB="6c9bed"
export TINTED_COLOR_17_RGB="fc7efe"

export TINTED_COLOR_BRIGHT08_RGB="fc6f72"
export TINTED_COLOR_BRIGHT09_RGB="d9c672"
export TINTED_COLOR_BRIGHT0A_RGB="ffff0a"
export TINTED_COLOR_BRIGHT0B_RGB="98b61b"
export TINTED_COLOR_BRIGHT0C_RGB="248886"
export TINTED_COLOR_BRIGHT0D_RGB="6c9bed"
export TINTED_COLOR_BRIGHT0E_RGB="fc7efe"
export TINTED_COLOR_BRIGHT0F_RGB="be3e40"
