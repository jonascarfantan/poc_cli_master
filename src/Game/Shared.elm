module Game.Shared exposing (..)

type alias Player =
    { id : Int
    , pv : Int
    , pa : Int
    , pm : Int
    , isAlive : Bool
    , perso : Character
    , money : Int
    , score : Int
    }

type Character
    = Bowman
    | Warrior
    | Wizard
    | Ninja
    | ForestGuardian
