---
name: python-uv
description: >
  Manage Python projects with uv while avoiding direct use of system Python,
  global pip, or globally installed Python tools. Use when creating, editing,
  testing, linting, formatting, running, packaging, or dependency-managing
  Python code, pyproject.toml projects, requirements files, virtual
  environments, Python CLIs, scripts, notebooks, or test suites.
---

# Python uv

## Core Rule

Use `uv` as the Python entry point. Do not run `python`, `python3`, `pip`,
`pip3`, `pytest`, `ruff`, `mypy`, `black`, `tox`, `jupyter`, or other Python
tool executables directly from the system environment.

Prefer commands that route through the project environment:

```bash
uv run python ...
uv run pytest
uv run ruff check .
uv run mypy .
```

Use `uvx` only for one-off tools that are not project dependencies and do not
need to mutate the project environment.

## Project Workflow

Start by inspecting the project shape:

```bash
uv --version
```

If the project has `pyproject.toml` or `uv.lock`, use:

```bash
uv tree
uv sync
uv run python -m pytest
```

If the project has no uv environment yet, initialize or adopt uv conservatively:

```bash
uv init
uv add <package>
uv add --dev pytest ruff
uv lock
```

For existing `requirements.txt` projects, keep the user's files unless asked to
migrate. Create a uv-managed environment and sync requirements without invoking
system pip:

```bash
uv venv
uv pip sync requirements.txt
```

## Command Map

| Task | Use |
| ---- | --- |
| Run a module or script | `uv run python -m <module>` or `uv run python path/to/script.py` |
| Run tests | `uv run pytest` or the project test command through `uv run` |
| Add runtime dependency | `uv add <package>` |
| Add dev dependency | `uv add --dev <package>` |
| Remove dependency | `uv remove <package>` |
| Sync environment | `uv sync` |
| Refresh lockfile | `uv lock` |
| Show dependency tree | `uv tree` |
| Run one-off tool | `uvx <tool> ...` |
| Install from requirements | `uv venv` then `uv pip sync requirements.txt` |
| Build package | `uv build` |
| Publish package | `uv publish` only when explicitly requested |

## Editing Guidance

- Preserve existing project conventions in `pyproject.toml`, `uv.lock`, test
  commands, package layout, and configured tools.
- Commit dependency changes through `uv add`, `uv remove`, `uv sync`, or
  `uv lock` so `pyproject.toml` and `uv.lock` stay consistent.
- Do not manually edit `uv.lock` unless the user explicitly asks for lockfile
  surgery.
- Prefer project-configured tools over adding new ones. If `pytest`, `ruff`,
  `mypy`, or another tool is already configured, run it through `uv run`.
- When a command fails because a tool is missing, add it as a development
  dependency with `uv add --dev <tool>` if that matches the task.

## Fallbacks

If `uv` is unavailable, stop and report that the Python task cannot be performed
under this skill's policy until `uv` is installed or made available. Do not fall
back to system Python or global pip.

If a user explicitly requests a system Python or global pip command, mention
that it violates this skill's policy and ask for confirmation before doing it.
