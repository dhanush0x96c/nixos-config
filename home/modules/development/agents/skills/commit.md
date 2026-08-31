---
name: commit
description: Create formatted conventional commits.
---

# Commit Workflow

1. **Format changed files**:
   - Formatter tools must **always** be executed on-demand via `nix run` (never invoke formatter binaries directly or globally). Format all modified files before committing (e.g. `nix run nixpkgs#nixfmt-rfc-style -- <files>`, `nix run nixpkgs#ruff -- format <files>`, `nix run nixpkgs#gofmt -- -w <files>`, `nix run nixpkgs#prettier -- --write <files>`).

2. **Inspect VCS state**:
   - Detect VCS: Use `jj` if in a Jujutsu repository (`.jj`), otherwise use `git`.
   - Check status, recent history (last 10), and diff:
     - `jj`: `jj status`, `jj log -n 10`, `jj diff`
     - `git`: `git status`, `git log -n 10`, `git diff` (and `git diff --staged`)
   - Abort the commit if there are unrelated changes.

3. **Format commit message**:
   - Use Conventional Commits: `<type>(<optional scope>): <description>`.
     - Types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`.
     - Keep subject concise (<= 72 chars), imperative mood, lowercase, no trailing period.
   - Add a body only when necessary to explain non-obvious reasoning or motivation.

4. **Commit**:
   - `jj`: `jj commit -m "<message>"`
   - `git`: `git commit -m "<message>"`
