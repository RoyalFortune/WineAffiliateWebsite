module Main exposing (..)

--import Home

import Color exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html
import Html.Attributes exposing (class)


main : Html.Html String
main =
    Element.layout
        [ Background.color white
        , Font.color (Color.rgb 5 5 5)
        , Font.size 13
        , Font.family
            [ Font.external { url = "https://fonts.googleapis.com/css?family=Open+Sans", name = "Open Sans" }
            , Font.serif

            --, Font.external { url = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.css", name = "fontawesome-all" }
            ]

        --, Font.color black
        --, Font.italic
        --, Font.size 32
        --, Font.family
        --    [ Font.external
        --        { url = "https://fonts.googleapis.com/css?family=EB+Garamond"
        --        , name = "EB Garamond"
        --        }
        --    , Font.sansSerif
        --    ]
        ]
    <|
        row [ width fill ]
            [ el [ width (fillPortion 1) ] none
            , column [ width (fillPortion 3) ]
                {-
                   Header Top Menu

                   -- TODO - Purchase or find a replacement for Helvetica Neue
                -}
                ([ row
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

                 {-
                    Header Main Menu

                    -- TODO - Purchase or find a replacement for Helvetica Neue
                 -}
                 , row
                    -- TODO Purchase or find a replacement for Helvetica Neue
                    []
                    [ el
                        [ inFront <|
                            row
                                [ spacing 25
                                , moveRight 350.0
                                , moveDown 30.0
                                ]
                                [ el [] (text "Main Home")
                                , el [] (text "Blog")
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

                 {-
                    Slider Image Row

                    Was being included from Home.elm with the following code: Home.home
                 -}
                 , row [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 } ]
                    [ el [ centerX ]
                        (image [] { src = "http://www.americancraftspirits.com/wp-content/uploads/2015/11/3.jpg", description = "American Craft Spirits" })
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

                 {-
                    Contact Us Row

                 -}
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
                                { onPress = Just "ClickMsg", label = text "Contact Us" }
                            )
                        ]
                    ]

                 {-
                    Wine Pairing Row

                 -}
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

                       -- End of Container Column
                       ]
                )
            , el
                [ width (fillPortion 1) ]
                none
            ]


icon : String -> Element msg
icon iconName =
    el [ htmlAttribute (class iconName) ] none


paddingBottom20 : Attribute msg
paddingBottom20 =
    paddingEach { bottom = 20, left = 0, right = 0, top = 0 }


paddingRight15 : Attribute msg
paddingRight15 =
    paddingEach { bottom = 0, left = 0, right = 15, top = 0 }


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
