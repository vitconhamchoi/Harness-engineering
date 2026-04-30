# Security Review Template

## Purpose
Use this template when reviewing a repo, workstation setup, or agent environment for practical risk.

## Review Areas

### 1. Secret Exposure
- git remotes with embedded tokens
- `.env` files committed or referenced unsafely
- hardcoded API keys or PATs
- shell history or config leaks

### 2. Execution Risk
- custom git hooks
- suspicious shell scripts
- startup persistence
- binaries or generated artifacts accidentally committed

### 3. Dependency / Supply Chain Risk
- unreviewed install scripts
- unnecessary postinstall hooks
- stale lockfiles with known issues
- random copied code or AI-generated scripts not audited

### 4. External Exposure
- public bind addresses
- unintended remote control paths
- weak access tokens
- overly broad permissions

## Output Format
- Summary
- Confirmed risks
- Scope and impact
- Recommended fixes
- What is safe / not currently concerning

## Severity Labels
- Low: mostly hygiene
- Medium: exploitable in limited scope
- High: meaningful unauthorized access or data exposure
- Critical: active compromise or broad secret exposure
