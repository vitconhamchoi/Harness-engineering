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

[ -f "$ROOT/.gitignore" ] || fail "Missing .gitignore"
ok ".gitignore present"

[ -f "$ROOT/LICENSE" ] || fail "Missing LICENSE"
ok "LICENSE present"

[ -f "$ROOT/CONTRIBUTING.md" ] || fail "Missing CONTRIBUTING.md"
ok "CONTRIBUTING.md present"

[ -f "$ROOT/docs/workflow-templates.md" ] || fail "Missing docs/workflow-templates.md"
ok "docs/workflow-templates.md present"

[ -f "$ROOT/docs/security-review-template.md" ] || fail "Missing docs/security-review-template.md"
ok "docs/security-review-template.md present"

[ -f "$ROOT/docs/research-template.md" ] || fail "Missing docs/research-template.md"
ok "docs/research-template.md present"

grep -q "Harness Engineering" "$ROOT/README.md" || fail "README.md missing expected title"
ok "README title check passed"

grep -q "Core Principles" "$ROOT/docs/AGENTS.md" || fail "AGENTS.md missing core principles section"
ok "AGENTS section check passed"

grep -q "Prompt Examples" "$ROOT/docs/prompt-examples.md" || fail "prompt-examples.md missing title"
ok "Prompt examples title check passed"

grep -q "Security Audit Workflow" "$ROOT/docs/workflow-templates.md" || fail "workflow-templates.md missing expected section"
ok "Workflow templates check passed"

grep -q "Secret Exposure" "$ROOT/docs/security-review-template.md" || fail "security-review-template.md missing expected section"
ok "Security template check passed"

grep -q "Research Rules" "$ROOT/docs/research-template.md" || fail "research-template.md missing expected section"
ok "Research template check passed"

echo "Validation passed."
