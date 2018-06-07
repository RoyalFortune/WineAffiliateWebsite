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
import UrlParser as Url exposing ((</>), (<?>), Parser, int, intParam, oneOf, parseHash, parsePath, s, string, stringParam, top)


type Route
    = Home
    | BlogList
    | BlogPost String
    | About


route : Url.Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home top
        , Url.map BlogList (s "blog")
        , Url.map BlogPost (s "blog" </> string)
        , Url.map About (s "about")
        ]


routeLink : Maybe Route -> (Route -> msg) -> Route -> Element msg
routeLink currentRoute openPage route =
    el
        [ if currentRoute == Just route then
            Font.color (Color.rgb 59 134 176)
          else
            Font.color (Color.rgb 85 85 85)
        , mouseOver [ Font.color (Color.rgb 59 134 176) ]
        , onClick (openPage route)
        , pointer
        , paddingEach { left = 5, right = 5, top = 20, bottom = 20 }
        ]
    <|
        case route of
            Home ->
                text "Main Home"

            BlogList ->
                text "Blog"

            BlogPost blodId ->
                text ("Blog: " ++ blodId)

            About ->
                text "About"


getUrl : Route -> String
getUrl route =
    case route of
        Home ->
            "./"

        BlogList ->
            "./blog"

        BlogPost blogId ->
            "./blog/" ++ blogId

        About ->
            "./about"


parse : Navigation.Location -> Maybe Route
parse location =
    Url.parsePath route location


back : Cmd msg
back =
    Navigation.back 1
