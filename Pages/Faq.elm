module Pages.Faq exposing (Model, Msg, emptyModel, init, subscriptions, update, view)

import Common.Html exposing (desktopWidth, followUsColumn, icon, spacer)
import Element exposing (..)
import Element.Font as Font


subscriptions : Sub Msg
subscriptions =
    Sub.none


init : Cmd Msg
init =
    Cmd.none


type alias Model =
    { searchText : String
    }


view : Model -> Element Msg
view model =
    row []
        [ column []
            [ paragraph [ paddingXY 0 20 ]
                [ el [ Font.bold, Font.size 16 ] (text "Who We Are")
                ]
            , paragraph []
                [ el [] (text "The founders of American Craft Spirits are passionate lovers of food and wine, and have traveled the world to experience the good, the bad and the amazing in the world of wine and spirits! Though highly focused on California wines, the founders of “ACS” have developed a knack for choosing the very best wines and food through experience, a passion for excellence, and a deep desire to experience the best things in life; and Food & Wine stand heads and tails above all else to the Founders of American Craft Spirits!")
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
