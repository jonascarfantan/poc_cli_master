module Style exposing (..)
import Element exposing (..)
import Canvas.Settings.Text exposing (TextBaseLine(..))
-- Internal
import Model exposing (Model)

-- Color
colors = 
    { primary = rgb255 130 95 250
    , secondary = rgb255 84 19 160
    , highligth = rgb255 220 220 220
    , mauve = rgb255 130 95 160
    , oldgrey = rgb255 160 160 160
    , black_cell = rgb255 80 80 80
    , white_cell = rgb255 220 220 220
    }

-- Size
menu_open_w m =
    round m.window.width // 6
menu_closed_w =
    68

-- Padding
block_padding : Attribute msg
block_padding = padding 10

bot_padding : Attribute msg

bot_padding 
    = paddingEach 
        { top = 0
        , right = 0
        , bottom = 8
        , left = 8
        }
 