module ClarityUI.SubnavTest exposing (..)

import ClarityUI.Subnav as Subnav
import Html exposing (div, header)
import Test exposing (Test, test, describe)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag, class, classes)


testSubnav : Test
testSubnav =
    let
        html =
            Subnav.subnav
                [ { link = "#", text = "Example1" }
                , { link = "#", text = "Example2" }
                , { link = "#", text = "Example3" }
                , { link = "#", text = "Example4" }
                ]
    in
        describe "Basic Subnav"
            [ test "nav to have 4 elements" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.children [ tag "li" ]
                        |> Query.count (Expect.equal 4)
            ]
