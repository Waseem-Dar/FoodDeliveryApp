import 'package:flutter/material.dart';
import 'package:food_app/config/constant.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../widgets/user_widgets.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text("Terms of Service",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
              Divider(color: AppColors.white1,thickness: 2,),
              const SizedBox(height:20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    UserWidgets.heading1("Terms of Service"),
                    Text("Please read these Terms carefully before accessing or using our Service.",
                      style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.justify,),
                    const SizedBox(height: 10,),
                    UserWidgets.detailsText(Constant.terms1, true),
                    UserWidgets.headingAndDetails("1. Acceptance of Terms",Constant.terms2),
                    UserWidgets.headingAndDetails("2. Use of Service",Constant.terms3),
                    UserWidgets.detailsText(Constant.terms4, true),
                    SizedBox(
                        width: double.infinity,
                        child: Text("You agree not to:",style: GoogleFonts.poppins(
                            fontSize:12,fontWeight:FontWeight.w400,color:AppColors.black6),textAlign: TextAlign.left,)),
                    UserWidgets.termsScreenOptionText(Constant.termsO1),
                    UserWidgets.termsScreenOptionText(Constant.termsO2),
                    UserWidgets.termsScreenOptionText(Constant.termsO3),
                    UserWidgets.termsScreenOptionText(Constant.termsO4),
                    const SizedBox(height: 10,),
                    UserWidgets.headingAndDetails("3. Account Registration",Constant.terms5),
                    UserWidgets.detailsText(Constant.terms6, true),
                    UserWidgets.headingAndDetails("4. Fees and Payments",Constant.terms7),
                    UserWidgets.detailsText(Constant.terms8, true),
                    UserWidgets.headingAndDetails("5. Content",Constant.terms9),
                    UserWidgets.headingAndDetails("6. Intellectual Property",Constant.terms11),
                    UserWidgets.headingAndDetails("7. Termination",Constant.terms12),
                    UserWidgets.headingAndDetails("8. Disclaimer of Warranties",Constant.terms13),
                    UserWidgets.headingAndDetails("9. Limitation of Liability",Constant.terms14),
                    UserWidgets.headingAndDetails("10. Governing Law",Constant.terms15),
                    UserWidgets.headingAndDetails("11. Changes to Terms",Constant.terms16),
                    UserWidgets.headingAndDetails("12. Contact Us",Constant.terms17),
                    UserWidgets.detailsText(Constant.terms18, false),
                    const SizedBox(height: 20,)
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
