module ClarityUI.HeaderTest exposing (..)

import ClarityUI.Header as Header exposing (HeaderColor(..))
import Html exposing (div, header)
import Test exposing (Test, test, describe)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag, class, classes)


testHeader : Test
testHeader =
    let
        html =
            Header.header HC6
                { branding = { icon = "vm-bug", title = "test" }
                , nav = []
                , search = []
                , actions = []
                }
    in
        describe "Basic Header"
            [ test "base element to be a header" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.children [ tag "div" ]
                        |> Query.count (Expect.equal 4)
            ]
