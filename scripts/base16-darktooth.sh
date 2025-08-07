#!/usr/bin/env sh
# tinted-shell (https://github.com/tinted-theming/tinted-shell)
# Scheme name: Darktooth
# Scheme author: Jason Milkins (https://github.com/jasonm23)
# Template author: Tinted Theming (https://github.com/tinted-theming)
export TINTED_THEME="base16-darktooth"

if [ "base16" = "base16" ]; then
  export BASE16_THEME="darktooth"
fi

color00="1d/20/21" # Base 00 - Black
color01="fb/54/3f" # Base 08 - Red
color02="95/c0/85" # Base 0B - Green
color03="fa/c0/3b" # Base 0A - Yellow
color04="0d/66/78" # Base 0D - Blue
color05="8f/46/73" # Base 0E - Magenta
color06="8b/a5/9b" # Base 0C - Cyan
color07="a8/99/84" # Base 05 - White
color08="66/5c/54" # Base 03 - Bright Black
color09="fc/7f/6f" # Base 12 - Bright Red
color10="b0/d0/a4" # Base 14 - Bright Green
color11="fb/d0/6c" # Base 13 - Bright Yellow
color12="16/ae/cd" # Base 16 - Bright Blue
color13="b6/69/99" # Base 17 - Bright Magenta
color14="a8/bc/b4" # Base 15 - Bright Cyan
color15="fd/f4/c1" # Base 07 - Bright White
color16="fe/86/25" # Base 09
color17="a8/73/22" # Base 0F
color18="32/30/2f" # Base 01
color19="50/49/45" # Base 02
color20="92/83/74" # Base 04
color21="d5/c4/a1" # Base 06
color_foreground="a8/99/84" # Base 05
color_background="1d/20/21" # Base 00


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
  put_template_custom Pg a89984 # foreground
  put_template_custom Ph 1d2021 # background
  put_template_custom Pi a89984 # bold color
  put_template_custom Pj 504945 # selection color
  put_template_custom Pk a89984 # selected text color
  put_template_custom Pl a89984 # cursor
  put_template_custom Pm 1d2021 # cursor text
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

export TINTED_COLOR_00_RGB="1d2021"
export TINTED_COLOR_01_RGB="32302f"
export TINTED_COLOR_02_RGB="504945"
export TINTED_COLOR_03_RGB="665c54"
export TINTED_COLOR_04_RGB="928374"
export TINTED_COLOR_05_RGB="a89984"
export TINTED_COLOR_06_RGB="d5c4a1"
export TINTED_COLOR_07_RGB="fdf4c1"
export TINTED_COLOR_08_RGB="fb543f"
export TINTED_COLOR_09_RGB="fe8625"
export TINTED_COLOR_0A_RGB="fac03b"
export TINTED_COLOR_0B_RGB="95c085"
export TINTED_COLOR_0C_RGB="8ba59b"
export TINTED_COLOR_0D_RGB="0d6678"
export TINTED_COLOR_0E_RGB="8f4673"
export TINTED_COLOR_0F_RGB="a87322"
export TINTED_COLOR_10_RGB="1d2021"
export TINTED_COLOR_11_RGB="1d2021"
export TINTED_COLOR_12_RGB="fc7f6f"
export TINTED_COLOR_13_RGB="fbd06c"
export TINTED_COLOR_14_RGB="b0d0a4"
export TINTED_COLOR_15_RGB="a8bcb4"
export TINTED_COLOR_16_RGB="16aecd"
export TINTED_COLOR_17_RGB="b66999"

export TINTED_COLOR_BRIGHT08_RGB="fc7f6f"
export TINTED_COLOR_BRIGHT09_RGB="fea45b"
export TINTED_COLOR_BRIGHT0A_RGB="fbd06c"
export TINTED_COLOR_BRIGHT0B_RGB="b0d0a4"
export TINTED_COLOR_BRIGHT0C_RGB="a8bcb4"
export TINTED_COLOR_BRIGHT0D_RGB="16aecd"
export TINTED_COLOR_BRIGHT0E_RGB="b66999"
export TINTED_COLOR_BRIGHT0F_RGB="d89c3f"
