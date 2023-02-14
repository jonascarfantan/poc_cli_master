module Model exposing (..)
import Time
import Task
import Browser.Dom as Dom
-- Internal
import Msg exposing (..)
import Shared

type alias Flags =
    { height: Float
    , width: Float
    }

type alias Model =
    { -- App
      isRunning : Bool
    , window : { height: Float, width: Float}
    , isMenuOpen : Bool
    , uiBusy : Bool

    -- Time Zone
    , time : Time.Posix
    , zone : Time.Zone

    -- Other
    , keyPressed : Maybe Shared.Key
    }

init : Flags -> ( Model, Cmd Msg )
init flags =
    ( 
        { --App
          isRunning = False
        , window =
            { height = flags.height
            , width = flags.width }
        , uiBusy = False
        -- Time Zone
        , time = Time.millisToPosix 0
        , zone = Time.utc
        , isMenuOpen = True
        , keyPressed = Nothing

        -- Other
        
        }
        , Task.perform
            (\{ viewport } ->
                Msg.ResizeWindow
                    viewport.width
                    viewport.height
            )
            Dom.getViewport 
    )
    