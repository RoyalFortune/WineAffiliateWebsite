module Blog exposing (Model, Msg, emptyModel, init, subscriptions, update, view)

import Color exposing (..)
import CommonHtml exposing (icon)
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
    [ row [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 } ]
        [ image [ width (px 680), height (px 514) ] { src = "http://www.americancraftspirits.com/wp-content/uploads/2015/10/simple-pleasures.jpg", description = "What Should I Expect From Fine Wine" }
        , column [ width (px 50) ] [ none ]
        , column []
            [ Input.text [ onRight (el [ centerY, moveLeft 20 ] (icon "fa fa-search")) ]
                { onChange = Just UpdateSearch
                , text = model.searchText
                , placeholder = CommonHtml.placeholderShowBy "search" model.searchText
                , label = Input.labelBelow [] none
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
