import 'package:flutter/gestures.dart';
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
  void showDeleteDialog(BuildContext context,int index){
    showDialog(context: context, builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(19)),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      contentPadding: const EdgeInsets.only( right: 24,left: 24,top: 24,bottom: 0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Are you sure you want to remove this address/location?",
            style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.black),textAlign: TextAlign.center,),
          const SizedBox(height: 15,),
          Divider(
            height:1,
            color: const Color(0xFF939393).withOpacity(0.29),
          ),
        ],
      ),
      actionsPadding:  EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.spaceEvenly,
      actions: [
        TextButton(
            onPressed: (){
              Navigator.pop(context);
            }, child: Text("Yes",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.red),)),
        SizedBox(height:50,child: VerticalDivider(color: const Color(0xFF939393).withOpacity(0.29),width: 1,endIndent: 15,)),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("No",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 15,color: const Color(0xFF5C90DC)),))
      ],
    ));
  }
}
