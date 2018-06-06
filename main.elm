module Main exposing (..)

import Blog exposing (Model, emptyModel, init, subscriptions, update, view)
import Color exposing (..)
import Common.Html exposing (desktopWidth, icon, paddingRight15)
import Common.Routing as Routing exposing (Route)
import Element exposing (..)
import Element.Background as Background
import Element.Events exposing (onClick)
import Element.Font as Font
import Home exposing (Model, emptyModel, init, subscriptions, update, view)
import Html exposing (Html)
import Navigation


type alias Model =
    { page : Page
    }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( { page = getPage (Routing.parse location) }
    , Cmd.none
    )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


type Page
    = Home Home.Model
    | Blog Blog.Model
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
            [ el [ width fill ] none
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
                                [ spacing 25
                                , moveRight 350.0
                                , moveDown 30.0
                                ]
                                [ el [ onClick (OpenPage (Home Home.emptyModel)) ] (text "Main Home")
                                , el [ onClick (OpenPage (Blog Blog.emptyModel)) ] (text "Blog")
                                , el [] (text "About")
                                , el [] (text "Tasting Room")
                                , el [] (text "Wine Store")
                                , el [] (text "Faqs")
                                , el [] (text "Contact")
                                , el [] (icon "fa fa-shopping-cart")
                                , el [] (icon "fa fa-search")
                                ]
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
            , el
                [ width fill ]
                none
            ]


viewPage : Page -> Element Msg
viewPage page =
    case page of
        Home subModel ->
            Element.map HomeMsg (Home.view subModel)

        Blog subModel ->
            Element.map BlogMsg (Blog.view subModel)

        Error errorStr ->
            text errorStr


type Msg
    = UrlChange Navigation.Location
    | OpenPage Page
    | HomeMsg Home.Msg
    | BlogMsg Blog.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    updatePage model.page msg model


getPage : Maybe Route -> Page
getPage maybeRoute =
    case maybeRoute of
        Just Routing.Home ->
            Home Home.emptyModel

        Just (Routing.BlogList maybeStr) ->
            Blog Blog.emptyModel

        Just (Routing.BlogPost int) ->
            Error "Not implemented"

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
            ( { model | page = getPage (Routing.parse location) }, Cmd.none )

        ( BlogMsg subMsg, Blog subModel ) ->
            toPage Blog BlogMsg Blog.update subMsg subModel

        ( HomeMsg subMsg, Home subModel ) ->
            toPage Home HomeMsg Home.update subMsg subModel

        ( OpenPage page, _ ) ->
            ( { model | page = page }, Cmd.none )

        _ ->
            ( model, Cmd.none )



--main : Program Never Model Msg


main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
