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

  static Widget homeSearchTextField( TextEditingController controller){
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

  static Widget tileWidget(String icon,String title,VoidCallback onTap,double size){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: ListTile(
          onTap: onTap,
          dense: true,
          horizontalTitleGap: 12,
          contentPadding: const EdgeInsets.symmetric(horizontal: 23),
          splashColor: AppColors.mainColor.withOpacity(0.05),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          leading: ImageIcon( AssetImage(icon),size: size,color: AppColors.mainColor,),
          title: Text(title,style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:AppColors.mainColor),
          )
      ),
    );
  }

  static Widget backButton(VoidCallback onTap,){
    return Row(
      children: [
        const SizedBox(width: 13,),
        InkWell(
          onTap: onTap,
          child: Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.11),blurRadius:6.900000095367432,offset: const Offset(-2, 2)
                )]
            ),child: Center(child: ImageIcon(const AssetImage("assets/images/left-arrow.png"),color: AppColors.mainColor,size: 10,)),
          ),
        ),
      ],
    );
  }


  static Widget profileTextField(TextEditingController controller,String prefixIcon,String label,bool isPassword,VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          textFieldLabel(label),
          SizedBox(
            height: 46,
            child: TextFormField(
              readOnly: true,
              obscuringCharacter: "●",
              controller: controller,
              obscureText: isPassword,
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color:AppColors.mainColor ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(right: 5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                  borderSide: BorderSide(width: 1, color: AppColors.mainColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                  borderSide: BorderSide(width: 1, color: AppColors.mainColor),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 14, 14, 14),
                  child: ImageIcon(AssetImage(prefixIcon), size: 18, color: AppColors.mainColor),
                ),
                suffixIcon: IconButton(onPressed: onTap, icon: ImageIcon(const AssetImage("assets/images/edit-profile-icon.png"), size: 21, color: AppColors.mainColor))
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget profileTextField1(TextEditingController controller,String label,VoidCallback onTap,VoidCallback onChange) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          textFieldLabel(label),
          SizedBox(
            height: 46,
            child: TextFormField(
              controller: controller,
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color:AppColors.mainColor ),
              onChanged: (value) {
                onChange();
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 24),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                    borderSide: BorderSide(width: 1, color: AppColors.mainColor),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                    borderSide: BorderSide(width: 1, color: AppColors.mainColor),
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }


}