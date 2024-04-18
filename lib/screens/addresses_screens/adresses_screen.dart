import 'package:flutter/material.dart';
import 'package:food_app/screens/addresses_screens/search_location_screen.dart';
import 'package:food_app/widgets/cards/addresses_card_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../config/app_colors.dart';
import '../../config/app_list.dart';
import '../../main.dart';
import '../../widgets/user_widgets.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: InkWell(
          borderRadius: BorderRadius.circular(23),
          onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchLocationScreen(),));
                  },
          child: Container(
            width: 285,
            height: 46,
            decoration: BoxDecoration(
              color:AppColors.mainColor,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Center(
              child: Text("Add new address",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                  color:Colors.white),),
            ),
          ),
        ),
      ),
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
                  Text("Your Addresses",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                  Divider(color: AppColors.white1,thickness: 2,endIndent: 25,indent: 20,),
                ],
              ),
            ),
            if (AppList.addressesList.isEmpty) SizedBox(
                height: mq.height * .7,
                child:Center(child: Text("No Addresses found",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),))
            ) else ListView.builder(
              shrinkWrap: true,
              itemCount:AppList.addressesList.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 20,bottom: 70),
              itemBuilder: (context, index) {
                final double latitude = AppList.addressesList[index]["latitude"];
                final double longitude =  AppList.addressesList[index]["longitude"];
                final LatLng location =  LatLng(latitude, longitude);
                final String title = AppList.addressesList[index]["title"];
                final String subtitle = AppList.addressesList[index]["subTitle"];
              return AddressesCard(location: location, title: title, subtitle: subtitle,);
            },),
          ],
        ),
      ),
    );
  }
}
