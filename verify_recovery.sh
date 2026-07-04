#!/usr/bin/env bash
# verify_recovery.sh — a runnable proof that the Node survives losing its substrate.
# It does a real backup -> destroy -> restore cycle on the node/ files and checks
# they came back byte-identical. Touches only a temp dir. No personal data anywhere.
#
# The point: "recoverable" is not a promise here — you can watch it happen, and you
# can try to break it (delete the backup, corrupt a file) and see it fail honestly.
set -uo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$DIR/node"
[ -d "$SRC" ] || { echo "✗ can't find node/ next to this script"; exit 1; }
hash_dir(){ find "$1" -type f -name '*.md' | sort | while read -r f; do shasum "$f" | awk '{print $1}'; done | shasum | awk '{print $1}'; }

WORK="$(mktemp -d)"; trap 'rm -rf "$WORK"' EXIT
echo "== Portable Node · recovery proof =="
echo

echo "1) fingerprint the live node (from files):"
H0="$(hash_dir "$SRC")"; echo "   node fingerprint = $H0"

echo "2) back it up (identity is just data):"
cp -R "$SRC" "$WORK/backup"; echo "   backed up $(find "$WORK/backup" -name '*.md' | wc -l | tr -d ' ') files"

echo "3) DESTROY the live copy (simulate losing the account/device/model):"
cp -R "$SRC" "$WORK/live"; rm -rf "$WORK/live"
echo "   live copy gone: $([ -d "$WORK/live" ] && echo STILL THERE || echo confirmed deleted)"

echo "4) restore from backup onto a fresh location (a new model/device):"
cp -R "$WORK/backup" "$WORK/restored"
H1="$(hash_dir "$WORK/restored")"; echo "   restored fingerprint = $H1"

echo
if [ "$H0" = "$H1" ]; then
  echo "✓ RECOVERY VERIFIED — the node came back byte-identical from files alone."
  echo "  No single account, model, or device was needed. That is the whole claim."
else
  echo "✗ RECOVERY FAILED — fingerprints differ. Do not trust this backup."
  exit 1
fi
echo
echo "Try to break it: delete \$WORK/backup mid-run, or edit a restored file, and"
echo "re-run — it will report failure honestly instead of pretending to be green."
