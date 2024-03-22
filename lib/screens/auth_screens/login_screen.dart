import 'package:flutter/material.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:food_app/screens/auth_screens/signin_screen.dart';
import 'package:food_app/screens/auth_screens/send_otp_screen.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool isPasswordShow = false;

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 41),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    // color: Colors.red,
                      height: mq.height *.4,
                      child: Center(child: Text("LOGO",style: GoogleFonts.poppins(fontSize:64,fontWeight:FontWeight.w800,color:AppColors.mainColor,),))),
                  SizedBox(
                    // color: Colors.teal,
                    height: mq.height *.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Welcome Back!",style: GoogleFonts.poppins(fontSize:32,fontWeight:FontWeight.w600,color:Colors.black,),),
                            const SizedBox(height: 5,),
                            Text("Log In to your existing account.",style: GoogleFonts.poppins(
                              fontSize:15,fontWeight:FontWeight.w400,color:AppColors.black6,),textAlign: TextAlign.center,),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                           UserWidgets.textFieldLabel("Username"),
                            SizedBox(
                              // width: 311,
                              height: 46,
                              child: TextFormField(
                                controller: nameController,
                                style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(right:5,),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(23),
                                    borderSide: BorderSide(width: 1,color: AppColors.mainColor)
                                  ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(23),
                                        borderSide: BorderSide(width: 1,color: AppColors.mainColor)
                                    ),
                                    prefixIcon:Padding(
                                      padding: const EdgeInsets.fromLTRB(22,15,15,15),
                                      child: ImageIcon(const AssetImage("assets/images/user-icon.png"),size: 15,color: AppColors.mainColor,),
                                    )
                                ),
                              ),
                            ),
                            const SizedBox(height: 10,),
                            UserWidgets.textFieldLabel("Password"),
                            SizedBox(
                              // width: 311,
                              height: 46,
                              child: TextFormField(
                                controller: passwordController,
                                obscureText:isPasswordShow? false:true,
                                obscuringCharacter: "●",
                                style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.only(right: 5),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(23),
                                        borderSide: BorderSide(width: 1,color: AppColors.mainColor)
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(23),
                                        borderSide: BorderSide(width: 1,color: AppColors.mainColor)
                                    ),
                                  suffixIcon: IconButton(
                                    highlightColor: Colors.transparent,
                                      onPressed: () {
                                        setState(() {
                                          isPasswordShow = !isPasswordShow;
                                        });
                                      },
                                      icon: ImageIcon(isPasswordShow?const AssetImage("assets/images/unhide-icon.png")
                                          :const AssetImage("assets/images/hide-icon.png"),color: AppColors.mainColor,size: 18,)
                                  ),
                                  prefixIcon:Padding(
                                    padding: const EdgeInsets.fromLTRB(20,13,13,13),
                                    child: ImageIcon(const AssetImage("assets/images/lock-icon.png"),size: 18,color: AppColors.mainColor,),
                                  )
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10,left: 20),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder:  (context) => SendOTPScreen(),));
                                    },
                                    splashColor: Colors.transparent,
                                      child: Text("Forgot Password?",style: GoogleFonts.poppins(
                                        fontWeight:FontWeight.w400,fontSize:12,color:AppColors.mainColor,),)),
                                ),
                              ],
                            )
                          ],
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(23),
                          onTap: () {},
                          child: Container(
                            width: 285,
                            height: 46,
                            decoration: BoxDecoration(
                              color:nameController.text.isNotEmpty && passwordController.text.isNotEmpty?AppColors.mainColor: AppColors.whiteGrey,
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Center(
                              child: Text("Login",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:18,
                                color:nameController.text.isNotEmpty && passwordController.text.isNotEmpty?Colors.white:AppColors.black6,),),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account?",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:13,color:Colors.black,),) ,
                            InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen(),));
                                },
                                splashColor: Colors.transparent,
                                child: Text("Sign Up",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:13,color:AppColors.mainColor,))) ,
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
      ),
    );
  }
}
