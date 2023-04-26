app "echo"
    packages { pf: "../platform/main.roc" }
    imports []
    provides [main] to pf

main = "Ahoy there!\n"
