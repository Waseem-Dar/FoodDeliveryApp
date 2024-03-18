import 'package:flutter/material.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.mainColor
        ,
        child: Center(
          child:Text("Logo",style: GoogleFonts.poppins(fontSize:64,fontWeight:FontWeight.w800,color:Colors.white,),),
        ),
      ) ,
    );
  }
}
