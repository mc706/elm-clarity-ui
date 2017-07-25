module ClarityUI.Subnav exposing (subnav, NavItem)

{-| Clarity Header Subnav

For more documenation on the clarity subnav : <https://vmware.github.io/clarity/documentation/header#subnav>


# Usage

@docs subnav


# Data

@docs NavItem

-}

import Html exposing (Html, ul, li)
import Html.Attributes exposing (class, href)


{-| NavItem

Describes A single nav element.

-}
type alias NavItem =
    { link : String
    , text : String
    }


{-| Main subnav entry point.

Takes a list of NavItems and renders out a subnav compatible ul

-}
subnav : List NavItem -> Html msg
subnav navItems =
    ul [ class "nav" ] <|
        List.map
            (\item ->
                li [ class "nav-link", href item.link ] [ Html.text item.text ]
            )
            navItems
