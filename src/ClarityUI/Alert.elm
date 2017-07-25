module ClarityUI.Alert
    exposing
        ( AlertType
        , AlertAction
        , AlertItem
        , alert
        , alertDanger
        , alertAppDanger
        , alertWarning
        , alertAppWarning
        , alertInfo
        , alertAppInfo
        , alertSuccess
        , alertAppSuccess
        )

{-| Clarity UI's Alerts.

For more documentation on clarity alerts: <https://vmware.github.io/clarity/documentation/alerts>


# Alerts

@docs alert


# Shorthand Inline Alerts

@docs alertDanger, alertWarning, alertInfo, alertSuccess


# App Alerts

@docs alertAppDanger, alertAppWarning, alertAppInfo, alertAppSuccess


# Options

@docs AlertType


# Data

@docs AlertItem, AlertAction

-}

import Html exposing (Html, div, span, text, button, node)
import Html.Attributes exposing (class, classList, attribute, type_, style)


{-| Alert Type. Either Danger, Warning, Info or Success
-}
type AlertType
    = Danger
    | Warning
    | Info
    | Success


{-| Actions for an alert
-}
type alias AlertAction =
    { text : String
    , link : String
    }


{-| Item to pass to an alert
-}
type alias AlertItem =
    { text : String
    , actions : List AlertAction
    }


{-| Main Alert Entry Point. Creates a clarity alert.

Documentation about Clarity Alerts: <https://vmware.github.io/clarity/documentation/alerts#top>

-}
alert : AlertType -> Bool -> Bool -> Bool -> AlertItem -> Html msg
alert alertType isSmall isAppAlert isDismissible alertItem =
    let
        typeClass =
            case alertType of
                Danger ->
                    "alert-danger"

                Warning ->
                    "alert-warning"

                Info ->
                    "alert-info"

                Success ->
                    "alert-success"
    in
        div
            [ classList
                [ ( "alert", True )
                , ( typeClass, True )
                , ( "alert-sm", isSmall )
                , ( "alert-app-level", isAppAlert )
                ]
            ]
            [ viewAlertClose isDismissible
            , viewAlertItem alertItem
            ]


{-| Shows the alert close button if the isDismissible argument is True
else returns a invisible span.
-}
viewAlertClose : Bool -> Html msg
viewAlertClose isDismissible =
    if isDismissible then
        button
            [ class "close"
            , type_ "button"
            , attribute "aria-label" "Close"
            ]
            [ node "clr-icon"
                [ attribute "aria-hidden" "true"
                , attribute "shape" "close"
                ]
                []
            ]
    else
        span [ style [ ( "display", "none" ) ] ] []


{-| View Alert Item Function.
Creates a single alert Item. Shows the list of actions if available
-}
viewAlertItem : AlertItem -> Html msg
viewAlertItem item =
    div
        [ class "alert-item" ]
        [ span [ class "alert-text" ] [ text item.text ]
        , div [ class "alert-actions" ] <| List.map viewAlertAction item.actions
        ]


{-| View Alert Action Function.
Renders out the alert action.
-}
viewAlertAction : AlertAction -> Html msg
viewAlertAction action =
    button
        [ classList
            [ ( "btn", True )
            , ( "alert-action", True )
            ]
        ]
        [ text action.text ]


{-| Alert Danger.
Curried Shortcut for a dismissible danger alert.
-}
alertDanger : AlertItem -> Html msg
alertDanger =
    alert Danger False False True


{-| Alert Warning.
Curried Shortcut for a dismissible warning alert.
-}
alertWarning : AlertItem -> Html msg
alertWarning =
    alert Warning False False True


{-| Alert Info.
Curried Shortcut for a dismissible Info alert.
-}
alertInfo : AlertItem -> Html msg
alertInfo =
    alert Info False False True


{-| Alert Success.
Curried Shortcut for a dismissible Success alert.
-}
alertSuccess : AlertItem -> Html msg
alertSuccess =
    alert Success False False True


{-| Alert App Danger.
Curried Shortcut for a dismissible danger app alert.
-}
alertAppDanger : AlertItem -> Html msg
alertAppDanger =
    alert Danger False True True


{-| Alert App Warning.
Curried Shortcut for a dismissible warning app alert.
-}
alertAppWarning : AlertItem -> Html msg
alertAppWarning =
    alert Warning False True True


{-| Alert App Info.
Curried Shortcut for a dismissible Info app alert.
-}
alertAppInfo : AlertItem -> Html msg
alertAppInfo =
    alert Info False True True


{-| Alert App Success.
Curried Shortcut for a dismissible Success app alert.
-}
alertAppSuccess : AlertItem -> Html msg
alertAppSuccess =
    alert Success False True True
