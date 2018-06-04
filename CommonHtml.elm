module CommonHtml exposing (icon, paddingBottom20, paddingRight15, placeholderShowBy)

import Element exposing (Attribute, Element, el, htmlAttribute, none, paddingEach, text)
import Element.Input as Input
import Html.Attributes exposing (class)


icon : String -> Element msg
icon iconName =
    el [ htmlAttribute (class iconName) ] none


placeholderShowBy : String -> String -> Maybe (Input.Placeholder msg)
placeholderShowBy placeholderText sourceStr =
    if sourceStr == "" then
        Nothing
    else
        Just (Input.placeholder [] (text placeholderText))


paddingBottom20 : Attribute msg
paddingBottom20 =
    paddingEach { bottom = 20, left = 0, right = 0, top = 0 }


paddingRight15 : Attribute msg
paddingRight15 =
    paddingEach { bottom = 0, left = 0, right = 15, top = 0 }
