module ClarityUI.SpinnerTest exposing (..)

import ClarityUI.Spinner as Spinner
import Html exposing (div, header)
import Test exposing (Test, test, describe)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag, class, classes)


testSpinner : Test
testSpinner =
    describe "Spinner Module"
        [ test "Page Spinner" <|
            \() ->
                Spinner.spinner
                    |> Query.fromHtml
                    |> Query.has [ class "spinner" ]
        , test "Inline Spinner" <|
            \() ->
                Spinner.inlineSpinner
                    |> Query.fromHtml
                    |> Query.has [ class "spinner-inline" ]
        , test "Inverse Spinner" <|
            \() ->
                Spinner.inverseSpinner
                    |> Query.fromHtml
                    |> Query.has [ class "spinner-inverse" ]
        , test "Sized Spinner" <|
            \() ->
                Spinner.sizedSpinner Spinner.Medium
                    |> Query.fromHtml
                    |> Query.has [ class "spinner-md" ]
        ]
