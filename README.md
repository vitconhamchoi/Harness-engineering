# Harness Engineering

A practical repo for understanding where spec tools and agent workflow tools fit inside a broader harness around AI coding agents.

## Concept map

```text
Harness Engineering
│
├─ 1. Specification layer
│  ├─ Purpose: keep requirements, design, tasks, and change history outside chat memory
│  └─ Example tool: OpenSpec
│
├─ 2. Agent workflow layer
│  ├─ Purpose: improve how the agent plans, debugs, tests, reviews, and executes work
│  └─ Example tool/framework: Superpowers
│
├─ 3. Project instruction layer
│  ├─ Purpose: teach the agent how this specific repo should be handled
│  └─ Examples: AGENTS.md, prompt examples, workflow docs, review docs
│
└─ 4. Verification layer
   ├─ Purpose: stop the agent from declaring success without evidence
   └─ Examples: tests, build checks, lint checks, review gates
```

## Short explanation

- **Harness Engineering** is the overall discipline.
- **OpenSpec** belongs to the **Specification layer**.
- **Superpowers** belongs to the **Agent workflow layer**.
- `AGENTS.md` and docs/templates belong to the **Project instruction layer**.
- testing and review discipline belong to the **Verification layer**.

In short:

```text
Agent = Model + Harness
```

And a useful harness usually includes:
- a spec layer
- a workflow layer
- project-specific instructions
- verification

## Read in this order
1. `README.md`
2. `01-FOUNDATIONS.md`
3. `02-INSTALLATION.md`
4. `03-HOW-TO-USE.md`

## What to copy into a real project
Only use files from:
- `project-kit/openspec/`
- `project-kit/local-superpower-patterns/`
- `project-kit/templates/`

## Important
- OpenSpec is a real external tool for the specification layer.
- Superpowers is a real plugin / skills framework for the agent workflow layer.
- `project-kit/local-superpower-patterns/` is not the official Superpowers plugin.
- Do not copy this entire repo into a project. Only take what you need from `project-kit/`.
