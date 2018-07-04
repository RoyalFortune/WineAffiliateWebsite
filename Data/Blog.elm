module Data.Blog exposing (..)


type alias Author =
    { name : String
    , url : String
    }


stevenRoberts : Author
stevenRoberts =
    { name = "Steven Roberts"
    , url = ".author/sroberts/"
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


blogs : List Post
blogs =
    [ { id = "24318-2"
      , imageSrc = "http://www.americancraftspirits.com/wp-content/uploads/2015/10/simple-pleasures.jpg"
      , headerText = "What Should I Expect From Fine Wine"
      , date = "May 24, 2018"
      , author = stevenRoberts
      , categories = [ "Inspiration", "Resources", "Wine Knowledge" ]
      , comments = []
      , content = """Fine wines are not a beverage as much as they are an experience. It really depends on what you want from the wine you choose but the wonderful thing is that wines can provide a myriad of fun and tasty experiences!

Most people are familiar with desert wines like a Moscato which are very sweet and delicious. Also, most people are familiar with the high tannins wines like a well-crafted Cabernet Sauvignon, which are not sweet at all. What many people do not realize is there are wines that provide almost an infinite number of variations between those two types.

Part of the wonder and experience provided by wines is the myriad of ways they feel and taste. There are so many degrees of sweet to bold it’s amazing and provides an unlimited number of tasting experiences. To truly appreciate and experience wine is to pair the right wine with the right dish. The right fine wine can take average Chinese take out to extraordinary levels of deliciousness! It’s all about pairing the right variety of wine with the right dish so the spice and flavor of the food are complimented and enhanced by the grape. When you get it right your mouth immediately tells you it’s a homerun as the flavor explodes across your palate!

You’ve probably noticed that people are usually happier with good food. It stands to reason that anything that will enhance that experience will make it better. A fine wine can entertain, excite and even sooth you and your guests. You don’t have to be an expert to start enjoying fine wines. Fortunately, it really doesn’t take long to get a working knowledge and begin your journey of discovery.

I was like many, I started drinking desert wines and found them delicious. Then one day I decided to try a high tannin wine, a Cabernet Sauvignon. It was a shock to my system. Then a few weeks later I went on a date and tried a tannin (also called dry) forward wine. It brought the lasagna to life and changed my view of wines forever. I rarely ever drink sweet wines anymore preferring the variety of the medium to dry wines.

If you explain to a professional wine salesperson, the tastes you like and don’t like they can make suggestion to get you started on your wine experience. Here is an informative little video that shares some wine etiquette, so you’ll feel confident with your guests.

<iframe src="https://www.youtube.com/embed/XT8cn6R5uaE?rel=0" width="560" height="315" frameborder="0" allowfullscreen="allowfullscreen"></iframe>

Visit us at Americancraftspirits.com and we can provide suggestion as well as a place to get information and even fine wines! See you there…"""
      }
    , { id = "24318-1"
      , imageSrc = "http://www.americancraftspirits.com/wp-content/uploads/2015/11/1.jpg"
      , headerText = "Fine Wines And How To Find Them"
      , date = "May 24, 2018"
      , author = stevenRoberts
      , categories = [ "News", "Wine Knowledge" ]
      , comments = []
      , content = ""
      }
    ]
