module ClarityUI.CDN exposing (styles, icons, iconsJS, iconsCEP)

{-| CDN module.
Includes the clarity assets from a CDN for easy use with Elm Reactor.

@docs styles, icons, iconsJS, iconsCEP

-}

import Html exposing (Html, node)
import Html.Attributes exposing (rel, href, src)


{-| Adds a link to an [cdnjs](https://cdnjs.com/libraries/clarity-ui) mirror of the clarify-ui css

    import ClarityUI.CDN

    view : Model -> Html Msg
    view model =
        div []
            [ CDN.styles -- css embedded inline
            ]

-}
styles : Html msg
styles =
    node
        "link"
        [ rel "stylesheet"
        , href "https://cdnjs.cloudflare.com/ajax/libs/clarity-ui/0.10.14/clarity-ui.min.css"
        ]
        []


{-| Adds a link to an [cdnjs](https://cdnjs.com/libraries/clarity-ui) mirror of the clarify-icons css
-}
icons : Html msg
icons =
    node
        "link"
        [ rel "stylesheet"
        , href "https://cdnjs.cloudflare.com/ajax/libs/clarity-icons/0.10.14/clarity-icons.min.css"
        ]
        []


{-| Adds a script to an [cdnjs](https://cdnjs.com/libraries/clarity-ui) mirror of the clarify-icons js
-}
iconsJS : Html msg
iconsJS =
    node
        "script"
        [ src "https://cdnjs.cloudflare.com/ajax/libs/clarity-icons/0.10.14/clarity-icons.min.js" ]
        []


{-| Add custom element polyfill for icons
-}
iconsCEP : Html msg
iconsCEP =
    node
        "script"
        [ src "https://cdnjs.cloudflare.com/ajax/libs/webcomponentsjs/1.0.19/custom-elements-es5-adapter.js" ]
        []
