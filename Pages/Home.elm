module Pages.Home exposing (Model, Msg, emptyModel, init, subscriptions, update, view)

import Color exposing (..)
import Common.Html exposing (icon, paddingBottom20)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Time as Time
import Html.Attributes exposing (style)
import Markdown


subscriptions : Sub Msg
subscriptions =
    Time.every Time.second Tick


init : Cmd Msg
init =
    Cmd.none


type Video
    = Video1
    | Video2
    | Video3
    | Video4


type alias Model =
    { searchText : String
    , videoStarted : Bool
    , video : Video
    , time : Time.Time
    , counter : Int
    }


view : Model -> Element Msg
view model =
    column [] <|
        [ row [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 } ]
            [ paragraph []
                [ html
                    (Markdown.toHtml
                        [ style [ ( "width", "680px" ) ]
                        ]
                        (showVideo
                            model.video
                        )
                    )
                ]

            --image [] { src = "http://www.americancraftspirits.com/wp-content/uploads/2015/11/3.jpg", description = "American Craft Spirits" })
            ]

        {-
           Triple Image Boxes

        -}
        , row [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 }, spacing 40 ]
            [ el [ centerX ]
                (image [] { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/b1.jpg", description = "" })
            , el [ centerX ]
                (image [] { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/b2.jpg", description = "" })
            , el [ centerX ]
                (image [] { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/b3.jpg", description = "" })
            ]

        {-
           Triple Paragraph Snippets

           -- TODO - Purchase or find a replacement for Helvetica Neue
        -}
        , row
            [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 }
            , spacing 40
            ]
            [ row [ width (px 315), centerX, height fill ]
                [ column [ width (px 50), Font.color (Color.rgb 81 186 239), Font.size 28 ]
                    [ icon "fa fa-refresh"
                    ]
                , column [ width (px 265) ]
                    [ paragraph [ width shrink, Font.color (Color.rgb 34 34 34), Font.size 16, paddingBottom20, Font.semiBold ]
                        [ text "Thousands Of Bottles Ready To Ship Today" ]
                    , paragraph [ width shrink, Font.size 13, Font.alignLeft ]
                        [ text "Our mission has always been to source for quality wines that promise great value. With over 300 wines from over 50 wineries, we’ve got a wide enough selection to have you drinking a different wine each day!"
                        ]
                    ]
                ]
            , row [ width (px 315), centerX, height fill ]
                [ column [ width (px 50), Font.color (Color.rgb 81 186 239), Font.size 28 ]
                    [ icon "fa fa-paper-plane"
                    ]
                , column [ width (px 265) ]
                    [ paragraph [ width shrink, Font.color (Color.rgb 34 34 34), Font.size 16, Font.alignLeft, paddingBottom20, Font.semiBold ]
                        [ text "American Craft Spirits Featured Wines" ]
                    , paragraph [ width shrink, Font.size 13, Font.alignLeft ]
                        [ text "We provide 100% satisfactory regarding to the quality and quantity of the wine. Wine is best in taste and having elegant color. We never ever like to compromise on the quality of the wine" ]
                    ]
                ]
            , row [ width (px 315), centerX, height fill ]
                [ column [ width (px 50), Font.color (Color.rgb 81 186 239), Font.size 28 ]
                    [ icon "fa fa-bars"
                    ]
                , column [ width (px 265) ]
                    [ paragraph [ width shrink, Font.color (Color.rgb 34 34 34), Font.size 16, Font.alignLeft, paddingBottom20, Font.semiBold ]
                        [ text "Our Favorite Food And Wine Bottles" ]
                    , paragraph [ width shrink, Font.size 13, Font.alignLeft ]
                        [ text "Your suggestions and valuable comments are very important for us. We always like to hear what are your desires with us, what are your expectations and what you want more from us." ]
                    ]
                ]
            ]

        -- {-
        --    Contact Us Row
        -- -}
        , row
            [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 }
            , spacing 40
            , Background.color (Color.rgb 245 245 245)
            ]
            [ column [ width fill ]
                [ paragraph
                    [ width fill
                    , Font.center
                    , Font.size 32
                    , Font.color (Color.rgb 0 0 0)
                    , paddingEach { bottom = 20, left = 0, right = 0, top = 20 }
                    ]
                    [ text "American Craft Spirits Gift Center" ]
                , paragraph
                    [ width fill
                    , Font.center
                    , Font.size 13
                    , paddingEach { bottom = 30, left = 0, right = 0, top = 20 }
                    ]
                    [ text "Love, with very young people, is a heartless business. We drink at that age from thirst, or to get drunk; it is only later in life that we occupy ourselves with the individuality of our wine." ]
                , el
                    [ centerX
                    , paddingEach { bottom = 20, left = 0, right = 0, top = 30 }
                    ]
                    (Input.button
                        [ Font.color (Color.rgb 255 255 255)
                        , Font.center
                        , Background.color (Color.rgb 63 144 189)
                        , paddingEach { bottom = 30, left = 10, right = 10, top = 20 }
                        , Border.rounded 3
                        ]
                        { onPress = Just ClickMsg, label = text "Contact Us" }
                    )
                ]
            ]

        -- {-
        --    Wine Pairing Row
        -- -}
        , row
            [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 }
            , spacing 40
            ]
            [ column
                [ width fill
                , Border.color (Color.rgb 237 237 237)
                , Border.solid
                , Border.widthEach { bottom = 1, left = 0, right = 0, top = 1 }
                , paddingEach { bottom = 30, left = 0, right = 0, top = 30 }
                ]
                [ paragraph
                    [ width fill
                    , Font.center
                    , paddingEach { bottom = 20, left = 0, right = 0, top = 20 }
                    , Font.bold
                    ]
                    [ text "American Craft Spirits monthly Food and Wine Pairing" ]
                , el [ centerX ]
                    (image
                        [ width (px 307)
                        , height (px 230)
                        ]
                        { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/glass_of_wine_flash_animation_30-40_fps_dimaaaaa.com_desd-d_desddim_nya.gif", description = "" }
                    )
                ]
            ]

        {-
           List of wines for sale

           Going to write a function that takes a list of images, Strings, and Floats and builds this section
        -}
        ]
            ++ imageTextTextRows
            ++ [ {-
                    Customer Testimonials
                    Going to write a function that takes a list of images and Strings and rotates them. It also makes
                    a dot for each list of image and string given that allows users to cycle through.
                 -}
                 {-
                    Browse Shop
                 -}
                 row
                    [ spacing 40
                    , Background.color (Color.rgb 245 245 245)
                    ]
                    [ column
                        [ width fill
                        , Border.color (Color.rgb 237 237 237)
                        , Border.solid
                        , Border.widthEach { bottom = 1, left = 0, right = 0, top = 1 }
                        , paddingEach { bottom = 30, left = 0, right = 0, top = 30 }
                        ]
                        [ paragraph
                            [ width fill
                            , Font.center
                            , paddingEach { bottom = 20, left = 20, right = 20, top = 20 }
                            , Font.bold
                            ]
                            [ text "Browse Shop!!!" ]
                        , paragraph
                            [ width fill
                            , Font.center
                            , paddingEach { bottom = 20, left = 20, right = 20, top = 20 }
                            , Font.bold
                            ]
                            [ text "Watch some of our great products. All of them are in their perfect size. If you have any query or suggestion, we welcome you to tell us. We love hear from you" ]
                        ]
                    ]
               ]


updateCounter : Model -> Model
updateCounter model =
    if model.counter < 10 then
        { model | counter = model.counter + 1 }
    else
        { model | counter = 0, video = toggleVideo model.video }


toggleVideo : Video -> Video
toggleVideo video =
    case video of
        Video1 ->
            Video2

        Video2 ->
            Video3

        Video3 ->
            Video4

        Video4 ->
            Video1


showVideo : Video -> String
showVideo video =
    case video of
        Video1 ->
            "Something 1"

        Video2 ->
            """<iframe src="https://www.youtube.com/embed/XT8cn6R5uaE?rel=0" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe>"""

        Video3 ->
            "Something 3"

        Video4 ->
            "Something 4"


type alias ImageTextTextRow =
    { src : String
    , description : String
    , title : String
    , textDescription : String
    }


imageTextTextRows : List (Element msg)
imageTextTextRows =
    List.map imageTextTextRow
        [ ( { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/b1.jpg"
            , description = ""
            , title = "Browse Shop1!!!"
            , textDescription = "Watch some of our great products. All of them are in their perfect size. If you have any query or suggestion, we welcome you to tell us. We love hear from you"
            }
          , { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/b1.jpg"
            , description = ""
            , title = "Browse Shop2!!!"
            , textDescription = "Watch some of our great products. All of them are in their perfect size. If you have any query or suggestion, we welcome you to tell us. We love hear from you"
            }
          , { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/b1.jpg"
            , description = ""
            , title = "Browse Shop3!!!"
            , textDescription = "Watch some of our great products. All of them are in their perfect size. If you have any query or suggestion, we welcome you to tell us. We love hear from you"
            }
          )
        , ( { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/b1.jpg"
            , description = ""
            , title = "Browse Shop4!!!"
            , textDescription = "Watch some of our great products. All of them are in their perfect size. If you have any query or suggestion, we welcome you to tell us. We love hear from you"
            }
          , { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/b1.jpg"
            , description = ""
            , title = "Browse Shop5!!!"
            , textDescription = "Watch some of our great products. All of them are in their perfect size. If you have any query or suggestion, we welcome you to tell us. We love hear from you"
            }
          , { src = ""
            , description = ""
            , title = ""
            , textDescription = ""
            }
          )
        ]


imageTextTextRow : ( ImageTextTextRow, ImageTextTextRow, ImageTextTextRow ) -> Element msg
imageTextTextRow ( itt1, itt2, itt3 ) =
    let
        imageTextTextRowHelper itt =
            column []
                [ el [ centerX ]
                    (image
                        [ width (px 307)
                        , height (px 230)
                        ]
                        { src = itt.src, description = itt.description }
                    )
                , paragraph
                    [ width fill
                    , Font.center
                    , Font.bold
                    ]
                    [ text itt.title ]
                , paragraph
                    [ width fill
                    , Font.center
                    ]
                    [ text itt.textDescription ]
                ]
    in
        row [ spacing 40 ]
            [ imageTextTextRowHelper itt1
            , imageTextTextRowHelper itt2
            , imageTextTextRowHelper itt3
            ]


type Msg
    = ClickMsg
    | Tick Time.Time


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickMsg ->
            ( model, Cmd.none )

        Tick time ->
            ( updateCounter model, Cmd.none )


emptyModel : Model
emptyModel =
    { searchText = ""
    , videoStarted = False
    , video = Video1
    , time = 0
    , counter = 0
    }
