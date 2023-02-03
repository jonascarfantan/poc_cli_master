module Game.Board exposing (..)
import Game.Cell exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Grid
-- Internal imports
import Style exposing (colors)

type Board = Board (List Cell)

-- BOARD VIEW

createBoard : List (Element msg)
createBoard =
    allCells |>
        List.map (\x -> boardRow x )

boardRow : List (String, Int) -> Element msg
boardRow x =
    row
        [ width fill
        , height <| fillPortion 1
        ] <| List.map (\y -> renderCell y) x
        

renderCell : (String, Int) -> Element msg
renderCell (rank, file) =
    let
        ( font, bg ) = 
            if List.member (rank, file) whiteCells then
                (colors.black_cell, colors.white_cell)
            else
                (colors.white_cell, colors.black_cell)
    in
        el
        [ width <| px 100
        , height <| px 100
        , Background.color bg
        , Font.center
        , padding 25
        , Font.color font
        , Font.size 44
        , Font.family [Font.monospace] 
        , Font.medium
        ] <|
        text <| cell_string_to_el (rank, file)

cell_string_to_el : (String, Int) -> String
cell_string_to_el ( rank, file ) =
    let
        x = rank
        y = String.fromInt file
    in
        x ++ y



