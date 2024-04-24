

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/location_screens/edit_&_delete_location.dart';
import 'package:food_app/screens/location_screens/edit_location_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../config/app_colors.dart';
import '../../config/app_list.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class AddressesCard extends StatelessWidget {
  final LatLng location;
  final String address;
  final String street;
  final String instruction;
  final int index;

  const AddressesCard({super.key, required this.location, required this.address, required this.street,required this.instruction, required this.index,});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(index.toString()),
      direction: DismissDirection.endToStart,
      confirmDismiss: (DismissDirection direction) async {
        return await showDeleteDialog(context,index);
      },
      background: Container(
        color: AppColors.red1,

        child: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 25),
              child: ImageIcon(AssetImage("assets/images/delete-icon.png"),size: 20,color: Colors.white,),
            )
          ],
        ),
      ),
      child: Container(
        height: 60,
        margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1),offset: const Offset(0, 0),blurRadius: 11.2,spreadRadius: 1)]
        ),
        child:  Center(
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(left: 20,right: 10,),
            leading:  ImageIcon(const AssetImage("assets/images/location-icon.png"),size: 26,color: AppColors.mainColor,),
            title: Text(address,style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w600,color:AppColors.mainColor),),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(street,style: GoogleFonts.poppins(fontSize:11,fontWeight:FontWeight.w400,color:AppColors.mainColor),),
            ),
            trailing:IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EditAndDeleteLocationScreen(
                  location: location, address: address, street: street, instruction: instruction, index: index),));
            },
                icon: ImageIcon(const AssetImage("assets/images/edit-icon.png"),size: 21,color: AppColors.mainColor,)),
          ),
        ),
      ),
    );
  }
  Future showDeleteDialog(BuildContext context, int index)async{
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return  AlertDialog(
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
                  // AppList.addressesList.removeAt(index);
                  Navigator.pop(context,true);
                }, child: Text("Yes",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 15,color: AppColors.red),)),
            SizedBox(height:50,child: VerticalDivider(color: const Color(0xFF939393).withOpacity(0.29),width: 1,endIndent: 15,)),
            TextButton(onPressed: (){
              Navigator.pop(context,false);
            }, child: Text("No",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,fontSize: 15,color: const Color(0xFF5C90DC)),))
          ],
        );
      },
    );
  }
}
