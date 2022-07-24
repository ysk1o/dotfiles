source "$HOME/dotfiles/manager/export.bash"
source "$HOME/dotfiles/modules/export.bash"

# source settings
for file in .{bashrc,inputrc}; do
  [[ -r "$file" ]] && [[ -f "$file" ]] && . "$file"
done
