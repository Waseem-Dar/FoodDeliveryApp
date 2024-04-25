import 'dart:async';
import 'package:flutter/cupertino.dart';
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
import '../../widgets/address_edit_textField.dart';

class EditLocationScreen extends StatefulWidget {
  final LatLng location;
  final String address;
  final String street;
  final String instruction;
  final int index;
  const EditLocationScreen({super.key, required this.location, required this.address, required this.street, required this.instruction,required this.index});

  @override
  State<EditLocationScreen> createState() => _EditLocationScreenState();
}
class _EditLocationScreenState extends State<EditLocationScreen> {

  TextEditingController addressController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  TextEditingController aIController = TextEditingController();
  bool isAddressEmpty = false;
  bool isStreetEmpty = false;
  bool isInstructionEmpty = false;

  @override
  void initState() {
    super.initState();
    addressController.text = widget.address;
    streetController.text = widget.street;
    aIController.text = widget.instruction;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const ImageIcon(AssetImage("assets/images/left-arrow.png"),color: Colors.white,size: 15,)),
          title: Text("Edit Address",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w600,color:Colors.white),),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children:  [
                  const SizedBox(height: 30,),
                  UserWidgets.textFieldLabel("Address*"),
                  AddressEditTextFieldWidget(controller: addressController,max: false,),
                  const SizedBox(height: 15,),
                  UserWidgets.textFieldLabel("Street/Apartment/Floor*"),
                  AddressEditTextFieldWidget(controller: streetController,max: false,),
                  const SizedBox(height: 15,),
                  UserWidgets.textFieldLabel("Any Instructions"),
                  AddressEditTextFieldWidget(controller: aIController,max: true,),

                ],
              ),
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
                      // when controller text edit  to color change
                      color: widget.address!=addressController.text || widget.street!=streetController.text || widget.instruction!=aIController.text ?AppColors.mainColor:AppColors.blackGrey,
                      borderRadius: BorderRadius.circular(23),
                    ),
                    child: Center(
                      child: Text("Save Changes",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                          color: widget.address!=addressController.text || widget.street!=streetController.text || widget.instruction!=aIController.text ?Colors.white:AppColors.black6),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
