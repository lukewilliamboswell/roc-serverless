app "application_json"
    packages {
        pf: "../platform/main.roc",
    }
    imports [
        Jason.{ jsonWithOptions },
    ]
    provides [main] to pf

main =
    encoder = jsonWithOptions { fieldNameMapping: PascalCase }

    when Encode.toBytes exampleRecord encoder |> Str.fromUtf8 is
        Ok jsonStr ->
            [
                "HTTP/1.1 200 OK\r\n",
                "Content-Type: application/json; charset=utf-8\r\n",
                "\r\n",
                jsonStr,
            ]
            |> Str.joinWith ""

        Err _ ->
            "HTTP/1.1 500 Internal Server Error\r\n"

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
