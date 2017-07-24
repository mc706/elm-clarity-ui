module ClarityUI.CardTest exposing (..)

import ClarityUI.Card as Card
import Html exposing (div)
import Html.Attributes exposing (rel, href, src)
import Test exposing (Test, test, fuzz, describe)
import Fuzz exposing (string)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, class)


cardTest : Test
cardTest =
    let
        html =
            Card.card (Just "Test") [ [ div [] [] ] ] [ div [] [] ]
    in
        describe "Test Cards Module"
            [ test "Card Renders" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.find [ class "card-header" ]
                        |> Query.has [ text "Test" ]
            ]
