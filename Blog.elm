module Blog exposing (Model, Msg, emptyModel, init, subscriptions, update, view)

import Color exposing (..)
import Common.Html exposing (desktopWidth, followUsColumn, icon, spacer)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Element.Input as Input


subscriptions : Sub Msg
subscriptions =
    Sub.none


init : Cmd Msg
init =
    Cmd.none


type alias Model =
    { searchText : String
    }



--TODO: This looks like it should be an active link


view : Model -> Element Msg
view model =
    row []
        [ column [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 }, spacing 10 ]
            [ image [ width (px 680), height (px 514) ] { src = "http://www.americancraftspirits.com/wp-content/uploads/2015/10/simple-pleasures.jpg", description = "What Should I Expect From Fine Wine" }
            , link [ Font.size 24 ] { url = "./24318-2/", label = text "What Should I Expect From Fine Wine" }
            , row [ spacing 8 ]
                [ icon "fa fa-clock-o"
                , el [] (text "May 24, 2018")
                , spacer 20
                , icon "fa fa-user"
                , link [] { url = ".author/sroberts/", label = text "Steven Roberts" }
                , spacer 20
                , icon "fa fa-folder-o"

                --, todo ...tags [list]
                , el [] (text "Inspiration, Resources, Wine knowledge")

                --, todo ...comments [count of comments]
                -- todo, list length comments
                , spacer 20
                , icon "fa fa-comment-o"
                , text "0 Comments"
                ]
            ]
        , column [ width (px 50) ] [ none ]
        , followUsColumn model.searchText UpdateSearch
        ]


type Msg
    = UpdateSearch String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateSearch searchText ->
            ( { model | searchText = searchText }, Cmd.none )


emptyModel : Model
emptyModel =
    { searchText = ""
    }
