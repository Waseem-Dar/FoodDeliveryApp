import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';

class PasswordTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String icon;
  const PasswordTextFieldWidget({super.key, required this.controller, required this.icon});

  @override
  State<PasswordTextFieldWidget> createState() => _PasswordTextFieldWidgetState();
}

bool isFill = false;

class _PasswordTextFieldWidgetState extends State<PasswordTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if(value!.isNotEmpty){
            setState(() {
              isFill = true;
            });
          }else {
            setState(() {
              isFill = false;
            });
          }
        },
        onChanged: (value) {

        },
        style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w400,color:AppColors.mainColor),
        obscureText: true,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(right: 5),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(width: 1,color: AppColors.mainColor)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(width: 1,color:isFill?AppColors.mainColor:AppColors.black3)
            ),
            prefixIcon:Padding(
              padding: const EdgeInsets.fromLTRB(22,14,14,14),
              child: ImageIcon( AssetImage(widget.icon),size: 18,color:isFill?AppColors.mainColor:AppColors.black3,),
            )
        ),
      ),
    );
  }
}
