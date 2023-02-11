module Main exposing (main)
import Browser
import Browser.Events exposing (onAnimationFrame, onKeyDown)
import Time exposing (Posix)
import Json.Decode as Decode
import Html exposing (Html)
import Element exposing (..)
import Element.Events exposing (onClick)
import Color exposing (Color)
-- Internal imports
import Shared exposing (..)
import Ui
import Browser.Events exposing (onKeyPress)

keyDecoder : Decode.Decoder KeyValue
keyDecoder =
    Decode.map toKeyValue (Decode.field "key" Decode.string)

toKeyValue : String -> KeyValue
toKeyValue key =
    let
        _ =
            Debug.log key
    in
    case String.uncons key of
        Just ( char, "" ) ->
            Character char

        _ ->
            Control key

 -- ______________
 -- ___MESSAGES___
type Msg
    = ToggleRunning
    | Tick Time.Posix
    | AdjustTimeZone Time.Zone

    | AddKey KeyValue
    | NoOp

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
            , Cmd.none )
        
        -- Keyboard Actions
        AddKey value ->
            ( { model | keys = value :: model.keys }
            , Cmd.none )

        NoOp -> ( model, Cmd.none )


--___________________
--____SUBSCRIPTION___
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch <| 
        [ Time.every 1000 Tick
        , onKeyDown (Decode.map AddKey keyDecoder)
        ]

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
view : Model -> Html msg
view model =
    layout []
        <| Ui.render model
