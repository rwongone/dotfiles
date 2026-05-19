./install.sh to move files to the right places.
Updates to those files will reflect in the locally-cloned repository directory.
Don't move this directory after installation.

## Claude config (copied, not symlinked)

Most dotfiles are symlinked, but `~/.claude/` is copied. `ws dev` devcontainers
preserve symlinks during seeding, so symlinks pointing at host paths like
`/Users/rwong/Development/dotfiles/...` end up dangling inside the container.

A launchd agent (`local.claude-sync`) runs `claude/sync-watch.sh`, which uses
`fswatch` to mirror `claude/` into `~/.claude/` on every save. It is installed
and loaded by `./install.sh --claude`.

```bash
# inspect / control
launchctl print  "gui/$(id -u)/local.claude-sync"
launchctl bootout  "gui/$(id -u)/local.claude-sync"
launchctl bootstrap "gui/$(id -u)" ~/Library/LaunchAgents/local.claude-sync.plist
tail -f ~/.claude/sync-watch.log
```

Requires `fswatch` (in `brew_install.sh`). Without it, the agent does a single
initial sync on load and exits.
