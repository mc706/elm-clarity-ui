module ClarityUI.Layout exposing (LayoutComponents, layout)

{-| Clarity Application Layout.

Defines the Page Layout and basic structure.

For more on Clarity Application Layout: <https://vmware.github.io/clarity/documentation/app-layout>


# Usage

@docs layout


# Options

@docs LayoutComponents

-}

import Html exposing (Html, div, nav)
import Html.Attributes exposing (class)


{-| Layout Component Options.

Pass the body of each section to its property. Recommend calling functions that return them
inside of each of the.

-}
type alias LayoutComponents m =
    { alerts : List (Html m)
    , header : Html m
    , subnav : List (Html m)
    , sidenav : List (Html m)
    , main : List (Html m)
    }


{-| Main Layout Entry Point.

Pass a LayoutComponents Record to it to layout the bas application.


## Use

        import Html exposing (Html, div)
        import ClarityUI.Layout as Layout
        import ClarityUI.Header as Header

        view : Model -> Html msg
        view model =
            Layout.layout
                { alerts = []
                , header = viewHeader model
                , subnav = viewSubnav model
                , sidenav = viewSidenav model
                , main = mainContent model
                }

-}
layout : LayoutComponents msg -> Html msg
layout { alerts, header, subnav, sidenav, main } =
    let
        appLayout =
            [ div [ class "alert alert-app-level" ] alerts
            , header
            , nav [ class "subnav" ] subnav
            , div [ class "content-container" ]
                [ div [ class "content-area" ] main
                , nav [ class "sidenav" ] sidenav
                ]
            ]
    in
        div [ class "main-container" ] appLayout
