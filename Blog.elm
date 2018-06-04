module Blog exposing (Model, Msg, emptyModel, init, subscriptions, update, view)

import Color exposing (..)
import CommonHtml
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


view : Model -> List (Element Msg)
view model =
    [ row []
        [ image [ width (px 680), height (px 514) ] { src = "http://www.americancraftspirits.com/wp-content/uploads/2015/10/simple-pleasures.jpg", description = "What Should I Expect From Fine Wine" }
        , column []
            [ Input.search []
                { onChange = Just UpdateSearch
                , text = ""
                , placeholder = CommonHtml.placeholderShowBy "search" model.searchText
                , label = Input.labelRight [] (text "a")
                }
            ]
        ]
    , row []
        []
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
