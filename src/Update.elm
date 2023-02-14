module Update exposing (..)
import Process
import Task
-- Internal
import Model exposing (..)
import Msg exposing (..)
import Shared exposing (..)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        -- Window
        ResizeWindow w h ->
            ( { model |
                  window = { width = w, height = h }
                 }
            , Cmd.none )

        -- Time Zone
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
        KeyboardInput key ->
            case key of
                Control "Escape" ->
                    ( { model | keyPressed = Just key, isMenuOpen = not model.isMenuOpen }
                    , Cmd.none )
                _ ->
                    ( { model | keyPressed = Just key }
                    , Cmd.none )

        NoOp -> ( model, Cmd.none )

delay : Msg -> Cmd Msg
delay msg =
    Process.sleep 61
        |> Task.andThen (always <| Task.succeed msg)
        |> Task.perform identity