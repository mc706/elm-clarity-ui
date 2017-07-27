module ClarityUI.LabelTest exposing (..)

import ClarityUI.Label as Label
import Html exposing (div, text)
import Html.Attributes as Attributes exposing (rel, href, src)
import Test exposing (Test, test, fuzz, describe)
import Fuzz exposing (string)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, class)


labelTest : Test
labelTest =
    describe "Test Label Module"
        [ test "Default Label" <|
            \() ->
                Label.baseLabel Label.None False [] [ Html.text "Test" ]
                    |> Query.fromHtml
                    |> Query.has [ class "label" ]
        , test "Success Label" <|
            \() ->
                Label.baseLabel Label.Success False [] [ Html.text "Test" ]
                    |> Query.fromHtml
                    |> Query.has [ class "label-success" ]
        ]
