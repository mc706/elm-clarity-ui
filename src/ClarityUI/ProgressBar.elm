module ClarityUI.ProgressBar exposing (baseProgress, ProgressAnimation(..), ProgressColor(..), progressBar, labeledProgress)

{-|


# Clarity UI Progress bars

Wraps a progress bar in a helper function.

For more on Clarity UI Progress Bars: <https://vmware.github.io/clarity/documentation/progress>


## Use

@docs baseProgress


## Shorthands

@docs progressBar, labeledProgress


## Options

@docs ProgressColor, ProgressAnimation

-}

import Html exposing (Html, progress, div, span, text)
import Html.Attributes as Attributes exposing (class, classList, attribute, max, min, value)


{-| Set Color
-}
type ProgressColor
    = Success
    | Warning
    | Danger
    | Default


{-| Set Animation Type
-}
type ProgressAnimation
    = None
    | Fade
    | Flash
    | FlashDanger
    | FlashFade
    | FlashDangerFade
    | Loop
    | Static


{-| Main entry point to progress bars
-}
baseProgress : Maybe String -> ProgressAnimation -> ProgressColor -> Int -> Html msg
baseProgress label animation color bar_value =
    let
        animationClasses =
            case animation of
                None ->
                    []

                Fade ->
                    [ ( "progress-fade", True ) ]

                Flash ->
                    [ ( "flash", True ) ]

                FlashDanger ->
                    [ ( "flash-danger", True ) ]

                FlashFade ->
                    [ ( "flash", True ), ( "progress-fade", True ) ]

                FlashDangerFade ->
                    [ ( "flash-danger", True ), ( "progress-fade", True ) ]

                Loop ->
                    [ ( "loop", True ) ]

                Static ->
                    [ ( "static", True ) ]

        colorClasses =
            case color of
                Success ->
                    [ ( "success", True ) ]

                Warning ->
                    [ ( "warning", True ) ]

                Danger ->
                    [ ( "Danger", True ) ]

                Default ->
                    []

        classes =
            animationClasses ++ colorClasses

        body =
            case label of
                Just label ->
                    [ progress
                        [ Attributes.max "100"
                        , Attributes.min "0"
                        , value <| toString bar_value
                        , attribute "data-displayval" <|
                            (toString bar_value)
                                ++ "%"
                        ]
                        []
                    , span [] [ text label ]
                    ]

                Nothing ->
                    [ progress
                        [ Attributes.max "100"
                        , Attributes.min "0"
                        , value <| toString bar_value
                        , attribute "data-displayval" <|
                            (toString bar_value)
                                ++ "%"
                        ]
                        []
                    ]
    in
        div
            [ class "progress", classList classes ]
            body


{-| Shorthand for a default progress bar
-}
progressBar : Int -> Html msg
progressBar value =
    baseProgress Nothing None Default value


{-| Shorthand for a labeled default progress bar
-}
labeledProgress : String -> Int -> Html msg
labeledProgress label value =
    baseProgress (Just label) None Default value
