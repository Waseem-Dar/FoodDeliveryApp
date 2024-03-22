import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/config/app_list.dart';
import 'package:food_app/widgets/cards/fav_restaurants_card.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/app_colors.dart';
import '../../widgets/user_widgets.dart';
import '../main.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

TextEditingController emailController = TextEditingController(text:"LoremIpsum123@gmail.com");

List<bool> isSelected1 = [true];
List<bool> isSelected2 = [false];
class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:  isSelected1[0]?
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: InkWell(
            borderRadius: BorderRadius.circular(23),
            onTap: () {
              Navigator.pop(context);

            },
            child: Container(
              width: 285,
              height: 46,
              decoration: BoxDecoration(
                color:AppColors.mainColor,
                borderRadius: BorderRadius.circular(23),
              ),
              child: Center(
                child: Text("Explore Restaurants",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                  color:Colors.white),),
              ),
            ),
          ),
        ):Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: InkWell(
            borderRadius: BorderRadius.circular(23),
            onTap: () {
              Navigator.pop(context);

            },
            child: Container(
              width: 285,
              height: 46,
              decoration: BoxDecoration(
                color:AppColors.mainColor,
                borderRadius: BorderRadius.circular(23),
              ),
              child: Center(
                child: Text("Explore Foods",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                    color:Colors.white),),
              ),
            ),
          ),
        ),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 53,),
                  UserWidgets.backButton(() {
                    Navigator.pop(context);
                    },),
                  const SizedBox(height: 6,),
                  Text("Favourites",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                  Divider(color: AppColors.white1,thickness: 2,),
                  const SizedBox(height:20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ToggleButtons(
                        selectedColor: Colors.white,
                        selectedBorderColor:AppColors.mainColor ,
                        color: Colors.black,
                        fillColor: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(15),
                        isSelected: isSelected1,
                        constraints: const BoxConstraints(),
                        onPressed: (int index) {
                          setState(() {
                            if (!isSelected1[index]) {
                              isSelected1[index] = true;
                              isSelected2[0] = false;
                            }
                          });
                        },
                        children:  const [
                          SizedBox(

                            width: 107,
                            height: 26,
                            child: Center(child: Text('Restaurants')),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      ToggleButtons(
                        selectedColor: Colors.white,
                        selectedBorderColor:AppColors.mainColor ,
                        color: Colors.black,
                        fillColor: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(15),
                        isSelected: isSelected2,
                        constraints: const BoxConstraints(),
                        onPressed: (int index) {
                          setState(() {
                            if (!isSelected2[index]) {
                              isSelected2[index] = true;
                              isSelected1[0] = false;
                            }
                          });
                        },
                        children:  [
                          SizedBox(
                            width: 107,
                            height: 26,
                            child: Center(child: Text('Foods',style:GoogleFonts.poppins())),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height:20),

                  isSelected1[0]?
                        AppList.favRestaurantsList.isEmpty?SizedBox(
                            height: mq.height * .6,
                            child:Center(child: Text("No Favourite Restaurants",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),))
                        ):                    //listView padding
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: AppList.favRestaurantsList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(7,0,7,55),
                    itemBuilder: (context, index) {
                      String name = AppList.favRestaurantsList[index]["name"];
                      String address = AppList.favRestaurantsList[index]["address"];
                      String details = AppList.favRestaurantsList[index]["details"];
                      String image = AppList.favRestaurantsList[index]["image"];
                      double rating = AppList.favRestaurantsList[index]["rating"];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: FavRestaurantsCard(image: image, name: name, address: address, details: details, rating: rating),
                    );
                  },):
                  SizedBox(
                      height: mq.height * .6,
                      child:Center(child: Text("No Favourite Foods",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),))
                  )




                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
