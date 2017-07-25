module Main exposing (..)

-- lib

import Html exposing (..)


-- app

import ClarityUI.CDN
import ClarityUI.Layout
import ClarityUI.Header exposing (HeaderColor(..))


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    {} ! []


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        NoOp ->
            model ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


view : Model -> Html Msg
view model =
    div []
        [ ClarityUI.CDN.styles
        , ClarityUI.CDN.icons
        , ClarityUI.Layout.layout
            { alerts = [ viewAlerts model ]
            , header = viewHeader model
            , subnav = [ viewSubnav model ]
            , sidenav = [ viewSidenav model ]
            , main = [ mainContent model ]
            }
        , ClarityUI.CDN.iconsJS
        ]


viewAlerts : Model -> Html Msg
viewAlerts model =
    div [] []


viewHeader : Model -> Html Msg
viewHeader model =
    ClarityUI.Header.header
        HC6
        { branding = { icon = "vm-bug", title = "Elm Clarity UI" }
        , nav = []
        , search = []
        , actions = []
        }


viewSubnav : Model -> Html Msg
viewSubnav model =
    div [] []


mainContent : Model -> Html Msg
mainContent model =
    div [] []


viewSidenav : Model -> Html Msg
viewSidenav model =
    div [] []
