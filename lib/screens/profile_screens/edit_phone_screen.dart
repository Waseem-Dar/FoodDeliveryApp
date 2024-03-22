import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../widgets/user_widgets.dart';
import 'edit_name_screen.dart';

class EditPhoneScreen extends StatefulWidget {
  const EditPhoneScreen({super.key});

  @override
  State<EditPhoneScreen> createState() => _EditPhoneScreenState();
}
TextEditingController phoneController = TextEditingController(text:"123456789321");
bool isEdit = false;
class _EditPhoneScreenState extends State<EditPhoneScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:  Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: InkWell(
            borderRadius: BorderRadius.circular(23),
            onTap: () {
              Navigator.pop(context);
              isEdit = false;
            },
            child: Container(
              width: 285,
              height: 46,
              decoration: BoxDecoration(
                color:isEdit?AppColors.mainColor: AppColors.whiteGrey,
                borderRadius: BorderRadius.circular(23),
              ),
              child: Center(
                child: Text("Save",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                  color:isEdit?Colors.white:AppColors.black6,),),
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
                    isEdit = false;},),
                  const SizedBox(height: 6,),
                  Text("Edit Phone No",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                  Divider(color: AppColors.white1,thickness: 2,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 40,),
                        UserWidgets.textFieldLabel("Phone No"),
                        TextFormField(
                          controller: phoneController,
                          style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color:AppColors.mainColor ),
                          onChanged: (value) {
                            setState(() {
                              isEdit = true;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(right: 10),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(23),
                              borderSide: BorderSide(width: 1, color: AppColors.mainColor),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(23),
                              borderSide: BorderSide(width: 1, color: AppColors.mainColor),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(23),
                              borderSide: BorderSide(width: 1, color: AppColors.red),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(23),
                              borderSide: BorderSide(width: 1, color: AppColors.red),
                            ),
                            errorStyle: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:AppColors.red),
                                              //Error show
                            errorText:"Phone No is already/ registered   OR  Phone No doesn’t exists" ,
                            isDense: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(14),
                              child: ImageIcon(const AssetImage("assets/images/phone-icon.png",), size: 18, color: AppColors.mainColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
