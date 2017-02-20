module Prototype exposing (..)

import Html exposing (..)


type alias Measure =
    { value : Float
    , unit : Unit
    , multiplier : Multiplier
    }


type Unit
    = Metre
    | Inch


type Multiplier
    = None
    | Kilo
    | Mega


mymeasure1 =
    { value = 2.0, unit = Metre, multiplier = Kilo }


mymeasure2 =
    { value = 3.0, unit = Metre, multiplier = Kilo }


printmeasure result =
    case result of
        Ok measure ->
            let
                mult =
                    case measure.multiplier of
                        Kilo ->
                            "k"

                        Mega ->
                            "M"

                        None ->
                            ""

                unit =
                    case measure.unit of
                        Metre ->
                            "m"

                        Inch ->
                            "in"
            in
                text <| (toString measure.value) ++ " " ++ mult ++ unit

        Err err ->
            text err


summeasure : Measure -> Measure -> Result String Measure
summeasure m1 m2 =
    if m1.unit == m2.unit then
        Ok { value = m1.value + m2.value, unit = m1.unit, multiplier = Kilo }
    else
        Err "Nada de misturar banana com maca"


main =
    printmeasure (summeasure mymeasure1 mymeasure2)
