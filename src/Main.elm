module Main exposing (..)

-- lib

import Html exposing (..)


-- app

import ClarityUI.CDN
import ClarityUI.Layout


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
        , ClarityUI.Layout.layout
            { alerts = [ div [] [] ]
            , header = [ div [] [] ]
            , subnav = [ div [] [] ]
            , sidenav = [ div [] [] ]
            , main = [ div [] [] ]
            }
        ]
