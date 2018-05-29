module Main exposing (..)

import Home
import Color exposing (..)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font


main =
    Element.layout
        [ Background.color white
        , Font.family
            [ Font.external
                { url = "https://fonts.googleapis.com/css?family=EB+Garamond"
                , name = "EB Garamond"
                }
            , Font.sansSerif
            ]
        ]
    <|
        row [ width (fill) ]
            [ el
                [ width (fillPortion 1) ]
                (none)
            , column [ width (fillPortion 3) ]
                [ row
                    [ Font.color (Color.rgb 5 5 5)
                    , Font.size 13
                    , Font.family
                        -- TODO Purchase or find a replacement for Helvetica Neue
                        [ Font.typeface "Helvetica Neue"
                        , Font.typeface "Arial"
                        , Font.typeface "sans-serif"
                        ]
                    , spacing 25
                    , paddingEach { bottom = 20, left = 0, right = 0, top = 20 }
                    ]
                    [ column [ width (fillPortion 2) ]
                        [ row [ spacing 15 ]
                            [ el [] (text "(706) 204-9682")
                            , el [] (text "Winesilove@americancraftspirits.com")
                            , el [] (text "Logout")
                            ]
                        ]
                    , column [ width (fillPortion 2) ]
                        []
                    , column [ width (fillPortion 1) ]
                        [ row
                            [ spacing 5
                            , Font.alignRight
                            ]
                            [ el [ alignRight ] (text "@")
                            , el [ alignRight ] (text "@")
                            , el [ alignRight ] (text "@")
                            , el [ alignRight ] (text "@")
                            , el [ alignRight ] (text "@")
                            , el [ alignRight ] (text "@")
                            , el [ alignRight ] (text "@")
                            ]
                        ]
                    ]
                , row
                    [ Font.color (Color.rgb 5 5 5)
                    , Font.size 13
                    , Font.family
                        -- TODO Purchase or find a replacement for Helvetica Neue
                        [ Font.typeface "Helvetica Neue"
                        , Font.typeface "Arial"
                        , Font.typeface "sans-serif"
                        ]
                    , spacing 25
                    ]
                    [ el
                        []
                        (image [] { src = "http://www.americancraftspirits.com/wp-content/uploads/2015/08/logo.jpg", description = "American Craft Spirits" })
                    , el [] (text "Main Home!")
                    , el [] (text "Blog")
                    , el [] (text "About")
                    , el [] (text "Tasting Room")
                    , el [] (text "Wine Store")
                    , el [] (text "Faqs")
                    , el [] (text "Contact")
                    , el [] (text "@")
                    , el [] (text "@")
                    ]
                , Home.home
                , row [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 } ]
                    [ column [ width (fillPortion 1) ]
                        [ el [ alignLeft ] (image [] { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/b1.jpg", description = "" })
                        ]
                    , column [ width (fillPortion 1) ]
                        [ el [ centerX ] (image [] { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/b2.jpg", description = "" })
                        ]
                    , column [ width (fillPortion 1) ]
                        [ el [ alignRight ] (image [] { src = "http://www.americancraftspirits.com/wp-content/uploads/2013/11/b3.jpg", description = "" })
                        ]
                    ]
                , row
                    [ paddingEach { bottom = 30, left = 0, right = 0, top = 30 }
                    , Font.family
                        -- TODO Purchase or find a replacement for Helvetica Neue
                        [ Font.typeface "Helvetica Neue"
                        , Font.typeface "Arial"
                        , Font.typeface "sans-serif"
                        ]
                    ]
                    [ column [ width (fillPortion 2), paddingEach { top = 0, right = 10, bottom = 0, left = 0 } ]
                        [ paragraph [ width (shrink) ] [ el [ Font.color (Color.rgb 2 2 2), Font.size 16 ] (text "Thousands Of Bottles Ready To Ship Today") ]
                        , paragraph [ width (shrink) ] [ el [ Font.size 13 ] (text "Our mission has always been to source for quality wines that promise great value. With over 300 wines from over 50 wineries, we’ve got a wide enough selection to have you drinking a different wine each day!") ]
                        ]
                    , column [ width (fillPortion 2), paddingEach { top = 0, right = 10, bottom = 0, left = 10 } ]
                        [ paragraph [ width (shrink) ] [ el [ Font.color (Color.rgb 2 2 2), Font.size 16 ] (text "American Craft Spirits Featured Wines") ]
                        , paragraph [ width (shrink) ] [ el [ Font.size 13 ] (text "We provide 100% satisfactory regarding to the quality and quantity of the wine. Wine is best in taste and having elegant color. We never ever like to compromise on the quality of the wine") ]
                        ]
                    , column [ width (fillPortion 2), paddingEach { top = 0, right = 0, bottom = 0, left = 10 } ]
                        [ paragraph [ width (shrink) ] [ el [ Font.color (Color.rgb 2 2 2), Font.size 16 ] (text "Our Favorite Food And Wine Bottles") ]
                        , paragraph [ width (shrink) ] [ el [ Font.size 13 ] (text "Your suggestions and valuable comments are very important for us. We always like to hear what are your desires with us, what are your expectations and what you want more from us.") ]
                        ]
                    ]
                ]
            , el
                [ width (fillPortion 1) ]
                (none)
            ]
