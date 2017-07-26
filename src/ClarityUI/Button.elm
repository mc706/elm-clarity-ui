module ClarityUI.Button exposing (baseButton, ButtonType(..), ButtonColor(..), solidButton, outlineButton, flatButton)

{-|


## Clarity UI Buttons.

Wraps buttons in simple methods.

For more documentation on clarity ui buttons: <https://vmware.github.io/clarity/documentation/buttons>


# Base

@docs baseButton


# Shortcuts

@docs solidButton, outlineButton, flatButton


# Options

@docs ButtonType, ButtonColor

-}

import Html exposing (Html, button, text)
import Html.Attributes exposing (classList)


{-| Button Type. See clarity UI for use
-}
type ButtonType
    = Solid
    | Outline
    | Flat


{-| Button Color.
-}
type ButtonColor
    = Primary
    | Success
    | Warning
    | Danger


{-| Base Button Function.
Wrapper around clarity buttons

Documentation for Clarity buttons : <https://vmware.github.io/clarity/documentation/buttons>

-}
baseButton : ButtonType -> ButtonColor -> Bool -> Bool -> List (Html.Attribute msg) -> List (Html msg) -> Html msg
baseButton buttonType color isSmall isBlock properties body =
    let
        buttonClass =
            case buttonType of
                Solid ->
                    case color of
                        Primary ->
                            "btn-primary"

                        Success ->
                            "btn-success"

                        Warning ->
                            "btn-warning"

                        Danger ->
                            "btn-danger"

                Outline ->
                    case color of
                        Primary ->
                            "btn-outline"

                        Success ->
                            "btn-success-outline"

                        Warning ->
                            "btn-warning-outline"

                        Danger ->
                            "btn-danger-outline"

                Flat ->
                    "btn-link"

        props =
            [ classList [ ( "btn", True ), ( buttonClass, True ), ( "btn-sm", isSmall ), ( "btn-block", isBlock ) ] ] ++ properties
    in
        button props body


{-| Shortcut for creating a solid button
-}
solidButton : ButtonColor -> List (Html.Attribute msg) -> List (Html msg) -> Html msg
solidButton color properties body =
    baseButton Solid color False False properties body


{-| Shortcut for creating a outline button
-}
outlineButton : ButtonColor -> List (Html.Attribute msg) -> List (Html msg) -> Html msg
outlineButton color properties body =
    baseButton Outline color False False properties body


{-| Shortcut for creating a flat button
-}
flatButton : ButtonColor -> List (Html.Attribute msg) -> List (Html msg) -> Html msg
flatButton color properties body =
    baseButton Flat color False False properties body
