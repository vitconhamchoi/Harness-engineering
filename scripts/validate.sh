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

[ -f "$ROOT/project-kit/templates/AGENTS.md" ] || fail "Missing project-kit/templates/AGENTS.md"
ok "project-kit/templates/AGENTS.md present"

[ -f "$ROOT/project-kit/templates/prompt-examples.md" ] || fail "Missing project-kit/templates/prompt-examples.md"
ok "project-kit/templates/prompt-examples.md present"

[ -f "$ROOT/project-kit/templates/workflow-templates.md" ] || fail "Missing project-kit/templates/workflow-templates.md"
ok "project-kit/templates/workflow-templates.md present"

[ -f "$ROOT/project-kit/templates/security-review-template.md" ] || fail "Missing project-kit/templates/security-review-template.md"
ok "project-kit/templates/security-review-template.md present"

[ -f "$ROOT/project-kit/templates/research-template.md" ] || fail "Missing project-kit/templates/research-template.md"
ok "project-kit/templates/research-template.md present"

[ -f "$ROOT/scripts/validate.sh" ] || fail "Missing scripts/validate.sh"
ok "scripts/validate.sh present"

[ -f "$ROOT/.gitignore" ] || fail "Missing .gitignore"
ok ".gitignore present"

[ -f "$ROOT/LICENSE" ] || fail "Missing LICENSE"
ok "LICENSE present"

[ -f "$ROOT/CONTRIBUTING.md" ] || fail "Missing CONTRIBUTING.md"
ok "CONTRIBUTING.md present"

[ -f "$ROOT/implementation-mapping.md" ] || fail "Missing implementation-mapping.md"
ok "implementation-mapping.md present"

[ -f "$ROOT/implementation-comparison.md" ] || fail "Missing implementation-comparison.md"
ok "implementation-comparison.md present"

[ -f "$ROOT/failure-taxonomy.md" ] || fail "Missing failure-taxonomy.md"
ok "failure-taxonomy.md present"

[ -f "$ROOT/evolution-path.md" ] || fail "Missing evolution-path.md"
ok "evolution-path.md present"

[ -f "$ROOT/project-kit/openspec/README.md" ] || fail "Missing project-kit/openspec/README.md"
ok "project-kit/openspec present"

[ -f "$ROOT/project-kit/local-superpower-patterns/README.md" ] || fail "Missing project-kit/local-superpower-patterns/README.md"
ok "project-kit/local-superpower-patterns present"

[ -f "$ROOT/examples/todolist-backend/AGENTS.md" ] || fail "Missing examples/todolist-backend/AGENTS.md"
ok "todolist-backend AGENTS example present"

[ -f "$ROOT/examples/todolist-backend/docs/debug-workflow.md" ] || fail "Missing examples/todolist-backend/docs/debug-workflow.md"
ok "todolist-backend debug workflow present"

[ -f "$ROOT/examples/todolist-backend/docs/review-checklist.md" ] || fail "Missing examples/todolist-backend/docs/review-checklist.md"
ok "todolist-backend review checklist present"

[ -f "$ROOT/examples/todolist-backend/docs/prompt-examples.md" ] || fail "Missing examples/todolist-backend/docs/prompt-examples.md"
ok "todolist-backend prompt examples present"

[ -f "$ROOT/examples/todolist-frontend/AGENTS.md" ] || fail "Missing examples/todolist-frontend/AGENTS.md"
ok "todolist-frontend AGENTS example present"

[ -f "$ROOT/examples/todolist-frontend/docs/debug-workflow.md" ] || fail "Missing examples/todolist-frontend/docs/debug-workflow.md"
ok "todolist-frontend debug workflow present"

[ -f "$ROOT/examples/todolist-frontend/docs/review-checklist.md" ] || fail "Missing examples/todolist-frontend/docs/review-checklist.md"
ok "todolist-frontend review checklist present"

[ -f "$ROOT/examples/todolist-frontend/docs/prompt-examples.md" ] || fail "Missing examples/todolist-frontend/docs/prompt-examples.md"
ok "todolist-frontend prompt examples present"

grep -q "Repo structure" "$ROOT/README.md" || fail "README missing expected structure section"
ok "README title check passed"

grep -q "AGENTS" "$ROOT/project-kit/templates/AGENTS.md" || fail "AGENTS template missing expected section"
ok "AGENTS section check passed"

grep -q "Prompt Examples" "$ROOT/project-kit/templates/prompt-examples.md" || fail "prompt-examples template missing title"
ok "Prompt examples title check passed"

grep -q "Security Audit Workflow" "$ROOT/project-kit/templates/workflow-templates.md" || fail "workflow-templates missing expected section"
ok "Workflow templates check passed"

grep -q "Secret Exposure" "$ROOT/project-kit/templates/security-review-template.md" || fail "security-review-template missing expected section"
ok "Security template check passed"

grep -q "Research Rules" "$ROOT/project-kit/templates/research-template.md" || fail "research-template missing expected section"
ok "Research template check passed"

grep -q "Agent = Model + Harness" "$ROOT/implementation-mapping.md" || fail "implementation-mapping missing expected framing"
ok "Implementation mapping check passed"

grep -q "OpenSpec" "$ROOT/implementation-comparison.md" || fail "implementation-comparison missing expected comparison"
ok "Implementation comparison check passed"

grep -q "Boundary failures" "$ROOT/failure-taxonomy.md" || fail "failure-taxonomy missing expected section"
ok "Failure taxonomy check passed"

grep -q "Level 0. Raw prompting" "$ROOT/evolution-path.md" || fail "evolution-path missing expected maturity model"
ok "Evolution path check passed"

grep -q "npm install -g @fission-ai/openspec@latest" "$ROOT/project-kit/openspec/README.md" || fail "project-kit openspec missing install command"
ok "OpenSpec kit check passed"

grep -q "not official Superpowers package/plugin\|không phải official Superpowers package/plugin" "$ROOT/project-kit/local-superpower-patterns/README.md" || fail "local superpower patterns missing disclaimer"
ok "Local superpower patterns check passed"

grep -q "offline-first" "$ROOT/examples/todolist-backend/AGENTS.md" || fail "todolist-backend AGENTS missing expected wording"
ok "todolist-backend AGENTS check passed"

grep -q "Debug Workflow" "$ROOT/examples/todolist-backend/docs/debug-workflow.md" || fail "todolist-backend debug workflow missing title"
ok "todolist-backend debug workflow check passed"

grep -q "Review Checklist" "$ROOT/examples/todolist-backend/docs/review-checklist.md" || fail "todolist-backend review checklist missing title"
ok "todolist-backend review checklist check passed"

grep -q "Prompt Examples" "$ROOT/examples/todolist-backend/docs/prompt-examples.md" || fail "todolist-backend prompt examples missing title"
ok "todolist-backend prompt examples check passed"

grep -q "Prompt Examples" "$ROOT/examples/todolist-frontend/docs/prompt-examples.md" || fail "todolist-frontend prompt examples missing title"
ok "todolist-frontend prompt examples check passed"

echo "Validation passed."
