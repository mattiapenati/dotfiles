---
name: rust-cargo
description: >
  Manage Rust projects with Cargo and common Rust tooling. Use when creating,
  editing, testing, linting, formatting, dependency-managing, benchmarking,
  measuring coverage, inspecting generated assembly, or maintaining Rust
  projects with Cargo.toml, Cargo.lock, workspaces, crates, benches, examples,
  tests, nextest, tarpaulin, Criterion, or cargo-show-asm.
---

# Rust Cargo

## Core Rule

Use Cargo as the project entry point. Preserve existing workspace layout,
`Cargo.toml`, `Cargo.lock`, feature flags, toolchain files, and CI conventions.

Before changing behavior, inspect the project shape:

```bash
cargo metadata --no-deps
cargo fmt --check
cargo clippy --all-targets --all-features -- -D warnings
```

For workspaces, prefer workspace-aware commands unless the task targets one
crate:

```bash
cargo <command> --workspace
cargo <command> -p <package>
```

## Dependencies

Use Cargo subcommands to mutate dependencies instead of hand-editing dependency
tables when possible:

```bash
cargo add <crate>
cargo add --dev <crate>
cargo add --build <crate>
cargo add <crate> --features <feature>
cargo add <crate> --no-default-features
cargo remove <crate>
cargo update -p <crate>
```

Manually edit `Cargo.toml` only for changes Cargo cannot express cleanly, such
as workspace metadata, complex target-specific dependency tables, custom bench
targets, profiles, lints, patches, or feature graph refactors.

Commit lockfile changes when the project tracks `Cargo.lock`. Do not delete or
regenerate `Cargo.lock` unless the task requires it.

## Tests with nextest

Use nextest for normal test execution:

```bash
cargo nextest run
cargo nextest run --workspace
cargo nextest run -p <package>
cargo nextest run <test-name>
```

Use `cargo test` only when nextest is unavailable, when testing doctests, or
when the project explicitly depends on libtest behavior that nextest does not
cover:

```bash
cargo test --doc
cargo test <test-name>
```

If nextest is missing and installing tools is in scope, prefer:

```bash
cargo install cargo-nextest --locked
```

## Coverage with tarpaulin

Use tarpaulin to measure Rust test coverage:

```bash
cargo tarpaulin
cargo tarpaulin --workspace --all-features
cargo tarpaulin --out Html
cargo tarpaulin --out Xml
```

Keep coverage commands separate from nextest unless the project already has an
established integration. Tarpaulin can require platform-specific support; if it
is unavailable or unsupported, report that limitation instead of substituting an
unrequested coverage tool.

If tarpaulin is missing and installing tools is in scope, use:

```bash
cargo install cargo-tarpaulin --locked
```

## Benchmarks with Criterion

Use `cargo bench` for benchmarks. For Criterion benchmarks, ensure the benchmark
target disables the built-in harness:

```toml
[dev-dependencies]
criterion = "<project-compatible-version>"

[[bench]]
name = "my_benchmark"
harness = false
```

Run benchmarks with:

```bash
cargo bench
cargo bench --bench <bench-name>
cargo bench -p <package>
```

Store Criterion benchmarks under `benches/`. Preserve existing benchmark names,
measurement settings, and comparison baselines unless the task asks to change
them.

## Assembly Inspection with cargo-show-asm

Use cargo-show-asm through its Cargo subcommand:

```bash
cargo asm --lib
cargo asm --bin <binary>
cargo asm --example <example>
cargo asm --bench <bench>
cargo asm --lib <function-or-pattern>
```

When a function is missing from output, check for generics, inlining, visibility,
and optimization effects. Add a small monomorphic wrapper or `#[inline(never)]`
only when it is appropriate for the inspection task, and avoid leaving those
changes in production code unless the user wants them.

If cargo-show-asm is missing and installing tools is in scope, use:

```bash
cargo install cargo-show-asm
```

## Command Map

| Task | Use |
| ---- | --- |
| Format check | `cargo fmt --check` |
| Format code | `cargo fmt` |
| Lint | `cargo clippy --all-targets --all-features -- -D warnings` |
| Build | `cargo build` or `cargo build --workspace` |
| Test | `cargo nextest run` |
| Doctest | `cargo test --doc` |
| Coverage | `cargo tarpaulin --workspace --all-features` |
| HTML coverage | `cargo tarpaulin --out Html` |
| Add dependency | `cargo add <crate>` |
| Add dev dependency | `cargo add --dev <crate>` |
| Remove dependency | `cargo remove <crate>` |
| Benchmark | `cargo bench` |
| Benchmark one target | `cargo bench --bench <bench-name>` |
| Inspect assembly | `cargo asm --lib <function-or-pattern>` |

## Failure Handling

If required tools are missing, say which tool is missing and whether installing
it is necessary. Ask before installing global Cargo tools unless installation is
clearly part of the user's request.

If a command fails because of missing system packages, unsupported platform
features, nightly-only options, or network restrictions, report the exact
constraint and choose the closest Cargo-native path that still matches the
request.
