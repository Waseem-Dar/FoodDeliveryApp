import 'package:flutter/material.dart';
import 'package:food_app/screens/auth_screens/enter_otp_screen.dart';
import 'package:food_app/widgets/text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../main.dart';
import '../../widgets/user_widgets.dart';

class SendOTPScreen extends StatefulWidget {
  const SendOTPScreen({super.key});

  @override
  State<SendOTPScreen> createState() => _SendOTPScreenState();
}

TextEditingController phoneController  = TextEditingController();

class _SendOTPScreenState extends State<SendOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:41),
            child: Column(
              children: [
                SizedBox(
                  // color: Colors.red,
                    height: mq.height *.4,
                    child: Center(child: Text("LOGO",style: GoogleFonts.poppins(
                      fontSize:64,fontWeight:FontWeight.w800,color:AppColors.mainColor,),))),
                Text("Forgot Password?",style: GoogleFonts.poppins(fontSize:32,fontWeight:FontWeight.w600,color:Colors.black,),),
                const SizedBox(height: 5,),
                Text("Create new password using phone no.",style: GoogleFonts.poppins(
                  fontSize:15,fontWeight:FontWeight.w400,color:AppColors.black6,),textAlign: TextAlign.center,),
                const SizedBox(height: 30,),
                UserWidgets.textFieldLabel("Phone No"),
                TextFieldWidget(controller:phoneController , icon: "assets/images/phone-icon.png", isPassword: false),
                 Container(
                   width: double.infinity,
                   padding: const EdgeInsets.only(left: 18,top: 5),
                   child: Text("Send OTP to recover password",style: GoogleFonts.poppins(
                    fontSize:13,fontWeight:FontWeight.w400,color:AppColors.black6,)),
                 ),
                const SizedBox(height: 50,),
                UserWidgets.mainButton("Send OTP", phoneController.text.isNotEmpty?AppColors.mainColor: AppColors.whiteGrey, 18,
                    phoneController.text.isNotEmpty?Colors.white:AppColors.black6, 10, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EnterOTPScreen(),));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
