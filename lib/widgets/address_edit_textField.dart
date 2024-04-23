import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';

class AddressEditTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool max;
  const AddressEditTextFieldWidget({super.key, required this.controller, required this.max,});

  @override
  State<AddressEditTextFieldWidget> createState() => _AddressEditTextFieldWidgetState();
}

class _AddressEditTextFieldWidgetState extends State<AddressEditTextFieldWidget> {
  bool isChange = false;

  // @override
  // void initState() {
  //   super.initState();
  //   isChange = widget.controller.text.isNotEmpty;
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.max?110:46,
      child: TextFormField(
        controller: widget.controller,
        minLines: widget.max?5:1,
        maxLines: widget.max?5:1,
        style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color:isChange?AppColors.mainColor:AppColors.black6 ),
        onChanged: (value) {
          setState(() {
            isChange = true;

          });
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: BorderSide(width: 1, color:isChange?AppColors.mainColor:AppColors.black3),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: BorderSide(width: 1, color: isChange ? AppColors.mainColor : AppColors.black3),
          ),
        ),
      ),
    );
  }
}
