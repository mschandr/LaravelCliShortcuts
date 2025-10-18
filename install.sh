#!/usr/bin/env bash
# Install helper for Laravel Shortcuts
set -euo pipefail

usage() {
  cat <<USAGE
Usage: $0 [--user|--system]
  --user    Install into \$HOME/.local/bin and add to PATH if missing
  --system  Install into /usr/local/bin (may require sudo)
USAGE
}

ensure_path() {
  local dir="$1"
  # Check if PATH already contains dir
  case ":$PATH:" in
    *":$dir:"*) return 0 ;;
  esac
  # Try to add to common shell RC files
  for rc in "$HOME/.bashrc" "$HOME/.zshrc"; do
    if [ -f "$rc" ]; then
      echo "export PATH=\"$dir:\$PATH\"" >> "$rc"
      echo "Appended PATH update to $rc"
      return 0
    fi
  done
  echo "Add this to your shell rc: export PATH=\"$dir:\$PATH\"" >&2
}

case "${1:-}" in
  --user)
    prefix="$HOME/.local"
    mkdir -p "$prefix/bin"
    for f in bin/*; do
      install -m 0755 "$f" "$prefix/bin/"
      echo "Installed $prefix/bin/$(basename "$f")"
    done
    ensure_path "$HOME/.local/bin"
    ;;
  --system)
    prefix="/usr/local"
    sudo mkdir -p "$prefix/bin"
    for f in bin/*; do
      sudo install -m 0755 "$f" "$prefix/bin/"
      echo "Installed $prefix/bin/$(basename "$f")"
    done
    ;;
  *)
    usage
    exit 1
    ;;
esac
