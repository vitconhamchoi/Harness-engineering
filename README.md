# Harness Engineering

A practical repo for understanding how to add harness layers around AI coding agents.

## What this repo is for

This repo helps answer three questions:
1. What is Harness Engineering?
2. What are OpenSpec, Superpowers, and Spec-Kit?
3. How do you add harness layers to an existing software project?

## Reading order

Read these files in order:

1. `01-WHAT-IS-HARNESS-ENGINEERING.md`
2. `02-WHAT-IS-OPENSPEC.md`
3. `03-WHAT-IS-SUPERPOWERS.md`
4. `04-WHAT-IS-SPEC-KIT.md`
5. `05-HOW-THEY-RELATE.md`
6. `06-HOW-TO-ADD-HARNESS-TO-AN-EXISTING-PROJECT.md`
7. `07-FAILURE-TAXONOMY.md`
8. `08-EVOLUTION-PATH.md`

## What to copy into a real project

Only use files from `project-kit/` for real project adoption.

### `project-kit/openspec/`
Use this if you want a spec layer backed by the real OpenSpec tool.

### `project-kit/local-superpower-patterns/`
Use this if you want local workflow patterns inspired by “superpowers”.
These are not an official Superpowers package or plugin.

### `project-kit/templates/`
Use these as generic project docs you can copy or adapt:
- `AGENTS.md`
- prompt examples
- workflow templates
- security review template
- research template

## Important notes

- OpenSpec is a real external tool.
- This repo does not ship an official Superpowers plugin/package.
- Do not copy this entire repo into a project. Only take the parts you need from `project-kit/`.
