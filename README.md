# Roc platform for Serverless Functions

Experimental platform to build serverless functions using Roc.

STATUS: Broken with the below (last checked 3 Nov 2023)
```
roc-serverless % ../roc/target/release/roc build --target=wasm32 examples/echo.roc
🔨 Rebuilding platform...
LLD Link... warning(link): unexpected LLD stderr:
wasm-ld: warning: function signature mismatch: roc__mainForHost_1_exposed_generic
>>> defined as (i32, i32) -> void in lto.tmp
>>> defined as (i32) -> void in /Users/luke/.cache/zig/o/5eb3226a47634949bbbffa03abc90140/roc_app5xoOZH.o

0 errors and 0 warnings found in 440 ms while successfully building:

    examples/echo.wasm
luke@192-168-1-105 roc-serverless % wasmer run examples/echo.wasm                            
error: failed to run `examples/echo.wasm`
│   1: RuntimeError: unreachable
╰─▶ 2: unreachable

```

## CloudFare Notes

Cloudfare Workers are easy to get started and have a generous Free tier. Below is an example of how to setup a worker using the Cloudfare Wrangler cli.

```
# Install wrangler
npm install -g wrangler

# Login to Cloudfare account
npx wrangler@wasm login

# Publish worker - note if you haven't already you need to register a workers.dev subdomain before publishing to workers.dev
npx wrangler@wasm publish --name application-json --compatibility-date 2023-03-28 examples/application_json.wasm

# Test worker
% curl -X POST https://application-json.[YOUR WORKER SUBDOMAIN].workers.dev
HTTP/1.1 200 OK
Content-Type: application/json; charset=utf-8

{"Image":{"Animated":false,"Height":600,"Ids":[116,943,234,38793],"Thumbnail":{"Height":125,"Url":"http:\/\/www.example.com\/image\/481989943","Width":100},"Title":"View from 15th Floor","Width":800}}%  
```
