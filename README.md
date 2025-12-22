```markdown
# Operator Dotfiles

This repository defines **operator identity**.

It is intentionally separate from any Infrastructure-as-Code (IaC), labs, or client repositories.

## Purpose

This repo represents:
- how the operator interact with systems
- how my shell behaves
- what defaults to expect as an operator

It does **not** contain:
- infrastructure definitions
- environment-specific state
- secrets or credentials
- client-specific logic

## Design Principles

- **Identity is portable**
- **Identity is versioned**
- **Identity is not embedded in projects**
- **Bootstrap brokers trust, identity defines behavior**

This allows:
- rebuilding a workstation quickly
- using the same identity across many repos
- clean separation between operator and infrastructure

## Shell Philosophy

- **Bash** is used for infrastructure and scripting
  - portable
  - predictable
  - lowest common denominator

- **Zsh** is used for interactive operator experience
  - ergonomics
  - navigation
  - quality-of-life improvements

Shared logic lives in `common.sh`.
Shell-specific behavior lives in `bash.sh` and `zsh.sh`.

## Profiles

Profiles allow identity to vary by context (personal, client, etc.)
without changing core behavior.

Structure:

```text
.config/shell/profiles/<profile-name>/
```

The default profile is `default`.

Profiles may define:
- environment variables
- prompts
- context-aware behavior

Profiles are optional and additive.

## Trust Model

This repository is treated as **operator trust material**.

- It is never modified by bootstrap scripts
- It is never overwritten automatically
- Changes are intentional and versioned

Bootstrap scripts may:
- clone this repository
- verify its integrity
- link it into the system

They may not edit it.

---

## Usage

This repository is typically cloned to:

```text
~/src/operator-dotfiles
```

And linked into the system via:

```text
~/.config/shell -> ~/src/operator-dotfiles/.config/shell
```

Bootstrap scripts handle this linking safely.

---

## Status

This repository evolves slowly and intentionally.
Stability is preferred over novelty.
```
