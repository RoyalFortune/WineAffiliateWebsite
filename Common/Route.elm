module Common.Route
    exposing
        ( Route(..)
        , back
        , getUrl
        , parse
        , route
        , routeLink
        )

import Color
import Element exposing (Element, el, mouseOver, padding, paddingEach, pointer, text)
import Element.Events exposing (onClick, onMouseEnter, onMouseLeave)
import Element.Font as Font
import Navigation
import UrlParser as Url exposing ((</>), (<?>), Parser, int, intParam, oneOf, parseHash, parsePath, s, stringParam, top)


type Route
    = Home
    | Blog
    | About


route : Url.Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home top
        , Url.map Blog (s "blog")
        , Url.map About (s "about")
        ]


routeLink : Maybe Route -> Maybe Route -> (Route -> msg) -> (Route -> msg) -> (Route -> msg) -> Route -> Element msg
routeLink currentRoute activeRoute openPage mouseOver mouseLeave route =
    let
        alwaysAttributes =
            [ if currentRoute == Just route || activeRoute == Just route then
                Font.color (Color.rgb 59 134 176)
              else
                Font.color (Color.rgb 85 85 85)
            , onClick (openPage route)
            , onMouseEnter (mouseOver route)
            , onMouseLeave (mouseLeave route)
            , paddingEach { left = 5, right = 5, top = 20, bottom = 20 }
            ]

        sometimesAttributes =
            if Just route == activeRoute then
                [ pointer
                ]
            else
                []
    in
    el (alwaysAttributes ++ sometimesAttributes) <|
        case route of
            Home ->
                text "Main Home"

            Blog ->
                text "Blog"

            About ->
                text "About"


getUrl : Route -> String
getUrl route =
    case route of
        Home ->
            "./"

        Blog ->
            "./blog"

        About ->
            "./about"


parse : Navigation.Location -> Maybe Route
parse location =
    Url.parsePath route location


back : Cmd msg
back =
    Navigation.back 1
