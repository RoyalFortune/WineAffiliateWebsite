module About exposing (Model, Msg, emptyModel, init, subscriptions, update, view)

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


followIcon : String -> Element msg
followIcon description =
    let
        imageName =
            String.toLower description ++ ".png"
    in
    image [ height (px 30), width (px 30) ]
        { src = "http://www.americancraftspirits.com/wp-content/themes/Total/images/social/" ++ imageName, description = description }


view : Model -> Element Msg
view model =
    row []
        [ column [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 }, spacing 10 ]
            [ text "Who’s Behind the Heart & Soul of American Craft Spirits?"
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
