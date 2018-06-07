module Common.Html exposing (desktopWidth, followIconRow1, followIconRow2, icon, paddingBottom20, paddingRight15, placeholderShowBy, spacer)

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


followIcon : String -> Element msg
followIcon description =
    let
        imageName =
            String.toLower description ++ ".png"
    in
    image [ height (px 30), width (px 30) ]
        { src = "http://www.americancraftspirits.com/wp-content/themes/Total/images/social/" ++ imageName, description = description }


followIconRow1 : Element msg
followIconRow1 =
    row [ spacing 5 ]
        [ followIcon "Dribbble"
        , followIcon "Facebook"
        , followIcon "Flickr"
        , followIcon "Forrst"
        , followIcon "GitHub"
        , followIcon "GooglePlus"
        , followIcon "Instagram"
        ]


followIconRow2 : Element msg
followIconRow2 =
    row [ spacing 5 ]
        [ followIcon "LinkedIn"
        , followIcon "Pinterest"
        , followIcon "RSS"
        , followIcon "Tumblr"
        , followIcon "Twitter"
        , followIcon "Vimeo"
        , followIcon "Youtube"
        ]
