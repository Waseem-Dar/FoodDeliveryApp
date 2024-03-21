import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/profile_screens/edit_name_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../widgets/user_widgets.dart';
import 'edit_email_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

TextEditingController nameController = TextEditingController(text: "LoremIpsum");
TextEditingController emailController = TextEditingController(text: "LoremIpsum123@gmail.com");
TextEditingController phoneController = TextEditingController(text: "1234578923");
TextEditingController passwordController = TextEditingController(text: "1234578923");
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: InkWell(
          borderRadius: BorderRadius.circular(23),
          onTap: () {},
          child: Container(
            width: 285,
            height: 46,
            decoration: BoxDecoration(
              color:AppColors.mainColor,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Center(
              child: Text("Done",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:18,
                  color:Colors.white),),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 53,),
                UserWidgets.backButton(() => Navigator.pop(context),),
                const SizedBox(height: 6,),
                Text("Edit your Profile",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                Divider(color: AppColors.white1,thickness: 2,),
                const SizedBox(height: 30,),
                const SizedBox(
                  height: 65,
                  width: 65,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/image-icon.png"),
                  ),
                ),
                const SizedBox(height: 10,),
                Text("LoremIpsum",style: GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w500,color:Colors.black),),
                Text("Islamabad, Pakistan",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),),
                const SizedBox(height: 20,),
                Container(
                    padding: const EdgeInsets.only(left: 10),
                    width: double.infinity,
                    child: Text("Personal Details",style: GoogleFonts.poppins(
                        fontSize:16,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                const SizedBox(height: 20,),
                UserWidgets.profileTextField(nameController, "assets/images/user-icon.png", "Username", false, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditNameScreen(),));
                },),
                const SizedBox(height: 10,),
                UserWidgets.profileTextField(emailController, "assets/images/email-icon.png", "Email", false, () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditEmailScreen(),));
                },),
                const SizedBox(height: 10,),
                UserWidgets.profileTextField(phoneController, "assets/images/phone-icon.png", "Phone No", false, () {},),
                const SizedBox(height: 10,),
                UserWidgets.profileTextField(passwordController, "assets/images/lock-icon.png", "Change Password", true, () {},),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
