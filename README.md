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
- [ ] Example for `Content-type: application/json; charset=utf-8` 
- [ ] Update platform to `main: Str -> Str` to handle requests

## Using CloudFare

Some cloud providers support WASI for serverless functions. 

Cloudfare Workers are easy to get started and have a generous Free tier. Below is an example of how to setup a worker using the Cloudfare Wrangler cli.

```
# Install wrangler
npm install -g wrangler

# Login to Cloudfare account
npx wrangler@wasm login

# Publish worker - note if you haven't already you need to register a workers.dev subdomain before publishing to workers.dev
npx wrangler@wasm publish --name application-json --compatibility-date 2023-03-28 examples/application_json.wasm

# Test worker
curl https://application-json.[your worker subdomain here].workers.dev
```