module Helper exposing (..)
import Time
-- Internal
import Model exposing (Model)

-- Time Helper
time_str : Model -> String
time_str model =
    let
        hour   = String.fromInt (Time.toHour   model.zone model.time)
        minute = String.fromInt (Time.toMinute model.zone model.time)
        second = String.fromInt (Time.toSecond model.zone model.time)
    in
        hour ++ " : " ++ minute ++ " : " ++ second


