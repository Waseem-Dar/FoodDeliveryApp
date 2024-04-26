import 'package:flutter/material.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:food_app/screens/auth_screens/signin_screen.dart';
import 'package:food_app/screens/auth_screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';
import '../../widgets/user_widgets.dart';

class LoginOrSignUpScreen extends StatefulWidget {
  const LoginOrSignUpScreen({super.key});

  @override
  State<LoginOrSignUpScreen> createState() => _LoginOrSignUpScreenState();
}

class _LoginOrSignUpScreenState extends State<LoginOrSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                    // color: Colors.red,
                    height: mq.height *.40,
                    child: Center(child: Text("LOGO",style: GoogleFonts.poppins(fontSize:64,fontWeight:FontWeight.w800,color:AppColors.mainColor,),))),
                SizedBox(
                  // color: Colors.teal,
                  height: mq.height *.50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Hello!",style: GoogleFonts.poppins(fontSize:32,fontWeight:FontWeight.w600,color:Colors.black,),),
                      const SizedBox(height: 5,),
                      Text("Welcome to [FoodApp Name], where every login is a journey to culinary delight!",style: GoogleFonts.poppins(
                        fontSize:15,fontWeight:FontWeight.w400,color:AppColors.black6,),textAlign: TextAlign.center,),
                        ],
                      ),
                      Column(
                        children: [
                          UserWidgets.mainButton("Log In", AppColors.mainColor, 18, Colors.white, 15, () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                          }),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(23),
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                              },
                              child: Container(
                                width: double.infinity,
                                height: 46,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.mainColor,width: 1,),
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                child: Center(child: Text("Sign Up",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w400,color:AppColors.mainColor),),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("or Sign In with",style: GoogleFonts.poppins(fontSize:15,fontWeight:FontWeight.w400,color:AppColors.black6,),),
                          const SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment:MainAxisAlignment.center,
                            children: [
                              ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      surfaceTintColor: AppColors.whiteGrey,
                                      foregroundColor: AppColors.whiteGrey,
                                      elevation: 0,
                                      backgroundColor: AppColors.whiteGrey,
                                      fixedSize: const Size(105, 29),
                                      minimumSize: const Size(105, 29)
                                  ),
                                  onPressed: (){},
                                  icon: Image.asset("assets/images/facebook-icon.png",width: 18,),
                                  label: Text("Facebook",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color:AppColors.black6,),)
                              ),
                              const SizedBox(width: 7,),
                              ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      surfaceTintColor: AppColors.whiteGrey,
                                      foregroundColor: AppColors.whiteGrey,
                                      elevation: 0,
                                      backgroundColor: AppColors.whiteGrey,
                                      fixedSize: const Size(105, 29),
                                      minimumSize: const Size(105, 29)
                                  ),
                                  onPressed: (){},
                                  icon: Image.asset("assets/images/google-icon.png",width: 18,),
                                  label: Text("Google",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color:AppColors.black6,),)
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
