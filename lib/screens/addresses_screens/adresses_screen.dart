import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
      floatingActionButton:UserWidgets.mainButton("Add new address", AppColors.mainColor, 16, Colors.white, 50, () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchLocationScreen(),));
      }),
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
                 double latitude = AppList.addressesList[index]["latitude"];
                 double longitude =  AppList.addressesList[index]["longitude"];
                 LatLng location =  LatLng(latitude, longitude);
                 String address = AppList.addressesList[index]["address"];
                 String street = AppList.addressesList[index]["street"];
                 String instruction = AppList.addressesList[index]["instruction"];
              return AddressesCard(location: location, address: address, street: street,instruction: instruction.isNotEmpty?instruction:"",index: index,);
            },),
          ],
        ),
      ),
    );
  }
}
