# Roc platform for Serverless Functions

Work In Progress

A platform to build serverless functions using Roc.

## Preparation

In `crates/cli/src/lib.rs` replace with the below.

```rust
match (
    matches.is_present(FLAG_OPTIMIZE),
    matches.is_present(FLAG_OPT_SIZE),
    matches.is_present(FLAG_DEV),
) {
    (true, false, false) => OptLevel::Optimize,
    (false, true, false) => OptLevel::Size,
    (false, false, true) => OptLevel::Development,
    (false, false, false) => OptLevel::Normal,
    _ => user_error!("build can be only one of `--dev`, `--optimize`, or `--opt-size`"),
}
```

Change `"i386-linux-musl"` to `"wasm32-wasi"` on line 373 in `crates/compiler/build/src/link.rs`

## Build using Roc cli

From Roc repository use `% cargo run -- build --target wasm32 ../roc-serverless/examples/echo.roc` to build the WASM file.

## Run using a WASM runtime

`% wasmer run examples/echo.wasm`