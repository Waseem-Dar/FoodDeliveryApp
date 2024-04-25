import 'package:flutter/material.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:food_app/screens/auth_screens/login_screen.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/widgets/password_textField_widget.dart';
import 'package:food_app/widgets/text_field.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';



class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();


class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:41 ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  // color: Colors.red,
                    height: 180,
                    child: Center(child: Text("LOGO",style: GoogleFonts.poppins(fontSize:64,fontWeight:FontWeight.w800,color:AppColors.mainColor,),))),
                Text("Let's Get Started!",style: GoogleFonts.poppins(fontSize:32,fontWeight:FontWeight.w600,color:Colors.black,),),
                const SizedBox(height: 5,),
                Text("Create a new account to continue.",style: GoogleFonts.poppins(
                  fontSize:15,fontWeight:FontWeight.w400,color:AppColors.black6,),textAlign: TextAlign.center,),
                const SizedBox(height: 20,),
                UserWidgets.textFieldLabel("Username"),
                TextFieldWidget(controller: nameController, icon: "assets/images/user-icon.png",isPassword:false ,),
                const SizedBox(height: 10,),
                UserWidgets.textFieldLabel("Email"),
                TextFieldWidget(controller: emailController, icon: "assets/images/email-icon.png",isPassword: false,),
                const SizedBox(height: 10,),
                UserWidgets.textFieldLabel("Phone"),
                TextFieldWidget(controller: phoneController, icon: "assets/images/phone-icon.png",isPassword: false,),
                const SizedBox(height: 10,),
                UserWidgets.textFieldLabel("Password"),
                TextFieldWidget(controller: passwordController, icon: "assets/images/lock-icon.png", isPassword: true),
                const SizedBox(height: 10,),
                UserWidgets.textFieldLabel("Confirm Password"),
                TextFieldWidget(controller: confirmPasswordController, icon: "assets/images/lock-icon.png", isPassword: true),
                const SizedBox(height: 30,),
                UserWidgets.mainButton("Sign Up", (nameController.text.isNotEmpty && emailController.text.isNotEmpty && phoneController.text.isNotEmpty && passwordController.text.isNotEmpty
                    && confirmPasswordController.text.isNotEmpty)?AppColors.mainColor: AppColors.whiteGrey,
                    18, (nameController.text.isNotEmpty && emailController.text.isNotEmpty && phoneController.text.isNotEmpty && passwordController.text.isNotEmpty
                        && confirmPasswordController.text.isNotEmpty)?Colors.white:AppColors.black6,
                    10, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
                    }),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:13,color:Colors.black,),) ,
                    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen(),));
                        },
                        splashColor: Colors.transparent,
                        child: Text("Login In",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:13,color:AppColors.mainColor,))) ,
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
