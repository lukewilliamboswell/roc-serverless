platform "serverless"
    requires {} { main : List U8 -> List U8 }
    exposes []
    packages {}
    imports []
    provides [mainForHost]

mainForHost : List U8 -> List U8
mainForHost = main