module Main exposing (main)
import Time exposing (Posix)
import Browser
import Browser.Events exposing (onAnimationFrame)
import Html exposing (Html)
import Element exposing (..)
import Element.Events exposing (onClick)
import Color exposing (Color)
-- Internal imports
import Shared exposing (..)
import Ui

 -- ______________
 -- ___MESSAGES___

type Msg
    = ToggleRunning
    | Tick Time.Posix
    | AdjustTimeZone Time.Zone

--___________________
--_______UPDATE______

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick newTime ->
            ( { model | time = newTime }
            , Cmd.none )

        AdjustTimeZone newZone ->
            ( { model | zone = newZone }
            , Cmd.none )

        ToggleRunning ->
            ( { model | isRunning = not model.isRunning }
            , Cmd.none  )


--___________________
--____SUBSCRIPTION___
subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every 1000 Tick

--___________________
--_______MAIN________
main : Program Flags Model Msg
main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }


--___________________
--_______VIEW________
--___________________


view : Model -> Html msg
view model =
    layout []
        <| Ui.render model
