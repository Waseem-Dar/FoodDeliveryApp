import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';

class AddressTextFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final bool max;
  const AddressTextFieldWidget({super.key, required this.controller, required this.max,});

  @override
  State<AddressTextFieldWidget> createState() => _AddressTextFieldWidgetState();
}

class _AddressTextFieldWidgetState extends State<AddressTextFieldWidget> {
  bool isFill = false;

  @override
  void initState() {
    super.initState();
    isFill = widget.controller.text.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.max?110:46,
      child: TextFormField(
        controller: widget.controller,
         minLines: widget.max?6:1,
         maxLines: widget.max?6:1,

         style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color:AppColors.mainColor ),
        onChanged: (value) {
          setState(() {
            isFill = value.isNotEmpty;
          });
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: BorderSide(width: 1, color: AppColors.mainColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
            borderSide: BorderSide(width: 1, color: isFill ? AppColors.mainColor : AppColors.black3),
          ),
        ),
      ),
    );
  }
}
