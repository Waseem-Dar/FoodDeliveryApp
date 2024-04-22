import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/config/app_list.dart';
import 'package:food_app/main.dart';
import 'package:food_app/widgets/address_textFeild.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../config/app_colors.dart';
import '../../config/constructor.dart';

class EditAndDeleteLocationScreen extends StatefulWidget {
  final LatLng location;
  final String address;
  final String street;
  final String instruction;
  final int index;
  const EditAndDeleteLocationScreen({super.key, required this.location, required this.address, required this.street, required this.instruction,required this.index});

  @override
  State<EditAndDeleteLocationScreen> createState() => _EditAndDeleteLocationScreenState();
}
class _EditAndDeleteLocationScreenState extends State<EditAndDeleteLocationScreen> {

  TextEditingController addressController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController aIController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
        children: [
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
                  color:addressController.text.isEmpty || streetController.text.isEmpty  ?AppColors.blackGrey:AppColors.mainColor,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Center(
                  child: Text("Add Location",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                      color:addressController.text.isEmpty || streetController.text.isEmpty ?AppColors.black6:Colors.white),),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: InkWell(
              borderRadius: BorderRadius.circular(23),
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 285,
                height: 46,
                decoration: BoxDecoration(
                  color:addressController.text.isEmpty || streetController.text.isEmpty  ?AppColors.blackGrey:AppColors.mainColor,
                  borderRadius: BorderRadius.circular(23),
                ),
                child: Center(
                  child: Text("Add Location",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                      color:addressController.text.isEmpty || streetController.text.isEmpty ?AppColors.black6:Colors.white),),
                ),
              ),
            ),
          ),
        ],
        ),
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const ImageIcon(AssetImage("assets/images/left-arrow.png"),color: Colors.white,size: 15,)),
          title: Text("Edit Address",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w600,color:Colors.white),),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
            child: Column(
              children:  [
                const SizedBox(height: 30,),
                UserWidgets.textFieldLabel("Address*"),
                AddressTextFieldWidget(controller: addressController,max: false,),
                const SizedBox(height: 15,),
                UserWidgets.textFieldLabel("Street/Apartment/Floor*"),
                AddressTextFieldWidget(controller: streetController,max: false,),
                const SizedBox(height: 15,),
                UserWidgets.textFieldLabel("Any Instructions"),
                AddressTextFieldWidget(controller: aIController,max: true,),
                const SizedBox(height: 40,),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
