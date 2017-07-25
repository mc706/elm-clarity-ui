module ClarityUI.SidenavTest exposing (..)

import ClarityUI.Sidenav as Sidenav exposing (NavItem(Link, Group))
import Html exposing (div, header)
import Test exposing (Test, test, describe)
import Expect
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag, class, classes)


testSidenav : Test
testSidenav =
    let
        html =
            Sidenav.sidenav
                [ Link { link = "#", text = "Nav Element 1" }
                , Link { link = "#", text = "Nav Element 2" }
                , Group
                    { id = "tab1"
                    , label = "Collapsible Nav Element"
                    , collapsible = True
                    , navList =
                        [ { link = "#", text = "Link 1" }
                        , { link = "#", text = "Link 2" }
                        ]
                    }
                , Group
                    { id = "tab2"
                    , label = "Default Nav Element"
                    , collapsible = False
                    , navList =
                        [ { link = "#", text = "Link 1" }
                        , { link = "#", text = "Link 2" }
                        , { link = "#", text = "Link 3" }
                        , { link = "#", text = "Link 4" }
                        , { link = "#", text = "Link 5" }
                        , { link = "#", text = "Link 6" }
                        ]
                    }
                ]
    in
        describe "Example Sidenav"
            [ test "Should have 2 base links" <|
                \() ->
                    html
                        |> Query.fromHtml
                        |> Query.children [ class "sidenav-content" ]
                        |> Query.count (Expect.equal 1)
            ]
