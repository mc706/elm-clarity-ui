module ClarityUI.IconTest exposing (..)

import ClarityUI.Icon as Icon
import Html exposing (div)
import Html.Attributes exposing (rel, href, src)
import Test exposing (Test, test, fuzz, describe)
import Fuzz exposing (string)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag, attribute)


iconsTest : Test
iconsTest =
    describe "Test Icons Helper"
        [ test "Icons to render an icon" <|
            \() ->
                Icon.icon "vm-bug"
                    |> Query.fromHtml
                    |> Query.has [ attribute <| Html.Attributes.attribute "shape" "vm-bug" ]
        , fuzz string "Icon should render any string" <|
            \randomString ->
                Icon.icon (toString randomString)
                    |> Query.fromHtml
                    |> Query.has [ attribute <| Html.Attributes.attribute "shape" (toString randomString) ]
        ]
