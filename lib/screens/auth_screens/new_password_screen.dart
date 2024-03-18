import 'package:flutter/material.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:food_app/widgets/text_field.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../main.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();


class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    // mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 41),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    // color: Colors.red,
                      height: 330,
                      child: Center(child: Text("LOGO",style: GoogleFonts.poppins(fontSize:64,fontWeight:FontWeight.w800,color:AppColors.mainColor,),))),
                  SizedBox(
                    // color: Colors.teal,
                    height: mq.height *.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("New Password",style: GoogleFonts.poppins(fontSize:32,fontWeight:FontWeight.w600,color:Colors.black,),),
                            const SizedBox(height: 5,),
                            Text("Enter New password",style: GoogleFonts.poppins(
                              fontSize:15,fontWeight:FontWeight.w400,color:AppColors.black6,),textAlign: TextAlign.center,),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            UserWidgets.textFieldLabel("New Password"),
                            TextFieldWidget(controller: passwordController,
                                icon: "assets/images/lock-icon.png", isPassword: true),
                            const SizedBox(height: 10,),
                            UserWidgets.textFieldLabel("Confirm New Password"),
                            TextFieldWidget(controller: confirmPasswordController,
                                icon: "assets/images/lock-icon.png", isPassword: true),
                          ],
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(23),
                          onTap: () {},
                          child: Container(
                            width: 285,
                            height: 46,
                            decoration: BoxDecoration(
                              color:confirmPasswordController.text.isNotEmpty && passwordController.text.isNotEmpty?AppColors.mainColor: AppColors.whiteGrey,
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Center(
                              child: Text("Done",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:18,
                                color:confirmPasswordController.text.isNotEmpty && passwordController.text.isNotEmpty?Colors.white:AppColors.black6,),),
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
