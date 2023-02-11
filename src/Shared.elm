module Shared exposing (..)
import Time

-- USER INPUTS
type KeyValue 
    = Character Char
    | Control String

type alias Keys =
    List KeyValue

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
    , isMenuOpen : Bool

    -- Time zone
    , time : Time.Posix
    , zone : Time.Zone

    -- Other
    , keys : Keys
    }

init : Flags -> ( Model, Cmd msg )
init flags =
    ( { isRunning = False
        , screen = { height = flags.height, width = flags.width }
        , time = Time.millisToPosix 0
        , zone = Time.utc
        , isMenuOpen = True
        , keys = [] 
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