#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"

fail() {
  echo "[FAIL] $1"
  exit 1
}

ok() {
  echo "[OK] $1"
}

[ -f "$ROOT/README.md" ] || fail "Missing README.md"
ok "README.md present"

[ -f "$ROOT/docs/AGENTS.md" ] || fail "Missing docs/AGENTS.md"
ok "docs/AGENTS.md present"

[ -f "$ROOT/docs/prompt-examples.md" ] || fail "Missing docs/prompt-examples.md"
ok "docs/prompt-examples.md present"

[ -f "$ROOT/scripts/validate.sh" ] || fail "Missing scripts/validate.sh"
ok "scripts/validate.sh present"

grep -q "Harness Engineering" "$ROOT/README.md" || fail "README.md missing expected title"
ok "README title check passed"

grep -q "Core Principles" "$ROOT/docs/AGENTS.md" || fail "AGENTS.md missing core principles section"
ok "AGENTS section check passed"

grep -q "Prompt Examples" "$ROOT/docs/prompt-examples.md" || fail "prompt-examples.md missing title"
ok "Prompt examples title check passed"

echo "Validation passed."
