module Common.Route
    exposing
        ( Route(..)
        , back
        , parse
        , route
        , routeLink
        )

import Color
import Element exposing (Element, link, text)
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


routeLink : Maybe Route -> Route -> Element msg
routeLink currentRoute route =
    link
        [ if currentRoute == Just route then
            Font.color (Color.rgb 59 134 176)
          else
            Font.color (Color.rgb 85 85 85)
        ]
    <|
        case route of
            Home ->
                { url = "./"
                , label = text "Main Home"
                }

            Blog ->
                { url = "./blog"
                , label = text "Blog"
                }

            About ->
                { url = "./about"
                , label = text "About"
                }


parse : Navigation.Location -> Maybe Route
parse location =
    Url.parsePath route location


back : Cmd msg
back =
    Navigation.back 1
