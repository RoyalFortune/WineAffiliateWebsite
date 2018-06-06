module Common.Html exposing (desktopWidth, icon, paddingBottom20, paddingRight15, placeholderShowBy, spacer)

import Element exposing (..)
import Element.Input as Input
import Html.Attributes exposing (class)


desktopWidth : Int
desktopWidth =
    1020


icon : String -> Element msg
icon iconName =
    el [ htmlAttribute (class iconName) ] none


spacer : Int -> Element msg
spacer amount =
    el [ height (px amount) ] none


placeholderShowBy : String -> String -> Maybe (Input.Placeholder msg)
placeholderShowBy placeholderText sourceStr =
    if sourceStr == "" then
        Just (Input.placeholder [ paddingEach { bottom = 0, left = 10, top = 10, right = 0 } ] (text placeholderText))
    else
        Nothing


paddingBottom20 : Attribute msg
paddingBottom20 =
    paddingEach { bottom = 20, left = 0, right = 0, top = 0 }


paddingRight15 : Attribute msg
paddingRight15 =
    paddingEach { bottom = 0, left = 0, right = 15, top = 0 }
