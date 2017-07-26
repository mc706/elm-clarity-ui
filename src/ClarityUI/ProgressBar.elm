module ClarityUI.ProgressBar exposing (..)

{-|


# Clarity UI Progress bars

Wraps a progress bar in a helper function.

FOr more on Clarity UI Progress Bars: <https://vmware.github.io/clarity/documentation/progress>

-}

import Html exposing (Html, progress)
import Html.Attributes exposing (class, classList)


type ProgressColor
    = Success
    | Warning
    | Danger


type ProgressAnimation
    = Fade
    | Flash
    | FlashDanger
    | Loop
    | Static


baseProgress : Maybe String -> Bool -> Bool -> Bool -> ProgressColor -> Html msg
