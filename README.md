# elm-clarity-ui

[![Build Status](https://travis-ci.org/mc706/elm-clarity-ui.svg?branch=master)](https://travis-ci.org/mc706/elm-clarity-ui)

Elm Package for Wrapping VM-Ware's Clarity UI. 

## Getting Started

* Add `mc706/elm-clarity-ui` to your `elm-package.json`

```elm
module Main exposing (..)

import ClarityUI.CDN as CDN
import ClarityUI.Grid as Grid

view : Model -> Html Msg
view model = 
  Grid.container []
    [ CDN.styles
    , CDN.icons
    , layout model
    , CDN.iconsJS
    ]
```

## Inspiration
Heavily influenced by [elm-bootstrap](http://elm-bootstrap.info/) and [elm-mdl](https://debois.github.io/elm-mdl/).



