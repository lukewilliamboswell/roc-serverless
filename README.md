# Roc platform for Serverless Functions

Work In Progress

A platform to build serverless functions using Roc.



## Build using Roc cli

First, change `"i386-linux-musl"` to `"wasm32-wasi"` on line 373 in `crates/compiler/build/src/link.rs`

This should work but doesn't due to zig lib [issue](https://github.com/roc-lang/roc/issues/4992) `% roc build --target wasm32 examples/echo.roc`

Use `% cargo run -- build --target wasm32 ../roc-serverless/examples/echo.roc` instead from the Roc repository

## Run using a WASM runtime

`% wasmer run examples/echo.wasm`