import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../widgets/user_widgets.dart';
import 'edit_name_screen.dart';

class EditEmailScreen extends StatefulWidget {
  const EditEmailScreen({super.key});

  @override
  State<EditEmailScreen> createState() => _EditEmailScreenState();
}
TextEditingController emailController = TextEditingController(text:"LoremIpsum123@gmail.com");
bool isEdit = false;
class _EditEmailScreenState extends State<EditEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: UserWidgets.mainButton("Save", isEdit?AppColors.mainColor: AppColors.whiteGrey, 16,
            isEdit?Colors.white:AppColors.black6, 50, () {
          Navigator.pop(context);
            }),
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
                  Text("Edit Email",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                  Divider(color: AppColors.white1,thickness: 2,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 40,),
                        UserWidgets.textFieldLabel("Email"),
                        TextFormField(
                          controller: emailController,
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
                                    // Error show
                            // errorText:"Incorrect Email  OR  Email is already registered" ,
                            isDense: true,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(14),
                              child: ImageIcon(const AssetImage("assets/images/email-icon.png",), size: 18, color: AppColors.mainColor),
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
