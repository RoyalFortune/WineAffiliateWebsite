module About exposing (Model, Msg, emptyModel, init, subscriptions, update, view)

import Color exposing (..)
import CommonHtml exposing (desktopWidth, icon, spacer)
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
        , column [ width (px 240), spacing 5, paddingEach { bottom = 0, left = 0, right = 0, top = 30 } ]
            [ Input.text [ onRight (el [ centerY, moveLeft 20 ] (icon "fa fa-search")) ]
                { onChange = Just UpdateSearch
                , text = model.searchText
                , placeholder = CommonHtml.placeholderShowBy "search" model.searchText
                , label = Input.labelBelow [] none
                }
            , spacer 20
            , el [ Font.bold ] (text "Follow Us")
            , spacer 20
            , row [ spacing 5 ]
                [ followIcon "Dribbble"
                , followIcon "Facebook"
                , followIcon "Flickr"
                , followIcon "Forrst"
                , followIcon "GitHub"
                , followIcon "GooglePlus"
                , followIcon "Instagram"
                ]
            , row [ spacing 5 ]
                [ followIcon "LinkedIn"
                , followIcon "Pinterest"
                , followIcon "RSS"
                , followIcon "Tumblr"
                , followIcon "Twitter"
                , followIcon "Vimeo"
                , followIcon "Youtube"
                ]
            , spacer 20
            , el [ Font.bold ] (text "Paulo Coelho, Brida")
            , spacer 20
            , paragraph [ width shrink ]
                [ el [ Font.color (rgb 102 102 102) ]
                    (text "“Accept what life offers you and try to drink from every cup. All wines should be tasted; some should only be sipped, but with others, drink the whole bottle.”")
                ]
            ]
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
