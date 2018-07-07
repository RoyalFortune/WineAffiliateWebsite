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
    | Blog
    | Post String
    | About
    | Faq


route : Url.Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home top
        , Url.map Blog (s "blog")
        , Url.map Post (s "blog" </> string)
        , Url.map About (s "about")
        , Url.map Faq (s "faq")
        ]



--todo, when onh a specific blog item, doesn't show blog as highlighted


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

            Blog ->
                text "Blog"

            Post postId ->
                Debug.crash "todo"

            About ->
                text "About"

            Faq ->
                text "Faq"


getUrl : Route -> String
getUrl route =
    case route of
        Home ->
            "/"

        Blog ->
            "../blog"

        Post postId ->
            "../blog/" ++ postId

        About ->
            "../about"

        Faq ->
            "../faq"


parse : Navigation.Location -> Maybe Route
parse location =
    Url.parsePath route location


back : Cmd msg
back =
    Navigation.back 1
