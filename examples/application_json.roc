app "application_json"
    packages { 
        pf: "../platform/main.roc",
    }
    imports [
        Jason.{jsonWithOptions}
    ]
    provides [main] to pf

main = 
    encoder = jsonWithOptions { fieldNameMapping: PascalCase }
    
    exampleRecord
    |> Encode.toBytes encoder
    |> Str.fromUtf8
    |> Result.withDefault "Fatal error encoding json"

exampleRecord = {
    image: {
        width: 800,
        height: 600,
        title: "View from 15th Floor",
        thumbnail: {
            url: "http://www.example.com/image/481989943",
            height: 125,
            width: 100,
        },
        animated: Bool.false,
        ids: [116, 943, 234, 38793],
    },
}