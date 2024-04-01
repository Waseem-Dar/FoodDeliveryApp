import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/widgets/cards/near_restaurant_card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../config/app_list.dart';
import '../widgets/user_widgets.dart';

class NearByScreen extends StatefulWidget {
  const NearByScreen({super.key});

  @override
  State<NearByScreen> createState() => _NearByScreenState();
}

class _NearByScreenState extends State<NearByScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 53,),
                  UserWidgets.backButton(() {
                    Navigator.pop(context);
                  },),
                  const SizedBox(height: 6,),
                  Text("Nearby Restaurants",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                  Divider(color: AppColors.white1,thickness: 2,),
                  const SizedBox(height:20),
                  SizedBox(
                      width: double.infinity,
                      child: Text("Your Location:",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                  const SizedBox(height: 5,)
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 146,
              color: Colors.teal.withOpacity(0.7),
              child: const Center(
                child: Text("MAP",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 25,),
                  SizedBox(
                      width: double.infinity,
                      child: Text("Nearby Restaurants:",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                  ListView.builder(
                    itemCount: AppList.nearRestaurantsList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    physics:const  NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      String name = AppList.nearRestaurantsList[index]["name"];
                      String address = AppList.nearRestaurantsList[index]["address"];
                      String details = AppList.nearRestaurantsList[index]["details"];
                      String image = AppList.nearRestaurantsList[index]["image"];
                      double rating = AppList.nearRestaurantsList[index]["rating"];
                      bool isOpen = AppList.nearRestaurantsList[index]["isOpen"];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: NearRestaurantCard(name: name, image: image, details: details, address: address, rating: rating, isOpen: isOpen, onTap: (){}),
                    );
                  },)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
