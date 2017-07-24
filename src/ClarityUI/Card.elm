module ClarityUI.Card exposing (baseCard, card, clickableCard)

{-| Wrapper around Clarity Cards

for More on clarity cards: <https://vmware.github.io/clarity/documentation/cards>


# Methods

@docs baseCard, card, clickableCard

-}

-- lib

import Html exposing (Html, div, text)
import Html.Attributes exposing (class, classList)


{-| Base Card Function.
Implements clarity card.

Documentation about clarity card : <https://vmware.github.io/clarity/documentation/cards>

-}
baseCard : Maybe String -> List (List (Html msg)) -> List (Html msg) -> Bool -> Html msg
baseCard header body footer clickable =
    let
        showCardBlock : List (Html msg) -> Html msg
        showCardBlock inner =
            div [ class "card-block" ] inner

        cardHeader =
            case header of
                Nothing ->
                    []

                Just header ->
                    [ div [ class "card-header" ] [ text header ] ]

        cardBlocks =
            List.map showCardBlock body

        cardFooter =
            if List.length footer > 0 then
                [ div [ class "card-footer" ] footer ]
            else
                []

        contents =
            List.concat [ cardHeader, cardBlocks, cardFooter ]
    in
        div
            [ classList [ ( "card", True ), ( "clickable", clickable ) ] ]
            contents


{-| Card Function
Curried Base Card Function.
-}
card : Maybe String -> List (List (Html msg)) -> List (Html msg) -> Html msg
card header body footer =
    baseCard header body footer False


{-| Clickable Card Function
Curried Base Card Function for a clickable card.
-}
clickableCard : Maybe String -> List (List (Html msg)) -> List (Html msg) -> Html msg
clickableCard header body footer =
    baseCard header body footer True
