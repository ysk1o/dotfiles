for f in "$(dirname "${BASH_SOURCE:-$0}")/"*"/export.bash"
do
  source "$f"
done
