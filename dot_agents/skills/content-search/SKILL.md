---
name: content-search
description: >
  Use ripgrep `rg` for command-line content searches and `fd` for file searches
  by name, path, extension, or type. Use when searching source code, logs,
  configuration, scripts, or other text for symbols, functions, variables,
  strings, regular expressions, filenames, or file types.
---

# Content Search

## Instructions

Use `rg` first for command-line text search. It searches recursively by default,
respects `.gitignore`, and skips binary files.

Use `fd` first when the task is to discover files by name, path, extension, or
type. It searches recursively by default and respects `.gitignore`.

## Quick Reference

| Command | Description |
| ------- | ----------- |
| `rg pattern` | Search recursively for `pattern` in current dir |
| `rg -i pattern` | Case-insensitive search |
| `rg -w pattern` | Whole-word match only |
| `rg -l pattern` | List only filenames with matches |
| `rg -c pattern` | Show match count per file |
| `rg -n pattern` | Show line numbers |
| `rg -C 3 pattern` | Show 3 lines of context before/after |
| `rg -B 3 pattern` | Show 3 lines before |
| `rg -A 3 pattern` | Show 3 lines after |
| `rg -v pattern` | Invert match (lines NOT matching) |
| `rg -g '*.rs' pattern` | Filter by glob (e.g., Rust files) |
| `rg -g '!*.min.*' pattern` | Exclude files matching glob |
| `rg --type rust pattern` | Filter by predefined file type |
| `rg --type-list` | List all known file types |
| `rg -tpy pattern` | Short: only Python files (`-tpy`) |
| `rg --sort path` | Sort results by file path |
| `rg --json pattern` | JSON output (for tooling) |
| `rg -F pattern` | Fixed-string search (no regex) |
| `rg -z pattern *.gz` | Search inside compressed files |
| `rg -r 'replacement' pattern` | Replace matched text (dry-run) |
| `rg -L pattern` | List files that do not contain `pattern` |
| `fd -t f` | List all non-ignored files recursively |
| `fd pattern` | Find paths whose names match `pattern` |
| `fd -g '*.toml'` | Find files using a glob |
| `fd -e rs` | Find files with the `.rs` extension |
| `fd -t d` | Find directories |
| `fd -t l` | Find symbolic links |
| `fd -H pattern` | Include hidden files and directories |
| `fd -I pattern` | Include ignored files |

### Common File Type Shortcuts

| Short | Type | Short | Type |
| ----- | ---- | ----- | ---- |
| `-trs` | Rust | `-tpy` | Python |
| `-tjs` | JavaScript | `-tts` | TypeScript |
| `-tmd` | Markdown | `-tjson` | JSON |
| `-tyaml` | YAML | `-tcss` | CSS |
| `-thtml` | HTML | `-tsh` | Shell |
| `-tc` | C | `-tcpp` | C++ |
| `-tgo` | Go | `-tjava` | Java |
| `-ttoml` | TOML | `-tdart` | Dart |
