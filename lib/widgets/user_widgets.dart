import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';

class UserWidgets{


  static Widget textFieldLabel(String text){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 18,bottom: 3),
      child: Text(text,style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:14,color:Colors.black,),),
    );
  }

  static Widget homePageTextField( TextEditingController controller){
    return Container(
      height: 27,
      margin: const EdgeInsets.only(bottom: 15,top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: TextFormField(
        controller: controller,
        cursorHeight: 17,
        style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),
        cursorWidth: 1,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 15,),
          filled: true,
          fillColor: Colors.white,
          hintText: "Search",
          hintStyle: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:AppColors.black6),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none
          ),
          suffixIconConstraints: const BoxConstraints(),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 7),
            child: Image.asset("assets/images/search-icon.png",),
          ),
        ),
      ),
    );
  }


}