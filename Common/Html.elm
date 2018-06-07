module Common.Html exposing (desktopWidth, followUsColumn, icon, paddingBottom20, paddingRight15, placeholderShowBy, spacer)

import Color exposing (rgb)
import Element exposing (..)
import Element.Font as Font
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


followUsColumn : String -> (String -> msg) -> Element msg
followUsColumn searchText toMsg =
    column [ width (px 240), spacing 5, paddingEach { bottom = 0, left = 0, right = 0, top = 30 } ]
        [ Input.text [ onRight (el [ centerY, moveLeft 20 ] (icon "fa fa-search")) ]
            { onChange = Just toMsg
            , text = searchText
            , placeholder = placeholderShowBy "search" searchText
            , label = Input.labelBelow [] none
            }
        , spacer 20
        , el [ Font.bold ] (text "Follow Us")
        , spacer 20
        , row [ spacing 5 ]
            [ followIcon "LinkedIn"
            , followIcon "Pinterest"
            , followIcon "RSS"
            , followIcon "Tumblr"
            , followIcon "Twitter"
            , followIcon "Vimeo"
            , followIcon "Youtube"
            ]
        , row [ spacing 5 ]
            [ followIcon "Dribbble"
            , followIcon "Facebook"
            , followIcon "Flickr"
            , followIcon "Forrst"
            , followIcon "GitHub"
            , followIcon "GooglePlus"
            , followIcon "Instagram"
            ]
        , spacer 20
        , el [ Font.bold ] (text "Paulo Coelho, Brida")
        , spacer 20
        , paragraph [ width shrink ]
            [ el [ Font.color (rgb 102 102 102) ]
                (text "“Accept what life offers you and try to drink from every cup. All wines should be tasted; some should only be sipped, but with others, drink the whole bottle.”")
            ]
        ]
