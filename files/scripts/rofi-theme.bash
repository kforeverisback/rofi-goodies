#!/usr/bin/env bash

# Make sure you'e installed Rofi themes from: https://github.com/adi1090x/rofi 

ROFI_CONFIG_DIR="$HOME/.config/rofi"
# type_dir="$HOME/.config/rofi/launchers/type-5"
# theme='style-4'

theme_type=type-1
theme_style=style-1
# ## Run
# rofi -theme "${type_dir}/${theme}.rasi" "$@"

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  key="$1";value="$2"
  case $key in
    -t|--type)
      theme_type="$value";shift 2;;
    -s|--style)
      theme_style="$value";shift 2;;
    *)
      POSITIONAL_ARGS+=("$key") # save positional arg
      shift # past argument
      ;;
    # -*|--*)
    #   POSITIONAL_ARGS+=("$1") # save positional arg
    #   shift # past argument
    #   ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

# menu_type=$(echo "${POSITIONAL_ARGS[0]}" | tr '[:upper:] ''[:lower:]')
case "${POSITIONAL_ARGS[0]}" in
  l|launcher|launchers)
    theme="$theme_style" "$ROFI_CONFIG_DIR/launchers/$theme_type/launcher.sh";;
  # theme_path="$ROFI_CONFIG_DIR/launchers/$theme_type/$theme_style" ;;
  p|powermenu|powermenus)
    theme="$theme_style" "$ROFI_CONFIG_DIR/powermenu/$theme_type/powermenu.sh";;
  # theme_path="$ROFI_CONFIG_DIR/powermenu/$theme_type/$theme_style" ;;
  *)
  echo "Unknown Menu Type" && exit 1;;

esac

# [[ "$menu_type" != "launcher" && "$menu_type" != "powermenu" ]] && echo "Unknown Menu Type" && exit 1 
# theme='style-4'

# ## Run
# echo rofi -theme "${theme_path}.rasi" "$@"
# rofi -theme "${theme_path}.rasi" "$@"

