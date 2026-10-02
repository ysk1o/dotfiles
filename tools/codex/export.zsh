# Inline mode instead of the alternate screen: no mouse capture, so terminal selection and Cmd+C/Cmd+V work.
# Set here rather than in ~/.codex/config.toml, which Codex rewrites and which records local project paths.
alias codex='codex -c tui.alternate_screen=never'
