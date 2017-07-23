module ClarityUI.CDNTest exposing (..)

import ClarityUI.CDN as CDN
import Html exposing (div)
import Html.Attributes exposing (rel, href, src)
import Test exposing (Test, test, describe)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag, attribute)


stylesTest : Test
stylesTest =
    describe "Test Styles CDN"
        [ test "CDN.styles to include a link" <|
            \() ->
                CDN.styles
                    |> Query.fromHtml
                    |> Query.has [ attribute <| rel "stylesheet" ]
        ]


iconsTest : Test
iconsTest =
    describe "Test Icons CDN"
        [ test "CDN.icons to include a link" <|
            \() ->
                CDN.icons
                    |> Query.fromHtml
                    |> Query.has [ attribute <| rel "stylesheet" ]
        ]


iconsJSTest : Test
iconsJSTest =
    describe "Test Icons CDN Scripts"
        [ test "CDN.iconsJS to include a script" <|
            \() ->
                CDN.iconsJS
                    |> Query.fromHtml
                    |> Query.has [ attribute <| src "https://unpkg.com/clarity-icons@latest/clarity-icons.min.js" ]
        ]
