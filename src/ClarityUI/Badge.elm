module ClarityUI.Badge exposing (baseBadge, BadgeColor(..), badge)

{-|


# Clarity UI Badge

For more documentation on clarity UI badges: <https://vmware.github.io/clarity/documentation/badges>


## Use

@docs baseBadge


## Shorthands

@docs badge


## Options

@docs BadgeColor

-}

import Html exposing (Html, span, text)
import Html.Attributes exposing (class, classList)


{-| Badge colors
-}
type BadgeColor
    = None
    | Info
    | Success
    | Warning
    | Danger


{-| Main entry point to the badge
-}
baseBadge : BadgeColor -> val -> Html msg
baseBadge color value =
    let
        classes =
            case color of
                None ->
                    []

                Info ->
                    [ ( "badge-info", True ) ]

                Success ->
                    [ ( "badge-success", True ) ]

                Warning ->
                    [ ( "badge-warning", True ) ]

                Danger ->
                    [ ( "badge-danger", True ) ]
    in
        span [ class "badge", classList classes ] [ text <| toString value ]


{-| Shorthand for a default badge
-}
badge : val -> Html msg
badge value =
    baseBadge None value
