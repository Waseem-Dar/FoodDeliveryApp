import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';

class TextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String icon;
  final bool isPassword;
  const TextFieldWidget({super.key, required this.controller, required this.icon, required this.isPassword});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool isFill = false;

  @override
  void initState() {
    super.initState();
    isFill = widget.controller.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextFormField(
        controller: widget.controller,
        obscureText: widget.isPassword,
        obscuringCharacter: "●",
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color:AppColors.mainColor ),
        onChanged: (value) {
          setState(() {
            isFill = value.isNotEmpty;
          });
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(right: 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: BorderSide(width: 1, color: AppColors.mainColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: BorderSide(width: 1, color: isFill ? AppColors.mainColor : AppColors.black3),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(22, 14, 14, 14),
            child: ImageIcon(AssetImage(widget.icon), size: 18, color: isFill ? AppColors.mainColor : AppColors.black3),
          ),
        ),
      ),
    );
  }
}
