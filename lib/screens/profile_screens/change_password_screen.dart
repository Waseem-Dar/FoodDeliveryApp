import 'package:flutter/material.dart';
import 'package:food_app/widgets/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/app_colors.dart';
import '../../widgets/password_textField_widget.dart';
import '../../widgets/user_widgets.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}
TextEditingController oldPasswordController = TextEditingController();
TextEditingController newPasswordController = TextEditingController();
TextEditingController confirmNewPasswordController = TextEditingController();
bool isEdit = false;
class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: UserWidgets.mainButton("Save", (oldPasswordController.text.isNotEmpty && newPasswordController.text.isNotEmpty
            && confirmNewPasswordController.text.isNotEmpty)?AppColors.mainColor: AppColors.whiteGrey,
            16, (oldPasswordController.text.isNotEmpty && newPasswordController.text.isNotEmpty
                && confirmNewPasswordController.text.isNotEmpty)?Colors.white:AppColors.black6,
            50, () {
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
                  Text("Change Password",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                  Divider(color: AppColors.white1,thickness: 2,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 40,),
                        UserWidgets.textFieldLabel("Enter Old Password"),
                        PasswordTextFieldWidget(controller: oldPasswordController,),
                         const SizedBox(height: 15,),
                         UserWidgets.textFieldLabel("Enter New Password"),
                        PasswordTextFieldWidget(controller: newPasswordController,),
                         const SizedBox(height: 15,),
                         UserWidgets.textFieldLabel("Confirm New Password"),
                        PasswordTextFieldWidget(controller: confirmNewPasswordController,),
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
