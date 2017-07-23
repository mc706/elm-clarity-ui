module ClarityUI.AlertTest exposing (..)

import ClarityUI.Alert as Alert
import Html exposing (div)
import Test exposing (Test, test, describe)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag, class, classes)


inlineAlerts : Test
inlineAlerts =
    let
        html =
            div []
                [ Alert.alertDanger { text = "Test Danger", actions = [] }
                , Alert.alertWarning { text = "Test Warning", actions = [] }
                , Alert.alertInfo { text = "Test Info", actions = [] }
                , Alert.alertSuccess { text = "Test Success", actions = [] }
                ]
    in
        describe "Inline Alerts"
            [ test "Expect 4 alerts" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.findAll [ class "alert" ]
                        |> Query.count (Expect.equal 4)
            , test "Expect Danger Alert" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.find [ class "alert-danger" ]
                        |> Query.has [ text "Test Danger" ]
            , test "Expect Warning Alert" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.find [ class "alert-warning" ]
                        |> Query.has [ text "Test Warning" ]
            , test "Expect Info Alert" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.find [ class "alert-info" ]
                        |> Query.has [ text "Test Info" ]
            , test "Expect Success Alert" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.find [ class "alert-success" ]
                        |> Query.has [ text "Test Success" ]
            ]


appAlerts : Test
appAlerts =
    let
        html =
            div []
                [ Alert.alertAppDanger { text = "Test App Danger", actions = [] }
                , Alert.alertAppWarning { text = "Test App Warning", actions = [] }
                , Alert.alertAppInfo { text = "Test App Info", actions = [] }
                , Alert.alertAppSuccess { text = "Test App Success", actions = [] }
                ]
    in
        describe "App Alerts"
            [ test "Expect 4 alerts" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.findAll [ class "alert" ]
                        |> Query.count (Expect.equal 4)
            , test "Expect App Danger Alert" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.find [ class "alert-danger" ]
                        |> Query.has [ text "Test App Danger" ]
            , test "Expect Warning Alert" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.find [ class "alert-warning" ]
                        |> Query.has [ text "Test App Warning" ]
            , test "Expect Info Alert" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.find [ class "alert-info" ]
                        |> Query.has [ text "Test App Info" ]
            , test "Expect Success Alert" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.find [ class "alert-success" ]
                        |> Query.has [ text "Test App Success" ]
            ]
