import 'package:flutter/material.dart';
import 'package:food_app/config/constant.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../widgets/user_widgets.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 53,),
              UserWidgets.backButton(() {
                Navigator.pop(context);
              },),
              const SizedBox(height: 6,),
              Text("Privacy Policy",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
              Divider(color: AppColors.white1,thickness: 2,),
              const SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    UserWidgets.heading1("Privacy Policy"),
                    const SizedBox(height: 10,),
                    UserWidgets.headingAndDetails("Use of Personal Information:",Constant.privacy1),
                    UserWidgets.headingAndDetails("Data Security:",Constant.privacy2),
                    UserWidgets.headingAndDetails("Third-Party Services and Partners:",Constant.privacy3),
                    UserWidgets.headingAndDetails("Cookies and Tracking Technologies:",Constant.privacy4),
                    UserWidgets.headingAndDetails("User Controls and Choices:",Constant.privacy5),
                    UserWidgets.headingAndDetails("Legal Compliance and Disclosure:",Constant.privacy6),
                    UserWidgets.headingAndDetails("Updates to the Privacy Policy:",Constant.privacy7),
                    UserWidgets.headingAndDetails("Contact Information:",Constant.privacy8),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
