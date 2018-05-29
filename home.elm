module Home exposing (..)

import Color exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font


home =
    row
        [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 }
        ]
        [ el
            []
            (image [] { src = "http://www.americancraftspirits.com/wp-content/uploads/2015/11/3.jpg", description = "American Craft Spirits" })
        ]
