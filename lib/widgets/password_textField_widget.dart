import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  // final String icon;
  const PasswordTextFieldWidget({super.key, required this.controller,});

  @override
  State<PasswordTextFieldWidget> createState() => _PasswordTextFieldWidgetState();
}

bool isFill = false;

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {

  @override
  void initState() {
    super.initState();
    isFill = widget.controller.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: widget.controller,
      obscureText: true,
      obscuringCharacter: "●",
      style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color:AppColors.mainColor ),
      onChanged: (value) {
        setState(() {
          isFill = value.isNotEmpty;
        });
      },
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.only(right: 5),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(width: 1, color: AppColors.mainColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(width: 1, color: isFill ? AppColors.mainColor : AppColors.black3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(width: 1, color: AppColors.red),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(23),
          borderSide: BorderSide(width: 1, color: AppColors.red),
        ),
        errorStyle: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:AppColors.red),
        errorText:"Password is incorrect OR Passwords doesn’t match",
        prefixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(22, 14, 14, 14),
          child: ImageIcon(const AssetImage("assets/images/lock-icon.png"), size: 18, color: isFill ? AppColors.mainColor : AppColors.black3),
        ),
      ),
    );
  }
}
