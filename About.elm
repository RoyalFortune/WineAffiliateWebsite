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
            [ row [ paddingEach { bottom = 30, left = 0, right = 0, top = 20 } ] [ paragraph [ Font.size 20, Font.semiBold, Font.center ] [ text "Who’s Behind the Heart & Soul of American Craft Spirits?" ] ]
            , row []
                [ textColumn [ Font.size 13, Font.color (Color.rgb 102 102 102), Font.wordSpacing 1 ]
                    [ paragraph [ spacing 20, paddingEach { bottom = 30, left = 0, right = 0, top = 30 } ] [ text "The founders of American Craft Spirits are passionate lovers of food and wine, and have traveled the\n\nworld to experience the good, the bad and the amazing in the world of wine and spirits! Though\n\nhighly focused on California wines, the founders of “ACS” have developed a knack for choosing the\n\nvery best wines and food through experience, a passion for excellence, and a deep desire to\n\nexperience the best things in life; and Food & Wine stand heads and tails above all else to the\n\nfounders of American Craft Spirits!" ]
                    , paragraph [ spacing 20, paddingEach { bottom = 30, left = 0, right = 0, top = 30 } ] [ text "Executive Chef, Entrepreneur & Hospitality Expert – Steven Roberts\n\nSteven Roberts is a certified executive chef, professionally trained hospitality expert and has created\n\nmenus and food and wine pairings, dinners and events around the world!\n\nFrom receiving honors from the Chaîne des Rôtisseurs, the American Culinary Federation as well as\n\nbeing a cookbook co-author, a guest on the TV Food Network, and receiving accolades from Food\n\n& Wine magazine, Steven has more than 25 years experience in all facets of all things gastronomique.\n\nSteven has appeared on Fox News, the Today show and several local television food and wine\n\nsegments as an expert in his field. Steven remains an expert in his field, a high-profile consultant in\n\nthe industry and is constantly researching the industry for innovations, trends and world-class\n\nproducts in food and wine industry!" ]
                    , paragraph [ spacing 20, paddingEach { bottom = 30, left = 0, right = 0, top = 30 } ] [ text "Wine Enthusiast, Entrepreneur & Food & Wine Evangelist – Tony Roberts\n\nTony traveled the world at a very young age while in the military and through spending time in\n\ncountries all around the world, he not only developed a passion for food and wine, but a keen and\n\ninnate sense of wine and spirits quality, but a pallet that sets him apart from most.\n\nIf it’s true that expertise in any endeavor requires 10,000 hours of experience and repetition, Tony is\n\nindeed an expert in his own right! A lover of life, the finer things in life, and a desire to look at wines\n\nand spirits not only from a flavor and quality perspective, but a cultural and historical perspective\n\nmake Tony a diverse and multi-dimensional enthusiast and student within the food and wine\n\nindustry." ]
                    ]
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
