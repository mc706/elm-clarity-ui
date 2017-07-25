module ClarityUI.Sidenav exposing (sidenav, NavLink, NavGroup, NavItem(..))

{-| Clarity Sidenav

For more documentation on clairty sidenav: <https://vmware.github.io/clarity/documentation/sidenav>


# Use

@docs sidenav


# Data

@docs NavLink, NavGroup, NavItem

-}

import Html exposing (Html, section, a, text, input, label, ul, li)
import Html.Attributes exposing (class, href, classList, id, type_, for)


{-| A Single nav link
-}
type alias NavLink =
    { link : String
    , text : String
    }


{-| A NavGroup is a grouped set of links with a section label,
if it is collapsible, then the menu can be collapsed.
-}
type alias NavGroup =
    { label : String
    , id : String
    , navList : List NavLink
    , collapsible : Bool
    }


{-| Union type of NavLink and NavGroup
-}
type NavItem
    = Link NavLink
    | Group NavGroup


{-| Main sidenav entry point.

Takes a list of Nav items and renders out a layout compliant sidenav

-}
sidenav : List NavItem -> Html msg
sidenav items =
    section [ class "sidenav-content" ] <| List.map viewNavItem items


viewNavItem : NavItem -> Html msg
viewNavItem item =
    case item of
        Link item ->
            viewNavLink item

        Group item ->
            viewNavGroup item


viewNavLink : NavLink -> Html msg
viewNavLink link =
    a [ class "nav-link", href link.link ] [ text link.text ]


viewNavGroup : NavGroup -> Html msg
viewNavGroup group =
    section
        [ classList [ ( "nav-group", True ), ( "collapsible", group.collapsible ) ] ]
        [ input [ id group.id, type_ "checkbox" ] []
        , label [ for group.id ] [ text group.label ]
        , ul [ class "nav-list" ] <| List.map (\item -> li [] [ viewNavLink item ]) group.navList
        ]
