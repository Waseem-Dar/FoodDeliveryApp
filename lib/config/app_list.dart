

import 'package:food_app/config/app_colors.dart';

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

  static List<Map<String,dynamic>> voucherBannerList = [
    {"percentage":70,"image":"assets/images/v-banner-1.png"},
    {"percentage":20,"image":"assets/images/v-banner-2.png"},
    {"percentage":20,"image":"assets/images/v-banner-3.png"},
    {"percentage":70,"image":"assets/images/v-banner-1.png"},
    {"percentage":20,"image":"assets/images/v-banner-2.png"},
    {"percentage":20,"image":"assets/images/v-banner-3.png"},

  ];

  static List<Map<String,dynamic>> popularBurgersList = [
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-2.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":570},
    {"name":"Mc Crispy Burger","image":"assets/images/burger-3.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":620},
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-2.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":570},
    {"name":"Mc Crispy Burger","image":"assets/images/burger-3.png","info":"Ground beef, tomato sauce, cheddar cheese, chili powder","favorite":false,"price":620},
  ];
  static List<Map<String,dynamic>> myCartList = [
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-2.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder","isSelected":false,"price":570,"count":1},
    {"name":"Mc Crispy Burger","image":"assets/images/burger-3.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder","isSelected":false,"price":620,"count":1},
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-2.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder","isSelected":false,"price":570,"count":1},
    {"name":"Mc Crispy Burger","image":"assets/images/burger-3.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder","isSelected":false,"price":620,"count":1},
  ];

  static List<Map<String,dynamic>> pastOrderList = [
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-3.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder","address":"Cafe Live, Bahria Town ph 4","date":"Delivered on 9 March, 02:20","isSelected":false,"price":570,},
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-3.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder","address":"Cafe Live, Bahria Town ph 4","date":"Delivered on 9 March, 02:20","isSelected":false,"price":570,},
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-3.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder","address":"Cafe Live, Bahria Town ph 4","date":"Delivered on 9 March, 02:20","isSelected":false,"price":570,},
    {"name":"Big Spicy Cheese Burger","image":"assets/images/burger-3.png","details":"Ground beef, tomato sauce, cheddar cheese, chili powder","address":"Cafe Live, Bahria Town ph 4","date":"Delivered on 9 March, 02:20","isSelected":false,"price":570,},
  ];

  static List<Map<String,dynamic>> voucherList = [
    {"date":"19 Mar 2024","percent":25,"orderPrice":5000,"bgColor":AppColors.mainColor,},
    {"date":"19 Mar 2024","percent":10,"orderPrice":15000,"bgColor":AppColors.green,},
    {"date":"19 Mar 2024","percent":10,"orderPrice":10000,"bgColor":AppColors.pink,},
    {"date":"19 Mar 2024","percent":25,"orderPrice":5000,"bgColor":AppColors.mainColor,},
    {"date":"19 Mar 2024","percent":10,"orderPrice":15000,"bgColor":AppColors.green,},
    {"date":"19 Mar 2024","percent":10,"orderPrice":10000,"bgColor":AppColors.pink,},
  ];
  static List<Map<String,dynamic>> favRestaurantsList = [
    {"name":"Desi Tarrka","image":"assets/images/fav-1.png","details":"Experience the vibrant tastes of our authentic Desi restaurant,  where every dish tells a story of tradition and flavor fusion.","address":"Bahria Town ph 4","rating":4.8},
    {"name":"Karahi Point","image":"assets/images/fav-2.png","details":"Indulge in a fiery symphony of flavors at our spicy haven.","address":"Giga Mall, Rawalpindi","rating":3.5},
    {"name":"Desi Tarrka","image":"assets/images/fav-1.png","details":"Experience the vibrant tastes of our authentic Desi restaurant,  where every dish tells a story of tradition and flavor fusion.","address":"Bahria Town ph 4","rating":4.8},
    {"name":"Karahi Point","image":"assets/images/fav-2.png","details":"Indulge in a fiery symphony of flavors at our spicy haven.","address":"Giga Mall, Rawalpindi","rating":3.5},
  ];

  static List<Map<String,dynamic>> nearRestaurantsList = [
    {"name":"Desi Tarrka","image":"assets/images/fav-1.png","details":"Experience the vibrant tastes of our authentic Desi restaurant,  where every dish tells a story of tradition and flavor fusion.","address":"Bahria Town ph 4","rating":4.8,"isOpen":true},
    {"name":"Angeethi","image":"assets/images/angeeti-banner.png","details":"Experience the vibrant tastes of our authentic Desi restaurant,  where every dish tells a story of tradition and flavor fusion.","address":"PWD, Rawalpindi","rating":4.8,"isOpen":false},
    {"name":"Indian Cuisine","image":"assets/images/banner-3.png","details":"Step into a realm of spices and aromas, your gateway to the exquisite world of Indian cuisine.","address":"Bahria Town ph 4, Rawalpindi","rating":4.8,"isOpen":true},
    {"name":"Angeethi","image":"assets/images/angeeti-banner.png","details":"Embark on a gastronomic adventure, where every dish tells a story of India's rich culinary heritage.","address":"PWD, Rawalpindi","rating":4.8,"isOpen":false},
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

  static List<Map<String, dynamic>> addressesList = [
    {"latitude":33.5311662,"longitude":73.1527292,"address":"DHA  Ph II","street":"Islamabad, Pakistan","instruction":""},
    {"latitude":33.5511568,"longitude":73.0936603,"address":"Bahria Town Ph 04","street":"Rawalpindi, Pakistan","instruction":"any instruction"},
    {"latitude":33.6912565,"longitude":72.9978815,"address":"F10/2","street":"Islamabad, Pakistan","instruction":"any instruction"},
    {"latitude":33.6679415,"longitude":73.069495,"address":"I8 Markaz","street":"Islamabad, Pakistan","instruction":"any instruction"},
  ];

}