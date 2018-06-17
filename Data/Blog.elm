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



--todo, blog2 needs image tag centered


blogs : List Post
blogs =
    [ { id = "24318-1"
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
    , { id = "24318-2"
      , imageSrc = "http://www.americancraftspirits.com/wp-content/uploads/2015/11/1.jpg"
      , headerText = "Fine Wines And How To Find Them"
      , date = "May 24, 2018"
      , author = stevenRoberts
      , categories = [ "News", "Wine Knowledge" ]
      , comments = []
      , content = """
                  Fine wines and how to find them


At American Craft Spirits, we believe that New World Wines have transformed the quality, flexibility and capacity to pair fine wines with foods of all kinds and ethnicities! The modern New World Wines are typically labeled by varietal as compared to traditional or ‘Old World Wines’ are labeled by region (i.e. Rhone Valley wine refers to a wine made in the Rhone Valley region of France. Cabernet Sauvignon and Merlot are varietals, which are grown in the Bordeaux region as another example).

<p align="center">
  <a href="http://www.americancraftspirits.com/wp-content/uploads/2018/05/wine.jpg">
    <img src="http://www.americancraftspirits.com/wp-content/uploads/2018/05/wine-300x176.jpg" alt="Wine, spirits, gourmet foods" width="300" height="176" srcset="http://www.americancraftspirits.com/wp-content/uploads/2018/05/wine-300x176.jpg 300w, http://www.americancraftspirits.com/wp-content/uploads/2018/05/wine-768x450.jpg 768w, http://www.americancraftspirits.com/wp-content/uploads/2018/05/wine-600x352.jpg 600w, http://www.americancraftspirits.com/wp-content/uploads/2018/05/wine.jpg 1019w" sizes="(max-width: 300px) 100vw, 300px">
  </a>
</p>

Though this is only a partial list, we’re sharing a list of some of the most common wines and varietals in the world –

Wine, spirits, gourmet foods



[Barbera] – Barbera is a red wine grape found primarily in Italy’s Piedmont region. It produces hearty red wines with deep ruby colors, full body and low tannin levels.

[Cabernet Sauvignon] – Cabernet Sauvignon is a red wine known for its depth of flavor, aroma and ability to age (present by the wine’s noticeable tannins). It is full-bodied and intense, with cherry- currant and sometimes-herbal flavors.

[Champagne/Sparkling Wine] – These wines are made effervescent by a secondary fermentation in the winemaking process. Champagnes and sparkling wines range in style from very dry (Natural), dry (brut) and slightly sweet (extra Dry) to sweet (sec and Demi-Sec). Many sparkling wines are also identified as Blanc de Blanc (wines made from white grapes) or Blanc de Noirs (wines produced from red grapes). *Champagne is only called Champagne if it comes from the Champagne region of France.

[Chardonnay] – One of the world’s most popular wines, Chardonnay is a white wine originating from Burgundy.  Flavors range from clean and crisp with a hint of varietal flavor to rich and complex, vanilla, butter and oak-aged wines. Chardonnay typically balances fruit, acidity and texture.

[Chenin Blanc] – Chenin Blanc is a white wine with fresh, delicate floral characteristics. It grows well in warmer climates and produces light, well- balanced wines ranging from dry to off-dry (slightly sweet) styles.

[Dolcetto] – This red wine grape is found almost exclusively in Italy’s Piedmont region. It produces light and fruity wine.

[Fume Blanc] – Invented by Robert Mondavi in 1970, Fume Blanc is a Sauvignon Blanc that has been fermented in oak.

[Gewürztraminer] – Gewürztraminer is a white German wine that produced distinctive wines rich in spicy aromas and full flavors, ranging from dry to sweet. This varietal is a popular choice for Asian dishes.

[Merlot] – Merlot is a red wine with medium to full body with black cherry and herbal flavors. Merlot is typically smooth, soft and mellow.

[Mourvedre] – This warm-weather, red wine grape is common in Southern France’s Rhone Valley. Rich in color with early aromas, often blended with Syrah.

[Petite Sirah] – Petite Sirahs are inky red wines with firm, robust tannic tastes, often with peppery flavors. Petite Sirahs may complement meals with rich meats.

[Pinot Gris (Pinot Grigio)] – The low acidity of this white grape helps produce rich, lightly perfumed wines that are often more colorful than other whites.

[Pinot Noir] – Pinot Noir is the world famous grape from Burgundy and more recently California and the Pacific Northwest.  A light to medium-body wine, pegged as one of the most difficult to grow and make. Delicate and smooth with rich complexity, Pinot Noir is a versatile dinner companion.

[Riesling] – Riesling is the classic white wine grape from Germany and known for its floral perfume. Depending on where they’re made, they can be crisp and bone-dry, full-bodied and spicy or luscious and sweet.

[Rosés] – Rosés, also called blush wines, are light pink wines made from several red wine grapes. They get their color from a very short period of contact with the grape skins during the winemaking process. Rosés are light and can be very dry or somewhat sweet. They are best served well chilled.

[Sangiovese] – Sangiovese is best known as the Italian red wine, Chianti. Hearty and dry, it often displays a distinctively smooth texture with spice, raspberry and licorice flavors. Super Tuscans are red blends that typically include Sangiovese.

[Sauvignon Blanc] – Sauvignon Blanc is a white wine best known for its grassy, herbal flavors and is a popular choice for shellfish or as a refreshing alternative to Chardonnay.

[Syrah (Shiraz)] – Syrah can produce giant red wines with strong tannins and complex combinations of flavors including berry, plum and smoke. It’s known as Shiraz mainly in Australia and South Africa.

[Viognier] – Viognier is a rare white grape growing in popularity for its uniqueness.  It is an aromatic variety typically displaying peach, apricot and sometimes spicy flavors.

[Zinfandel] – Zinfandel is a medium to full-bodied red wine with berry or spicy, peppery flavors. “Zin” as it’s often referred to is excellent with sausage or chorizo pizza, spicy game and with spicy beef dishes.

<p align="center">
  <a href="http://www.americancraftspirits.com/wp-content/uploads/2018/05/vines.jpg">
    <img src="http://www.americancraftspirits.com/wp-content/uploads/2018/05/vines-300x180.jpg" alt="Fine wines, Spirits, Gourmet foods" width="300" height="180" srcset="http://www.americancraftspirits.com/wp-content/uploads/2018/05/vines-300x180.jpg 300w, http://www.americancraftspirits.com/wp-content/uploads/2018/05/vines-600x360.jpg 600w, http://www.americancraftspirits.com/wp-content/uploads/2018/05/vines.jpg 700w" sizes="(max-width: 300px) 100vw, 300px">
  </a>
</p>

Fine wines, Spirits, Gourmet foods

In the weeks ahead we’ll break these New & Old World Wines down and provide more detail, pairing and flavor profile notes for you to get more comfortable and familiar with them. Learning about and understanding wines is no different than learning the nuances of beers and the styles in which they’re made. The way to do wither is to make the time to do a little research but most importantly, buy some of these wines, look up the tasting notes which are most often available on the vineyards website or through American Craft Spirits.com as well as others!



Make it a point to buy and taste at least one bottle of fine wine and don’t just drink it; savor it, close your eyes with each sip and ask yourself what you taste and what textures you sense in the wines before you even try the wines with food. Take notes and keep the empty bottles of the most memorable wines you try and type a “Favorites List” with tasting notes for each wine! THEN, buy the same wines again and pair them with your favorite foods and take notes again to compare to the original notes to see how they may vary…as foods can change the nuance in wine flavors. Our Chef, wine experts and wine fans will teach you more about wines than you ever thought possible!



Visit us at American Craft Spirits – [http://www.americancraftspirits.com/] to learn more and claim your favorite wines in our cellar! Catch our regular Facebook posts at – [https://www.facebook.com/americancraftspirits/]



If food is the body of good living, wine is its soul.” — Clifton Fadiman\x2028\x2028

[Barbera]: https://www.cawineclub.com/Red-Wines-Barbera_CAV1_41.html
[Cabernet Sauvignon]: https://www.cawineclub.com/Red-Wines-Cabernet-Sauvignon_CAV1_3.html
[Champagne/Sparkling Wine]: https://www.cawineclub.com/White-Wines-Champagne-Sparkling-Wine_CAV2_30.html
[Chardonnay]: https://www.cawineclub.com/White-Wines-Chardonnay_CAV2_10.html
[Chenin Blanc]: https://www.cawineclub.com/White-Wines-Chenin-Blanc_CAV2_28.html
[Dolcetto]: https://www.cawineclub.com/advanced_search_result.php?keywords=dolcetto
[Fume Blanc]: https://www.cawineclub.com/White-Wines-Sauvignon-Blanc-Fume-Blanc_CAV2_11.html
[Gewürztraminer]: https://www.cawineclub.com/White-Wines-Gew%C3%BCrztraminer_CAV2_48.html
[Merlot]: https://www.cawineclub.com/Red-Wines-Merlot_CAV1_4.html
[Mourvedre]: https://www.cawineclub.com/advanced_search_result.php?keywords=Mourvedre
[Petite Sirah]: https://www.cawineclub.com/Red-Wines-Petite-Sirah_CAV1_8.html
[Pinot Gris (Pinot Grigio)]: https://www.cawineclub.com/White-Wines-Pinot-Grigio-Pinot-Gris_CAV2_12.html
[Pinot Noir]: https://www.cawineclub.com/Red-Wines-Pinot-Noir_CAV1_24.html
[Riesling]: https://www.cawineclub.com/White-Wines-Riesling_CAV2_13.html
[Rosés]:
[Sangiovese]: https://www.cawineclub.com/Red-Wines-Sangiovese_CAV1_47.html
[Sauvignon Blanc]: https://www.cawineclub.com/White-Wines-Sauvignon-Blanc-Fume-Blanc_CAV2_11.html
[Syrah (Shiraz)]: https://www.cawineclub.com/White-Wines-Viognier_CAV2_35.html
[Viognier]: https://www.cawineclub.com/White-Wines-Viognier_CAV2_35.html
[Zinfandel]: https://www.cawineclub.com/Red-Wines-Zinfandel_CAV1_26.html
[http://www.americancraftspirits.com/]: http://www.americancraftspirits.com/
[https://www.facebook.com/americancraftspirits/]: https://www.facebook.com/americancraftspirits/

                  """
      }
    ]
