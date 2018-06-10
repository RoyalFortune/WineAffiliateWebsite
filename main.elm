module Main exposing (..)

import About exposing (Model, emptyModel, init, subscriptions, update, view)
import Blog exposing (Model, emptyModel, init, subscriptions, update, view)
import Color exposing (..)
import Common.Html exposing (desktopWidth, icon, paddingRight15)
import Common.Route as Route exposing (Route)
import Data.Blog
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Home exposing (Model, emptyModel, init, subscriptions, update, view)
import Html exposing (Html)
import Navigation


type alias Model =
    { page : Page
    , location : Navigation.Location
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { page = getPage (Route.parse location)
      , location = location
      }
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


navbar : Model -> List (Element Msg)
navbar model =
    let
        routeLink route =
            Route.routeLink (Route.parse model.location) OpenPage route
    in
    [ routeLink Route.Home
    , routeLink Route.Blog
    , routeLink Route.About
    , el [] (text "Tasting Room")
    , el [] (text "Wine Store")
    , el [] (text "Faqs")
    , el [] (text "Contact")
    , el [] (icon "fa fa-shopping-cart")
    , el [] (icon "fa fa-search")
    ]


type Page
    = Home Home.Model
    | Blog Blog.Model
    | About About.Model
    | Error String


view : Model -> Html Msg
view model =
    Element.layout
        [ Background.color white
        , Font.color (Color.rgb 5 5 5)
        , Font.size 13
        , Font.family
            [ Font.external { url = "https://fonts.googleapis.com/css?family=Open+Sans", name = "Open Sans" }
            , Font.serif
            , Font.external { url = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css", name = "fontawesome-all" }
            ]
        ]
    <|
        row [ width fill, alignTop ]
            [ column [ width fill ] [ none ]
            , column [ width (px desktopWidth), centerX ]
                [ row
                    [ spacing 25
                    , paddingEach { bottom = 20, left = 0, right = 0, top = 20 }
                    ]
                    [ column [ width (fillPortion 2) ]
                        [ row [ spacing 5 ]
                            [ el [ Font.color Color.black ] (icon "fa fa-phone")
                            , el [ paddingRight15 ] (text "(706) 204-9682")
                            , el [ Font.color Color.black ] (icon "fa fa-envelope")
                            , el [ paddingRight15 ] (text "Winesilove@americancraftspirits.com")
                            , el [ Font.color Color.black ] (icon "fa fa-user")
                            , el [] (text "Logout")
                            ]
                        ]
                    , column [ width (fillPortion 2) ] []
                    , column [ width (fillPortion 1) ]
                        [ row [ spacing 10, Font.alignRight, Font.size 18, Font.color (Color.rgb 187 187 187) ]
                            [ el [ alignRight ] (icon "fa fa-twitter")
                            , el [ alignRight ] (icon "fa fa-facebook")
                            , el [ alignRight ] (icon "fa fa-google-plus")
                            , el [ alignRight ] (icon "fa fa-pinterest")
                            , el [ alignRight ] (icon "fa fa-instagram")
                            , el [ alignRight ] (icon "fa fa-linkedin")
                            , el [ alignRight ] (icon "fa fa-rss")
                            ]
                        ]
                    ]
                , row []
                    [ el
                        [ inFront <|
                            row
                                [ spacing 15
                                , moveRight 340.0
                                , moveDown 15.0
                                ]
                                (navbar model)
                        ]
                        (image [] { src = "http://www.americancraftspirits.com/wp-content/uploads/2015/08/logo.jpg", description = "American Craft Spirits" })
                    ]
                , viewPage model.page
                ]

            {-
               Slider Image Row

               Was being included from Home.elm with the following code: Home.home
            -}
            -- End of Container Column
            , column [ width fill ] [ none ]
            ]


viewPage : Page -> Element Msg
viewPage page =
    case page of
        Home subModel ->
            Element.map HomeMsg (Home.view subModel)

        Blog subModel ->
            Element.map BlogMsg (Blog.view subModel)

        About subModel ->
            Element.map AboutMsg (About.view subModel)

        Error errorStr ->
            text errorStr


type Msg
    = UrlChange Navigation.Location
    | OpenPage Route
    | HomeMsg Home.Msg
    | BlogMsg Blog.Msg
    | AboutMsg About.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    updatePage model.page msg model


getPage : Maybe Route -> Page
getPage maybeRoute =
    case maybeRoute of
        Just Route.Home ->
            Home Home.emptyModel

        Just Route.Blog ->
            Blog (Blog.emptyModel Data.Blog.blogs)

        Just (Route.Post id) ->
            let
                posts =
                    List.filter (\t -> t.id == id) Data.Blog.blogs
            in
            if List.length posts == 0 then
                Error ("No post found with id: " ++ id)
            else
                Blog (Blog.emptyModel posts)

        Just Route.About ->
            About About.emptyModel

        Nothing ->
            Error "Unkown Page"


updatePage : Page -> Msg -> Model -> ( Model, Cmd Msg )
updatePage page msg model =
    let
        toPage toModel toMsg subUpdate subMsg subModel =
            let
                ( newModel, newCmd ) =
                    subUpdate subMsg subModel
            in
            { model | page = toModel newModel } ! [ Cmd.map toMsg newCmd ]
    in
    case ( msg, page ) of
        ( UrlChange location, _ ) ->
            ( { model
                | page = getPage (Route.parse location)
                , location = location
              }
            , Cmd.none
            )

        ( OpenPage route, _ ) ->
            ( { model | page = getPage (Just route) }
            , Navigation.newUrl (Route.getUrl route)
            )

        ( BlogMsg subMsg, Blog subModel ) ->
            toPage Blog BlogMsg Blog.update subMsg subModel

        ( HomeMsg subMsg, Home subModel ) ->
            toPage Home HomeMsg Home.update subMsg subModel

        ( AboutMsg subMsg, About subModel ) ->
            toPage About AboutMsg About.update subMsg subModel

        _ ->
            ( model, Cmd.none )


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
