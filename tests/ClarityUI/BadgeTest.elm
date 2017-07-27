module ClarityUI.BadgeTest exposing (..)

import ClarityUI.Badge as Badge
import Html exposing (div)
import Html.Attributes as Attributes exposing (rel, href, src)
import Test exposing (Test, test, fuzz, describe)
import Fuzz exposing (string)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, class)


badgeTest : Test
badgeTest =
    describe "Test Badge Module"
        [ test "Default Badge" <|
            \() ->
                Badge.baseBadge Badge.None 50
                    |> Query.fromHtml
                    |> Query.has [ class "badge" ]
        , test "Success Badge" <|
            \() ->
                Badge.baseBadge Badge.Success 50
                    |> Query.fromHtml
                    |> Query.has [ class "badge-success" ]
        ]
