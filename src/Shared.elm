module Shared exposing (..)
import Time


type alias Flags =
    { height: Int
    , width: Int
    }
--___________________
--_______MODEL_______   

type alias Model =
    {
    -- App
      isRunning : Bool
    , screen : { height: Int, width: Int}

    -- Time zone
    , time : Time.Posix
    , zone : Time.Zone

    }

init : Flags -> ( Model, Cmd msg )
init flags =
    ( { isRunning = False
        , screen = { height = flags.height, width = flags.width }
        , time = Time.millisToPosix 0
        , zone = Time.utc
        } , Cmd.none )

-- Time Helper
time_str : Model -> String
time_str model =
    let
        hour   = String.fromInt (Time.toHour   model.zone model.time)
        minute = String.fromInt (Time.toMinute model.zone model.time)
        second = String.fromInt (Time.toSecond model.zone model.time)
    in
        hour ++ " : " ++ minute ++ " : " ++ second