# Roc platform for Serverless Functions

Work In Progress - A platform to build serverless functions using Roc.

```sh
# From roc repository (unitl [#5333](https://github.com/roc-lang/roc/pull/5333) is merged)
cargo run -- build --target wasm32 ../roc-serverless/examples/echo.roc

# Run example locally
wasmer run examples/echo.wasm
```

## Future work

- [x] Minimal example compiled to WASI
- [ ] Support I/O using `Content-type: application/json; charset=utf-8` 