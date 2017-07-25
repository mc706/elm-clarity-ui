module ClarityUI.Spinner exposing (spinner, inlineSpinner, inverseSpinner, sizedSpinner, SpinnerSize(..))

{-| Clarity UI Spinner.

Create loading spinners for either page or inline.

For more documentation on spinners: <https://vmware.github.io/clarity/documentation/spinners>


# Use

@docs spinner, inlineSpinner, inverseSpinner


# Options

@docs SpinnerSize

-}

import Html exposing (Html, div)
import Html.Attributes exposing (class, classList)


{-| Set a spinners size
-}
type SpinnerSize
    = Small
    | Medium
    | Large


{-| Creates a page spinner
-}
spinner : Html msg
spinner =
    div [ class "spinner" ] []


{-| Create an inline spinner
-}
inlineSpinner : Html msg
inlineSpinner =
    div [ class "spinner spinner-inline" ] []


{-| Create an inverse spinner for pages with dark backgrounds
-}
inverseSpinner : Html msg
inverseSpinner =
    div [ class "spinner spinner-inverse" ] []


{-| Create a spinner of a certain size
-}
sizedSpinner : SpinnerSize -> Html msg
sizedSpinner size =
    let
        sizeClass =
            case size of
                Small ->
                    "spinner-sm"

                Medium ->
                    "spinner-md"

                Large ->
                    "spinner-lg"
    in
        div [ classList [ ( "spinner", True ), ( sizeClass, True ) ] ] []
