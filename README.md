# --agentic-help

## Problem

A CLI traditionally has a `--help` for brief instructions and a man page for detailed ones.

In the age of agentic development, iterating `command --help`, often followed by `command subcommand --help`, is mostly a waste of tokens, context and time.

## Proposal

As an alternative, a middle ground, `--agentic-help` (alias: `--agent-help`), can serve as a TL;DR for agents. It covers 80% of their documentation exploration needs for unknown commands.

The command's output should:

- recursively list every command, subcommand and their options, with a one-line description for each
- optionally end with a short note on conventions and formats 
- stay small to protect the agent's context from bloating

The man page remains the source of the exhaustive documentation.

Another advantage is that with this flag, AGENTS.md doesn't need to contain verbose instructions, only an introduction and a pointer to the detailed help.

## Example

Here's an example for moth, an in-repo file-based issue tracker [moth](https://github.com/tailoredshapes/moth), taken from this repo's AGENTS.md:

```
# Moth Agent Guide

This guide helps LLM agents work effectively with moth, a git-based file issue tracker.

## Overview

Moth stores issues as markdown files in `.moth/` directories organized by status (ready, doing, done). Each issue has a unique ID, severity, and slug derived from the title.
NEVER manipulate the moth files directly, ALWAYS use `moth` cli for any changes.
`moth update` replaces the whole description from stdin - when adding to an
issue (e.g. a decision record), always read the current description first
(`moth show`) and pass it back through unchanged plus the new content
appended. Never drop existing text.

**Note**: Moth automatically recreates missing status directories (e.g., if git removes empty directories). As long as `config.yml` exists, moth will recover gracefully.

## Workflow Commands

See `moth --agent-help`
```

Moth uses the shorter alias `--agent-help`. Here's an example of its output:

```
moth
  A simple file-based issue tracker
  Options:
    --list-ids
    --list-statuses
    --agent-help
  Subcommands:
  # Create CLAUDE.md with moth agent guide for LLM assistants
  moth claude [--force] [--append]

  # Compact priority numbering in status
  moth compact

  # Generate shell completions
  moth completions

  # Move issue to 'done' status
  moth done

  # Edit issue in configured editor
  moth edit

  # Manage git commit hooks
  moth hook

    # Install prepare-commit-msg hook
    moth hook install [--force] [--append]

    # Uninstall prepare-commit-msg hook
    moth hook uninstall

  # Initialize .moth/ directory
  moth init

  # List issues
  moth ls [--status] [--all] [--severity]

  # Move issue to specific status
  moth mv

  # Create a new issue
  moth new [--severity] [--no-edit] [--start] [--stdin]

  # Check for issue ID prefix in a message (used by git hook)
  moth prefix

  # Set priority order for a story
  moth priority [--compact] [--no-compact]

  # Extract story change history from git commits as CSV
  moth report [--since] [--until]

  # Delete an issue
  moth rm

  # Change issue severity
  moth severity

  # Show issue details
  moth show

  # Move issue to 'doing' status
  moth start

  # Update issue description from stdin
  moth update
```

