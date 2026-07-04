---
name: jujutsu-project
description: >
  Manage projects that use Jujutsu (`jj`) with Git backing. Use when Codex
  needs to inspect status, review changes, create or edit changes, rebase,
  squash, split, abandon, push/fetch, manage bookmarks, or recover history in a
  repo containing `.jj`, especially when both `jj` and `git` are available.
---

# Jujutsu Project

Use `jj` as the primary VCS interface when a repository contains `.jj`. Use
`git` only for compatibility checks, commands that have no `jj` equivalent in
the local workflow, or when the user explicitly asks for Git output.

## Core Rules

- Inspect state before editing: run `jj st` and usually
  `jj log -r '::@ | @::'` or `jj log`.
- Treat the working copy as an active jj change, not as Git's unstaged/staged
  split. Do not use `git add`.
- Remember that many jj commands can operate on arbitrary revisions with
  `-r <rev>`, not only on the working-copy change.
- Do not run destructive Git commands such as `git reset --hard`,
  `git checkout --`, or force-push equivalents unless the user explicitly asks.
- Prefer jj recovery tools: use `jj op log`, `jj undo`, and `jj op revert`
  instead of trying to reconstruct state with Git.
- Preserve user work. If an unexpected change appears, assume it belongs to the
  user and work around it.
- When reporting VCS state to the user, use jj terms: change, revision,
  bookmark, operation.

## Common Workflow

1. Check status with `jj st`.
2. Inspect relevant changes with `jj diff`, `jj show <rev>`, or
   `jj diff -r <rev>`.
3. Make file edits normally. Files are automatically part of the current change.
4. Review your own edits with `jj diff`.
5. Run tests or checks.
6. If asked to finish the change, use `jj commit` or `jj describe` according
   to the user's intent.

## Command Map

Use these jj commands instead of common Git habits:

- `git init` -> `jj git init [--no-colocate]`
- `git clone <source> <destination>` -> `jj git clone <source> <destination>`
- `git status` -> `jj st`
- `git diff HEAD` -> `jj diff`
- `git diff A B` -> `jj diff --from A --to B`
- `git show <rev>` -> `jj show <rev>`
- `git log --oneline --graph` -> `jj log -r ::@`
- `git log --oneline --graph --all` -> `jj log -r 'all()'` or `jj log -r ::`
- `git add <file>` -> no command; edit the file
- `git rm <file>` -> remove the file normally
- `git rm --cached <file>` -> `jj file untrack <file>`; the file must match an
  ignore pattern to remain untracked
- `git commit -a` -> `jj commit`
- `git commit --amend -a` -> `jj squash`
- `git add -p; git commit --amend` -> `jj squash -i`
- `git commit -p` -> `jj split`
- `git stash` -> `jj new @-`; restore with `jj edit <old-change>`
- `git reset --hard` to abandon current work -> `jj abandon`
- `git restore <paths>...` -> `jj restore <paths>...`
- `git commit --amend --only` for message edits -> `jj describe @-`
- edit current description -> `jj describe`
- `git switch -c topic main` -> `jj new main`
- `git merge A` -> `jj new @ A`
- `git checkout <rev>` to inspect source -> `jj new <rev>`; abandon the empty
  change afterward if not needed
- `git rebase B A` -> `jj rebase -b A -o B`
- move change A and descendants onto B -> `jj rebase -s A -o B`
- reorder one change before another -> `jj rebase -r C --before B`
- interactive reorder multiple changes -> `jj arrange`
- `git cherry-pick <source>` -> `jj duplicate <source> -o <destination>`
- `git branch` -> `jj bookmark list`
- `git branch <name> <rev>` -> `jj bookmark create <name> -r <rev>`
- `git branch -f <name> <rev>` -> `jj bookmark move <name> --to <rev>`
- backward or sideways bookmark move -> `jj bookmark move <name> --to <rev> --allow-backwards`
- `git branch --delete <name>` -> `jj bookmark delete <name>`
- `git fetch [remote]` -> `jj git fetch [--remote <remote>]`
- `git push <remote> <bookmark>` -> `jj git push --bookmark <bookmark> [--remote <remote>]`
- `git push --all [remote]` -> `jj git push --all [--remote <remote>]`
- `git remote add <name> <url>` -> `jj git remote add <name> <url>`
- `git tag -l` -> `jj tag list`
- `git tag <name> <rev>` -> `jj tag set <name> -r <rev>`
- `git tag -d <name>` -> `jj tag delete <name>`
- `git blame <file>` -> `jj file annotate <path>`
- `git rev-parse --show-toplevel` -> `jj workspace root`
- interrupted `git rebase/merge/cherry-pick --continue` flow -> resolve files,
  then use `jj squash`; jj operations generally do not pause for a continue step

## Change Management

- To start new work from the current parent, use `jj new @-`.
- To start work from a bookmark, use `jj new <bookmark>`.
- To examine an old revision without detaching a Git HEAD, use `jj new <rev>`
  and later `jj abandon` if the empty change is not needed.
- To move the current change into its parent, use `jj squash`.
- To move only selected hunks into the parent, use `jj squash -i`.
- To move the current diff into another change, use `jj squash --into <rev>`.
- To split a change, use `jj split`; for an arbitrary revision, use
  `jj split -r <rev>`.
- To edit a diff in an arbitrary change, use `jj diffedit -r <rev>`.

## Reviewing and Diffing

- For the current change, use `jj diff`.
- For one change, use `jj show <rev>` or `jj diff -r <rev>`.
- For a range of changes, use `jj diff -r A..B`.
- For ancestor context around the current change, use `jj log -r ::@`.
- For repository-wide visibility, use `jj log -r 'all()'`.
- For changed-line search, use `jj log -r 'diff_lines(regex:<pattern>)'`.
- For file search, prefer `rg --no-require-git <pattern>` or
  `rg <pattern> $(jj file list)` when shell expansion is acceptable.

## Git Interop

- In colocated Git/JJ repos, keep using `git` for external tooling that expects
  Git, but do not mutate history through Git unless requested.
- Use `jj git fetch` and `jj git push`, not plain `git fetch`/`git push`, when
  updating jj-managed state.
- Use bookmarks where Git users expect branches. Confirm the target bookmark
  before moving or pushing it.
- Before pushing, inspect `jj st`, `jj log`, and the bookmark target. Push with
  an explicit `--bookmark <name>` unless the user asked for `--all`.

## Recovery

- If a VCS operation went wrong, first run `jj op log`.
- To undo the most recent operation, use `jj undo`.
- To redo an undone operation, use `jj redo`.
- To revert an earlier operation, use `jj op revert <operation-id>`.
- To create a change that cancels a previous change, use
  `jj revert -r <rev> -B @`.

## Commit/Description Guidance

- Use `jj describe` to update the current change description.
- Use `jj describe <rev>` to update another change.
- Use `jj commit` only when the user wants to finish the current change and
  start a new one.
- Do not invent bookmark names or push destinations. If they are unclear and
  pushing or publishing is requested, ask.
