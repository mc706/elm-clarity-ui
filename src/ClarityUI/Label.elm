module ClarityUI.Label exposing (baseLabel, LabelColor(..), label, clickableLabel, warningLabel, successLabel, infoLabel, dangerLabel)

{-|


# Clarity UI Label

For more documentation on clarity ui labels : <https://vmware.github.io/clarity/documentation/labels>


## Use

@docs baseLabel


## Shorthand

@docs label, clickableLabel, successLabel, infoLabel, warningLabel, dangerLabel


## Options

@docs LabelColor

-}

import Html exposing (Html, span, a)
import Html.Attributes as Attributes exposing (class, classList)


{-| Label Colors
-}
type LabelColor
    = None
    | Success
    | Info
    | Warning
    | Danger


{-| Main entry point for label.
-}
baseLabel : LabelColor -> Bool -> List (Html.Attribute msg) -> List (Html msg) -> Html msg
baseLabel color clickable properties body =
    let
        classes =
            case color of
                None ->
                    []

                Success ->
                    [ ( "label-success", True ) ]

                Info ->
                    [ ( "label-info", True ) ]

                Warning ->
                    [ ( "label-warning", True ) ]

                Danger ->
                    [ ( "label-danger", True ) ]

        element =
            case clickable of
                True ->
                    a

                False ->
                    span
    in
        element (properties ++ [ class "label", classList ([ ( "clickable", clickable ) ] ++ classes) ]) body


{-| Short hand for a clickable label
-}
clickableLabel : List (Html.Attribute msg) -> List (Html msg) -> Html msg
clickableLabel properties body =
    baseLabel None True properties body


{-| Shorthand for a default label
-}
label : List (Html msg) -> Html msg
label body =
    baseLabel None False [] body


{-| Shorthand for a success label
-}
successLabel : List (Html msg) -> Html msg
successLabel body =
    baseLabel Success False [] body


{-| Shorthand for a info label
-}
infoLabel : List (Html msg) -> Html msg
infoLabel body =
    baseLabel Info False [] body


{-| Shorthand for a warning label
-}
warningLabel : List (Html msg) -> Html msg
warningLabel body =
    baseLabel Warning False [] body


{-| Shorthand for a danger label
-}
dangerLabel : List (Html msg) -> Html msg
dangerLabel body =
    baseLabel Danger False [] body
