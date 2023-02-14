module Main exposing (main)
import Browser
import Html exposing (Html)
import Element exposing (layout)
-- Internal imports
import Model
import Msg
import Update
import Subscriptions
import Ui

main : Program Model.Flags Model.Model Msg.Msg
main =
    Browser.element
        { init = Model.init
        , update = Update.update
        , subscriptions = Subscriptions.subscriptions
        , view = view
        }


view : Model.Model -> Html msg
view model =
    layout []
        <| Ui.render model
