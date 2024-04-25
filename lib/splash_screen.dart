import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:food_app/screens/auth_screens/login_or_signup_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginOrSignUpScreen(),));
    });
  }
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
