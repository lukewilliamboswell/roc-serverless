# Roc platform for Serverless Functions

Work In Progress - A platform to build serverless functions using Roc.

## Step 1 - Work Around compiler bug

Change `"i386-linux-musl"` to `"wasm32-wasi"` on line 373 in `crates/compiler/build/src/link.rs`

## Step 2 - Build using Roc cli

From Roc repository use `% cargo run -- build --target wasm32 ../roc-serverless/examples/echo.roc` to build the WASM file.

## Step 3 - Run using a WASM runtime

`% wasmer run examples/echo.wasm`