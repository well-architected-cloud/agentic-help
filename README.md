# --agentic-help

A CLI traditionally has a `--help` for a brief instructions and a man page for detailed ones.

In the age of agentic development, the iteration of `command --help` often followed by `command subcommand --help` is mostly a waste of tokens, context and time. 

As an alternative, a middle ground `--agentic-help` (or a synonym `--agent-help`) can serve as a TL;DR for agents covering 80% of their doc exploration needs for unknown commands.

The command output should recursively print all commands and subcommands with brief descriptions, followed by an optional short text describing important pecularities like conventions and formats. Important is to keep it relatively small - the man page still is the source of the exhaustive documentation.

Another advantage is that with this addition AGENTS.md doesn't need to contain detailed instructions, just an introduction and a reference on how to get detailed help. Here's an example for [moth](https://github.com/tailoredshapes/moth) from this repo:

```
# Moth Agent Guide

This guide helps LLM agents work effectively with moth, a git-based file issue tracker.

## Overview

Moth stores issues as markdown files in `.moth/` directories organized by status (ready, doing, done). Each issue has a unique ID, severity, and slug derived from the title.
NEVER manupulate the moth files directly, ALWAYS use `moth` cli for any changes.
`moth update` replaces the whole description from stdin — when adding to an
issue (e.g. a decision record), always read the current description first
(`moth show`) and pass it back through unchanged plus the new content
appended. Never drop existing text.

**Note**: Moth automatically recreates missing status directories (e.g., if git removes empty directories). As long as `config.yml` exists, moth will recover gracefully.

## Workflow Commands

See `moth --agent-help`

```

and here's an example of moth's `--agent-help`

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

