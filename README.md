# Roc platform for Serverless Functions

Work In Progress

A platform to build serverless functions using Roc.

## Build using Roc cli

`% roc build --target wasm32 examples/echo.roc`

## Run using a WASM runtime

`% wasmer run examples/echo.wasm`