

class AppList{


  static List<String> choiceList = ["All","Desi","Chinese","Fast food","Burger","Pizza","Fries"];
  static List<Map<String,dynamic>> desiFoodList = [
    {"name":"Tikka Bytes","image":"assets/images/tikka-image.png"},
    {"name":"Desi Pakwan","image":"assets/images/pakwan-image.png"},
    {"name":"Karahi Point","image":"assets/images/karahi-image.png"},
    {"name":"Tikka Bytes","image":"assets/images/tikka-image.png"},
    {"name":"Desi Pakwan","image":"assets/images/pakwan-image.png"},
    {"name":"Karahi Point","image":"assets/images/karahi-image.png"},
  ];

  static List<Map<String,dynamic>> deliciousFoodList = [
    {"name":"Pizza","image":"assets/images/pizza-1.png"},
    {"name":"Burger","image":"assets/images/burger-1.png"},
    {"name":"Fries ","image":"assets/images/fries-1.png"},
    {"name":"Wraps ","image":"assets/images/wrap-1.png"},
    {"name":"Pizza","image":"assets/images/pizza-1.png"},
    {"name":"Burger","image":"assets/images/burger-1.png"},
    {"name":"Fries ","image":"assets/images/fries-1.png"},
    {"name":"Wraps ","image":"assets/images/wrap-1.png"},
  ];

  static List<Map<String,dynamic>> popularBurgersList = [
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-2.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":570},
    {"name":"Mc Crispy Burger","image":"assets/images/burger-3.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":620},
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-2.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":570},
    {"name":"Mc Crispy Burger","image":"assets/images/burger-3.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":620},
  ];
 static List<Map<String,dynamic>> myCartList = [
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-2.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":570},
    {"name":"Mc Crispy Burger","image":"assets/images/burger-3.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":620},
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-2.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":570},
    {"name":"Mc Crispy Burger","image":"assets/images/burger-3.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":620},
  ];

  static List<Map<String,dynamic>> favRestaurantsList = [
    {"name":"Desi Tarrka","image":"assets/images/fav-1.png","details":"Experience the vibrant tastes of our authentic Desi restaurant,  where every dish tells a story of tradition and flavor fusion.","address":"Bahria Town ph 4","rating":4.8},
    {"name":"Karahi Point","image":"assets/images/fav-2.png","details":"Indulge in a fiery symphony of flavors at our spicy haven.","address":"Giga Mall, Rawalpindi","rating":3.5},
    {"name":"Desi Tarrka","image":"assets/images/fav-1.png","details":"Experience the vibrant tastes of our authentic Desi restaurant,  where every dish tells a story of tradition and flavor fusion.","address":"Bahria Town ph 4","rating":4.8},
    {"name":"Karahi Point","image":"assets/images/fav-2.png","details":"Indulge in a fiery symphony of flavors at our spicy haven.","address":"Giga Mall, Rawalpindi","rating":3.5},
  ];

  static List<Map<String,dynamic>> favFoodList = [
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-2.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder.","price":570,"rating":4.8},
    {"name":"Mc Crispy Burger","image":"assets/images/burger-3.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder.","price":520,"rating":3.8},
    {"name":"Spicy Chicken Karahi","image":"assets/images/karahi-1.png","details":"Savor the sizzle of our signature Spicy Chicken Karahi.","price":500,"rating":3.5},
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-2.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder.","price":570,"rating":4.8},
    {"name":"Mc Crispy Burger","image":"assets/images/burger-3.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder.","price":520,"rating":3.8},
    {"name":"Spicy Chicken Karahi","image":"assets/images/karahi-1.png","details":"Savor the sizzle of our signature Spicy Chicken Karahi.","price":500,"rating":3.5},
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-2.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder.","price":570,"rating":4.8},
    {"name":"Mc Crispy Burger","image":"assets/images/burger-3.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder.","price":520,"rating":3.8},
    {"name":"Spicy Chicken Karahi","image":"assets/images/karahi-1.png","details":"Savor the sizzle of our signature Spicy Chicken Karahi.","price":500,"rating":3.5},
  ];
  static List<Map<String,dynamic>> cartSimilarItemList = [
    {"image":"assets/images/burger-5.png","details":"Juicy Burger with sauce of your own choice ","price":570,"oldPrice":950,"rating":3.6},
    {"image":"assets/images/burger-6.png","details":"Juicy Burger with sauce of your own choice ","price":600,"oldPrice":999,"rating":2.5},
    {"image":"assets/images/burger-4.png","details":"Juicy Burger with sauce of your own choice ","price":650,"oldPrice":1099,"rating":4.8},
    {"image":"assets/images/burger-5.png","details":"Juicy Burger with sauce of your own choice ","price":570,"oldPrice":950,"rating":3.6},
    {"image":"assets/images/burger-6.png","details":"Juicy Burger with sauce of your own choice ","price":600,"oldPrice":999,"rating":2.5},
    {"image":"assets/images/burger-4.png","details":"Juicy Burger with sauce of your own choice ","price":650,"oldPrice":1099,"rating":4.8},
  ];

  static List<Map<String,dynamic>> dealList = [
    {"image":"assets/images/deal-1.png"},
    {"image":"assets/images/deal-2.png"},
    {"image":"assets/images/deal-3.png"},
    {"image":"assets/images/deal-4.png"},
    {"image":"assets/images/deal-1.png"},
    {"image":"assets/images/deal-2.png"},
    {"image":"assets/images/deal-3.png"},
    {"image":"assets/images/deal-4.png"},

  ];
  static List<Map<String,dynamic>> dealBannerList = [
    {"image":"assets/images/banner-1.png"},
    {"image":"assets/images/banner-2.png"},
    {"image":"assets/images/banner-1.png"},
    {"image":"assets/images/banner-2.png"},


  ];

  static List<Map<String,dynamic>> rateList = [
    {"name":"Desi Tarkka","image":"assets/images/pop-1.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","rating":3.0},
    {"name":"Spicy Cafe","image":"assets/images/pop-2.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","rating":4.5},
    {"name":"Desi Tarkka","image":"assets/images/pop-1.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","rating":3.0},
    {"name":"Spicy Cafe","image":"assets/images/pop-2.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","rating":4.5},

  ];


}