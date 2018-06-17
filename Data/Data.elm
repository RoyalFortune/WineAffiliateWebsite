module Data.Blog exposing (..)


type alias Data =
    { posts : List Post
    , comments : LIst Comment
    }


type alias Author =
    { name : String
    , url : String
    }


type alias Comment =
    { message : String
    }


type alias Post =
    { id : String
    , imageSrc : String
    , headerText : String
    , date : String
    , author : Author
    , categories : List String
    , comments : List Comment
    , content : String
    }


type Url
    = FreeUrl String



--| PaidUrl String Token


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
