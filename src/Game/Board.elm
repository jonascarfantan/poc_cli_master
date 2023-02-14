module Game.Board exposing (..)
import Game.Cell exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
-- Internal imports
import Style exposing (colors)
import Model exposing (Model)

type Board = Board (List Cell)

-- BOARD VIEW

createBoard : Model -> List (Element msg)
createBoard m =
    allCells |>
        List.map (\x -> boardRow m x )

boardRow : Model -> List (String, Int) -> Element msg
boardRow m cells =
    row
        [ width fill
        , centerX
        , centerY
        ] <| List.map (\y -> renderCell m y) cells
        

renderCell : Model -> (String, Int) -> Element msg
renderCell m (rank, file) =
    let
        ( font, bg ) = 
            if List.member (rank, file) whiteCells then
                (colors.black_cell, colors.white_cell)
            else
                (colors.white_cell, colors.black_cell)
    in
        el
        [ width <| px <| window_width m
        , height <| px <| window_width m
        , Background.color bg
        , Font.center
        , padding 25
        , Font.color font
        , Font.size 44
        , Font.family [Font.monospace] 
        , Font.medium
        ] <| text ""
        --<| text <| cell_string_to_el (rank, file)

window_width : Model -> Int
window_width m =
    let
        ratio = round m.window.width // 18
    in
        if ratio < 60 then 60 else ratio

cell_string_to_el : (String, Int) -> String
cell_string_to_el ( rank, file ) =
    let
        x = rank
        y = String.fromInt file
    in
        x ++ y



