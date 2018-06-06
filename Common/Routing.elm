module Common.Routing
    exposing
        ( Route(..)
        , back
        , parse
        , route
        )

import Html exposing (Attribute)
import Html.Attributes
import Navigation
import UrlParser as Url exposing ((</>), (<?>), Parser, int, intParam, oneOf, parseHash, parsePath, s, stringParam, top)


type Route
    = Home
    | BlogList (Maybe String)
    | BlogPost Int


route : Url.Parser (Route -> a) a
route =
    Url.oneOf
        [ Url.map Home top
        , Url.map BlogList (s "blog" <?> stringParam "search")
        , Url.map BlogPost (s "blog" </> int)
        ]


parse : Navigation.Location -> Maybe Route
parse location =
    Url.parsePath route location


back : Cmd msg
back =
    Navigation.back 1
