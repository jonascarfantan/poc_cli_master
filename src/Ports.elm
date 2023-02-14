port module Ports exposing (dl_svg, resize_window)

port dl_svg : String -> Cmd msg

port resize_window : ({ width : Int, height : Int } -> msg) -> Sub msg