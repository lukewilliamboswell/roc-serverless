app "echo"
    packages { pf: "../platform/main.roc" }
    imports []
    provides [main] to pf

main = \_ -> 
    Str.toUtf8 "Goodbye!\n"
