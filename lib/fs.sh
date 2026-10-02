create_symlink() {
  local source="$1"
  local target="$2"

  mkdir -p "$(dirname "$target")"

  if [ -L "$target" ]; then
    if [ "$(readlink "$target")" = "$source" ]; then
      log_synlink_skipped "$target"
    else
      run ln -sf "$source" "$target"
      log_synlink_replaced "$target"
    fi
  elif [ -e "$target" ]; then
    # Replace an existing file only when it matches the repo; otherwise leave it for manual resolution
    if cmp -s "$source" "$target"; then
      run ln -sf "$source" "$target"
      log_synlink_replaced "$target"
    else
      log_conflict "$target" "$source"
    fi
  else
    run ln -sf "$source" "$target"
    log_symlink "$target"
  fi
}
