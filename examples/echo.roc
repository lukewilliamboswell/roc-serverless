app "echo"
    packages { 
        pf: "../platform/main.roc",
    }
    imports []
    provides [main] to pf

# TODO make this an ECHO server when platform is updated
main : Str -> Str
main = \_ -> "Hello"

