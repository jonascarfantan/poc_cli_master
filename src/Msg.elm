module Msg exposing (..)
import Time
import Shared

type Msg
    = -- App 
      ResizeWindow Float Float
    | ToggleRunning
    -- Time Zone
    | Tick Time.Posix
    | AdjustTimeZone Time.Zone

    | KeyboardInput Shared.Key
    -- Others
    | NoOp