module ClarityUI.LayoutTest exposing (..)

import ClarityUI.Layout as Layout
import Html exposing (div)
import Test exposing (Test, test, describe)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag, class, classes)


testLayout : Test
testLayout =
    let
        html =
            Layout.layout
                { alerts = [ div [] [] ]
                , header = [ div [] [] ]
                , subnav = [ div [] [] ]
                , sidenav = [ div [] [] ]
                , main = [ div [] [] ]
                }
    in
        describe "Empty Layout"
            [ test "Expect alerts section" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.find [ class "alert" ]
                        |> Query.has [ class "alert-app-level" ]
            ]
