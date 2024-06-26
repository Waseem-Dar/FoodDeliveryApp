import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../widgets/user_widgets.dart';

class EditNameScreen extends StatefulWidget {

  const EditNameScreen({super.key,});

  @override
  State<EditNameScreen> createState() => _EditNameScreenState();
}
bool isEdit = false;
TextEditingController firstNameController = TextEditingController(text:"Lorem" );
TextEditingController lastNameController = TextEditingController(text: "Ipsum");
class _EditNameScreenState extends State<EditNameScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: UserWidgets.mainButton("Save", isEdit?AppColors.mainColor: AppColors.whiteGrey, 16,
            isEdit?Colors.white:AppColors.black6, 50, () {
          Navigator.pop(context);
            }),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: Column(
                children: [
                  const SizedBox(
                    height: 53,),
                  UserWidgets.backButton(() {
                    Navigator.pop(context);
                  isEdit = false;},),
                  const SizedBox(height: 6,),
                  Text("Edit Username",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                  Divider(color: AppColors.white1,thickness: 2,),
                  const SizedBox(height: 40,),
                  UserWidgets.profileTextField1(firstNameController, "First Name",() => setState(() => isEdit = true,)),
                  const SizedBox(height: 10,),
                  UserWidgets.profileTextField1(lastNameController, "First Name", () => setState(() => isEdit = true,)),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
