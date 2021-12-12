# source settings
for file in .{bashrc,inputrc}; do
  [[ -r "$file" ]] && [[ -f "$file" ]] && . "$file"
done
