#!/bin/zsh
# Mirror claude/ dotfiles into ~/.claude/ on change. Uses real-file copies
# (not symlinks) so the result propagates correctly into `ws dev`
# devcontainers, which preserve symlinks during seeding.

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SRC="$DOTFILES_DIR/claude"
DST="$HOME/.claude"

# Items mirrored from claude/. Keep in sync with install.sh:install_claude.
ITEMS=(CLAUDE.md commands docs skills rules agents hooks settings.json settings.local.json sounds)

sync_once() {
    mkdir -p "$DST"
    for item in "${ITEMS[@]}"; do
        if [[ -d "$SRC/$item" ]]; then
            rsync -aL --delete "$SRC/$item/" "$DST/$item/"
        elif [[ -e "$SRC/$item" ]]; then
            rsync -aL "$SRC/$item" "$DST/$item"
        fi
    done
}

sync_once

if ! command -v fswatch >/dev/null 2>&1; then
    echo "fswatch not installed (brew install fswatch). Initial sync done; exiting." >&2
    exit 0
fi

# --latency 0.5 batches bursts of editor saves into one sync.
exec fswatch -o --latency 0.5 "$SRC" | while read -r _; do
    sync_once
done
