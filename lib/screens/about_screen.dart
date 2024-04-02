import 'package:flutter/material.dart';
import 'package:food_app/config/constant.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../widgets/user_widgets.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
              Text("About",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
              Divider(color: AppColors.white1,thickness: 2,),
              const SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column( 
                  children: [
                    UserWidgets.heading1("Your Ultimate Food Delivery Companion"),
                    UserWidgets.detailsText(Constant.about1,true),
                    UserWidgets.detailsText(Constant.about2,true),
                    UserWidgets.detailsText(Constant.about3,true),
                    UserWidgets.detailsText(Constant.about4,true),
                    UserWidgets.detailsText(Constant.about5,true),
                    UserWidgets.detailsText(Constant.about6,true),
                SizedBox(
                  width: double.infinity,
                  child: Text("For More Information",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,
                      color:AppColors.mainColor),textAlign: TextAlign.left,),),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UserWidgets.aboutIconButton("assets/images/instagram-icon.png", () { }),
                          UserWidgets.aboutIconButton("assets/images/twitter-icon.png", () { }),
                          UserWidgets.aboutIconButton("assets/images/facebook-icon.png", () { }),
                        ],
                      ),
                    ),
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
