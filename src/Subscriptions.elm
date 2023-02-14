module Subscriptions exposing (..)
import Time
import Browser.Events exposing (onKeyDown)
import Json.Decode as Decode
-- Internal
import Model exposing (Model)
import Msg exposing (..)
import Shared exposing (..)
import Browser.Events exposing (onResize)

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch <| 
        [ Time.every 1000 Tick
        , onKeyDown (Decode.map KeyboardInput keyDecoder)
        , onResize (\w h -> ResizeWindow (toFloat w) (toFloat h) )
        ]

keyDecoder : Decode.Decoder Key
keyDecoder =
    Decode.map toKeyValue (Decode.field "key" Decode.string)

toKeyValue : String -> Key
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