module ClarityUI.Icon exposing (baseIcon, icon, iconMd, IconColor, IconSize)

{-| Wrapper around Clarity Icons Custom Element.

For the full Icon Font, see <https://vmware.github.io/clarity/documentation/iconography>


# Use

@docs baseIcon, icon, iconMd


# Options

@docs IconColor, IconSize

-}

import Html exposing (Html, node)
import Html.Attributes exposing (attribute, class)


{-| Icon Color.

Sets the icon color class

-}
type IconColor
    = Default
    | Highlight
    | Error
    | Warning
    | Success
    | Info
    | Inverse


{-| Icon Size.

Sets the Icon Size:

S1 = 12px
S2 = 16px
S3 = 36px
S4 = 48px
S5 = 64px
S6 = 72px

-}
type IconSize
    = S1
    | S2
    | S3
    | S4
    | S5
    | S6


{-| Base Icon Function.
Exposes a lot of the clarity icon capabilities

Documentation on Clarity Icons : <https://vmware.github.io/clarity/documentation/iconography>

-}
baseIcon : IconColor -> IconSize -> String -> Html msg
baseIcon color size name =
    let
        iconClass =
            case color of
                Default ->
                    ""

                Highlight ->
                    "is-highlight"

                Error ->
                    "is-error"

                Warning ->
                    "is-warning"

                Success ->
                    "is-success"

                Info ->
                    "is-info"

                Inverse ->
                    "is-inverse"

        iconSize =
            case size of
                S1 ->
                    "12"

                S2 ->
                    "16"

                S3 ->
                    "36"

                S4 ->
                    "48"

                S5 ->
                    "64"

                S6 ->
                    "72"
    in
        node
            "clr-icon"
            [ attribute "shape" name
            , attribute "size" iconSize
            , class iconClass
            ]
            []


{-| Curried Shortcut Function.

Creates a default size and color Icon.

-}
icon : String -> Html msg
icon =
    baseIcon Default S2


{-| Curried Shortcut Function.

Creates a medium size and default color Icon.

-}
iconMd : String -> Html msg
iconMd =
    baseIcon Default S3
