module Blog exposing (Model, Msg, emptyModel, init, subscriptions, update, view)

import Color
import Common.Html exposing (desktopWidth, followUsColumn, icon, spacer)
import Common.Route as Route
import Data.Blog exposing (Post)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Html.Attributes exposing (style)
import Markdown


subscriptions : Sub Msg
subscriptions =
    Sub.none


init : Cmd Msg
init =
    Cmd.none


type alias Model =
    { searchText : String
    , posts : List Post
    }


view : Model -> Element Msg
view model =
    row []
        [ case ( List.length model.posts, List.head model.posts ) of
            ( 1, Just post ) ->
                column []
                    [ viewBlog post
                    , viewPost post
                    ]

            _ ->
                column [] (List.map viewBlogAndLink model.posts)
        , column [ width (px 50) ] [ none ]
        , followUsColumn model.searchText UpdateSearch
        ]


viewPost : Post -> Element msg
viewPost { headerText, content } =
    paragraph []
        [ html
            (Markdown.toHtml
                [ style [ ( "width", "680px" ) ]
                ]
                content
            )
        ]


viewBlog : Post -> Element msg
viewBlog { id, imageSrc, headerText, date, author, categories, comments } =
    let
        postUrl =
            Route.getUrl (Route.Post id)
    in
    column [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 }, spacing 10 ]
        [ link []
            { url = postUrl
            , label =
                image [ width (px 680), height (px 514) ]
                    { src = imageSrc, description = headerText }
            }
        , link [ Font.size 24 ] { url = postUrl, label = text headerText }
        , row [ spacing 8 ]
            [ icon "fa fa-clock-o"
            , el [] (text date)
            , spacer 20
            , icon "fa fa-user"
            , link [] { url = author.url, label = text author.name }
            , spacer 20
            , icon "fa fa-folder-o"
            , el [] (text (String.join ", " categories))
            , spacer 20
            , icon "fa fa-comment-o"
            , text (toString (List.length comments) ++ " Comments")
            ]
        ]


viewBlogAndLink : Post -> Element msg
viewBlogAndLink post =
    let
        postUrl =
            Route.getUrl (Route.Post post.id)
    in
    column []
        [ viewBlog post
        , link []
            { url = postUrl
            , label =
                el
                    [ Background.color (Color.rgb 74 151 194)
                    , Font.color Color.white
                    , Font.size 12
                    , paddingEach { left = 12, right = 12, top = 10, bottom = 10 }
                    , Border.rounded 3
                    ]
                    (text "Read More")
            }
        ]


type Msg
    = UpdateSearch String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateSearch searchText ->
            ( { model | searchText = searchText }, Cmd.none )


emptyModel : List Post -> Model
emptyModel posts =
    { searchText = ""
    , posts = posts
    }
