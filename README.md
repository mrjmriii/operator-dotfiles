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

## What I optimize for
- reproducibility over novelty
- minimal surprises (safe defaults)
- portability across Linux hosts
- clear separation between operator and infrastructure

## Non-goals
- storing secrets or host-specific data
- replacing full config management
- embedding lab or client automation

## Tooling baseline
See `TOOLS.md` for the conservative toolchain I expect on a workstation.

## Quick install

```bash
./install.sh
```

Then add this to `~/.zshrc` (or `~/.bashrc`):

```bash
source ~/.config/shell/init.sh
```

## Design Principles

- **Identity is portable**
- **Identity is versioned**
- **Identity is not embedded in projects**
- **Bootstrap brokers trust, identity defines behavior**

This allows:
- rebuilding a workstation quickly
- using the same identity across many repos
- clean separation between operator and infrastructure

## Architecture notes
- Layered shell design: shared defaults + shell-specific behavior + profile overrides.
- Profiles keep context changes explicit and reversible (no hidden drift).
- Installation is non-destructive by default; opt-in replacement only.

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
Local-only overrides should live in:

```text
.config/shell/profiles/local/
```

This directory is intentionally gitignored.

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

## Repo layout (current)

```text
operator-dotfiles/
├── .config/shell/
│   ├── init.sh
│   ├── common.sh
│   ├── functions.sh
│   ├── aliases.sh
│   ├── bash.sh
│   ├── zsh.sh
│   └── profiles/default/
│       ├── env.sh
│       └── prompt.sh
├── CHANGELOG.md
├── install.sh
├── LICENSE
├── README.md
├── TOOLS.md
└── VERSION
```

---

## Status

This repository evolves slowly and intentionally.
Stability is preferred over novelty.
