module ClarityUI.Header exposing (header, HeaderSections, HeaderColor(..), Branding)

{-| Clarity Header.

Helper function for producing the header of the application.

For mor documentation on Clarity Header: <https://vmware.github.io/clarity/documentation/header>


# Usage

@docs header


# Options

@docs HeaderSections, Branding, HeaderColor

-}

import Html exposing (Html, div, text, a)
import Html.Attributes exposing (class, classList)
import ClarityUI.Icon as Icon


{-| Sets the Color Pallette of the header
-}
type HeaderColor
    = HC1
    | HC2
    | HC3
    | HC4
    | HC5
    | HC6
    | HC7


{-| Branding Section of the header.
-}
type alias Branding =
    { icon : String
    , title : String
    }


{-| Determines the structure of the header
-}
type alias HeaderSections m =
    { branding : Branding
    , nav : List (Html m)
    , search : List (Html m)
    , actions : List (Html m)
    }


{-| Main entry point for header.

Takes a HeaderSections object and returns a clarity header.

    import ClarityUI.Header as Header

-}
header : HeaderColor -> HeaderSections msg -> Html msg
header color { branding, nav, search, actions } =
    let
        colorClass =
            case color of
                HC1 ->
                    "header-1"

                HC2 ->
                    "header-2"

                HC3 ->
                    "header-3"

                HC4 ->
                    "header-4"

                HC5 ->
                    "header-5"

                HC6 ->
                    "header-6"

                HC7 ->
                    "header-7"
    in
        Html.header
            [ classList [ ( "header", True ), ( colorClass, True ) ] ]
            [ div
                [ class "branding" ]
                [ a []
                    [ Icon.iconMd branding.icon
                    , div [ class "title" ] [ text branding.title ]
                    ]
                ]
            , div [ class "header-nav" ] nav
            , div [ class "search" ] search
            , div [ class "header-actions" ] actions
            ]
