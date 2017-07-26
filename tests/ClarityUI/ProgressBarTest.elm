module ClarityUI.ProgressBarTest exposing (..)

import ClarityUI.ProgressBar as ProgressBar
import Html exposing (div)
import Html.Attributes as Attributes exposing (rel, href, src)
import Test exposing (Test, test, fuzz, describe)
import Fuzz exposing (string)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, class)


progressBarTest : Test
progressBarTest =
    describe "Test ProgressBar Module"
        [ test "Default Progress Bar" <|
            \() ->
                ProgressBar.baseProgress Nothing ProgressBar.None ProgressBar.Default 50
                    |> Query.fromHtml
                    |> Query.has [ class "progress" ]
        , test "Success Primary" <|
            \() ->
                ProgressBar.baseProgress Nothing ProgressBar.None ProgressBar.Success 50
                    |> Query.fromHtml
                    |> Query.has [ class "progress" ]
        ]
