module Data.Data exposing (..)

-- Product Info
--  Affiliate Link
--  Product Title
--  Product SubTitle
--  Price
--  Description
--  Comments/Reviews
--  Tags?
--  Categories?
-- Comments/Reviews
--  UserGuid
--  User Name
--  Verified Purchase?
--  Comment/Review Text
--  Rating
-- Dictionary
--  No clue yet


type alias Products =
    { url : ProductUrl
    , title : String
    }


type alias Data =
    { posts : List Post
    , comments : List Comment
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


type ProductUrl
    = AffiliateUrl String



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


type alias Token =
    { str : String
    }
