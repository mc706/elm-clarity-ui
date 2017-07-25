# elm-clarity-ui

[![Build Status](https://travis-ci.org/mc706/elm-clarity-ui.svg?branch=master)](https://travis-ci.org/mc706/elm-clarity-ui)

Elm Package for Wrapping VM-Ware's Clarity UI. 

## Getting Started

* Add `mc706/elm-clarity-ui` to your `elm-package.json`

```elm
module Main exposing (..)

import ClarityUI.CDN as CDN
import ClarityUI.Layout as Layout


view : Model -> Html Msg
view model =
    div []
        [ ClarityUI.CDN.styles
        , ClarityUI.Layout.layout
            { alerts = [ viewAlerts model ]
            , header = [ viewHeader model ]
            , subnav = [ viewSubnav model ]
            , sidenav = [ viewSidenav model ]
            , main = [ mainContent model ]
            }
        ]


viewAlerts : Model -> Html Msg
viewAlerts model =
    div [] []


viewHeader : Model -> Html Msg
viewHeader model =
    div [] []


viewSubnav : Model -> Html Msg
viewSubnav model =
    div [] []


mainContent : Model -> Html Msg
mainContent model =
    div [] []


viewSidenav : Model -> Html Msg
viewSidenav model =
    div [] []

```

## Inspiration
Heavily influenced by [elm-bootstrap](http://elm-bootstrap.info/) and [elm-mdl](https://debois.github.io/elm-mdl/).



