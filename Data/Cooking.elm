module Data.Cooking exposing (..)


type Url
    = FreeUrl String
    | PaidUrl String Token


type CookingRole
    = FreeRole
    | PaidRole
    | AuthorRole Author


type alias Cooking =
    { id : String
    , imageUrl : Url
    , role : CookingRole
    , headerText : String
    , date : String
    , categories : List String
    , comments : List Comment
    , content : String
    }


dt : List Cooking
dt =
    []


type alias Author =
    { name : String
    , url : String
    }


type alias Comment =
    { message : String
    }


type alias Token =
    { str : String
    }
