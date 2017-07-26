module ClarityUI.ButtonTest exposing (..)

import ClarityUI.Button as Button
import Html exposing (div)
import Html.Attributes as Attributes exposing (rel, href, src)
import Test exposing (Test, test, fuzz, describe)
import Fuzz exposing (string)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, class)


buttonTest : Test
buttonTest =
    describe "Test Buttons Module"
        [ test "Solid Primary" <|
            \() ->
                Button.baseButton Button.Solid Button.Primary False False [ Attributes.class "test-button" ] [ Html.text "Test" ]
                    |> Query.fromHtml
                    |> Query.has [ class "btn-primary" ]
        , test "Solid Success" <|
            \() ->
                Button.baseButton Button.Solid Button.Success False False [ Attributes.class "test-button" ] [ Html.text "Test" ]
                    |> Query.fromHtml
                    |> Query.has [ class "btn-success" ]
        , test "Solid Warning" <|
            \() ->
                Button.baseButton Button.Solid Button.Warning False False [ Attributes.class "test-button" ] [ Html.text "Test" ]
                    |> Query.fromHtml
                    |> Query.has [ class "btn-warning" ]
        , test "Solid Danger" <|
            \() ->
                Button.baseButton Button.Solid Button.Danger False False [ Attributes.class "test-button" ] [ Html.text "Test" ]
                    |> Query.fromHtml
                    |> Query.has [ class "btn-danger" ]
        , test "Outline Primary" <|
            \() ->
                Button.baseButton Button.Outline Button.Primary False False [ Attributes.class "test-button" ] [ Html.text "Test" ]
                    |> Query.fromHtml
                    |> Query.has [ class "btn-outline" ]
        , test "Outline Success" <|
            \() ->
                Button.baseButton Button.Outline Button.Success False False [ Attributes.class "test-button" ] [ Html.text "Test" ]
                    |> Query.fromHtml
                    |> Query.has [ class "btn-success-outline" ]
        , test "Outline Warning" <|
            \() ->
                Button.baseButton Button.Outline Button.Warning False False [ Attributes.class "test-button" ] [ Html.text "Test" ]
                    |> Query.fromHtml
                    |> Query.has [ class "btn-warning-outline" ]
        , test "Outline Danger" <|
            \() ->
                Button.baseButton Button.Outline Button.Danger False False [ Attributes.class "test-button" ] [ Html.text "Test" ]
                    |> Query.fromHtml
                    |> Query.has [ class "btn-danger-outline" ]
        , test "Flat" <|
            \() ->
                Button.baseButton Button.Flat Button.Danger False False [ Attributes.class "test-button" ] [ Html.text "Test" ]
                    |> Query.fromHtml
                    |> Query.has [ class "btn-link" ]
        ]
