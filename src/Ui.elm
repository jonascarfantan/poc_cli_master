module Ui exposing (..)

import Html.Attributes exposing (style)
import Element exposing (..)
import Element.Events exposing (onClick)
import Element.Background as Background

-- Internal import
import Helper
import Model exposing (..)
import Style exposing (..)
import Game.Board as Board

-- Helpers
css : String -> String -> Attribute msg
css property value =
    htmlAttribute <| style property value

-- _____________________
-- ASIDE / SETTINGS MENU
settings_menu_wrap : Model -> Element msg
settings_menu_wrap m =
    column
        [ height fill
        , block_padding
        , Background.color colors.primary
        , css "width" <| String.fromInt ( if m.isMenuOpen then menu_open_w m else menu_closed_w )
        , css "z-index" "1"
        ]
        [
            settings_menu m
        ]

settings_menu : Model -> Element msg
settings_menu m =
    column 
        [ width fill
        , height fill
        , Background.color colors.mauve
        ]
        [ settings_head_wrap m
        , settings_body_wrap m
        , settings_foot_wrap m
        ]
         

settings_head_wrap : Model -> Element msg
settings_head_wrap m =
    row
        [ height <| fillPortion 1
        , width fill
        ]
        [ settings_head m
        ]

settings_head : Model -> Element msg
settings_head m = 
    el 
        [ width fill
        , alignTop
        , Background.color colors.highligth 
        ] <| text <| "Cli_Master"

settings_body_wrap : Model -> Element msg
settings_body_wrap m =
    row
        [ height <| fillPortion 10
        , width fill
        , alignTop
        ]
        [ settings_body m
        ]

settings_body : Model -> Element msg
settings_body m = 
    el 
        [ width fill
        , alignTop
        , Background.color colors.highligth
        ] <| text <| "Lot of Settings"

settings_foot_wrap : Model -> Element msg
settings_foot_wrap m =
    row
        [ height <| fillPortion 1
        , width fill
        ]
        [ settings_foot m
        ]

settings_foot : Model -> Element msg
settings_foot m = 
    el 
        [ width fill
        , alignBottom
        , Background.color colors.highligth 
        ] <| text <| "copyright"

-- ______________
-- MAIN / IN GAME
game_wrap : Model -> Element msg
game_wrap m =
    column
        [ width <| fillPortion 10
        , height fill
        , Background.color colors.secondary
        , padding 10
        ] 
        [ game_head_wrap m
        , game_arena_wrap m
        , game_foot_wrap m
        ]

-- _____________________
-- HEADER / IN GAME MENU
game_head_wrap : Model -> Element msg
game_head_wrap m =
    row
        [ width fill
        , height <| fillPortion 1
        , Background.color colors.oldgrey
        , alignRight
        ]
        [ game_head m
        ]

game_head : Model -> Element msg
game_head m = 
    el 
        [ alignRight
        , Background.color colors.highligth
        ] <| text <| Helper.time_str m

game_arena_wrap : Model -> Element msg
game_arena_wrap m =
    row
        [ width fill
        , height <| fillPortion 10
        ]
        [ left_pannels_wrap m
        , board m
        , right_pannels_wrap m
        ]

-- ___________
-- CHESS BOARD 
board : Model -> Element msg
board m =
    column
        [ height fill
        , width <| fillPortion 4
        , Background.color colors.highligth
        ] <| Board.createBoard m

left_pannels_wrap : Model -> Element msg
left_pannels_wrap m =
    column
        [ height fill
        , width <| fillPortion 2
        , Background.color colors.highligth
        ] [ left_pannel m ]
left_pannel : Model -> Element msg
left_pannel m =
    column
        [ height fill
        , width fill
        , Background.color colors.mauve
        ] [ el [] <| text <| "Left pannels" ]

right_pannels_wrap : Model -> Element msg
right_pannels_wrap m =
    column
        [ height fill
        , width <| fillPortion 2
        , Background.color colors.highligth
        ] [ right_pannel m ]

right_pannel : Model -> Element msg
right_pannel m =
    column
        [ height fill
        , width fill
        , Background.color colors.mauve
        ] [ el [] <| text <| "right pannels" ]

-- ____________
-- FOOTER / ATH
game_foot_wrap : Model -> Element msg
game_foot_wrap m =
    row
        [ width fill
        , height <| fillPortion 1
        ]
        [ game_foot m
        ]

game_foot : Model -> Element msg
game_foot m = el [] <| text <| "ATH"

-- ______
-- RENDER
render : Model -> Element msg
render m =
    row 
        [ width fill
        , height fill
        ]
        [ settings_menu_wrap m
        , game_wrap m
        ]