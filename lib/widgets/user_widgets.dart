import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../main.dart';

class UserWidgets{


  static Widget textFieldLabel(String text){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 18,bottom: 3),
      child: Text(text,style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:14,color:Colors.black,),),
    );
  }

  static Widget homeSearchTextField( TextEditingController controller,String hintText){
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
          hintText: hintText,
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
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w400, color:isPassword?AppColors.black6:AppColors.mainColor ),
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
                suffixIcon: IconButton(onPressed: onTap, icon: ImageIcon(const AssetImage("assets/images/edit-icon.png"), size: 21, color: AppColors.mainColor))
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget inviteTextField(TextEditingController controller,VoidCallback onTap,double padding) {
    return Padding(
      padding: const EdgeInsets.fromLTRB( 40,17,42,25 ),
      child: SizedBox(
        height: 46,
        child: TextFormField(
          readOnly: true,
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.center,
          controller: controller,
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w400, color:AppColors.mainColor ),
          decoration: InputDecoration(
              contentPadding:  EdgeInsets.only(left:padding ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(width: 1, color: AppColors.mainColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(width: 1, color: AppColors.mainColor),
              ),
              suffixIcon: IconButton(onPressed: onTap, icon: ImageIcon(const AssetImage("assets/images/copy-icon.png"), size: 21, color: AppColors.mainColor))
          ),
        ),
      ),
    );
  }


  static Widget profileTextField1(TextEditingController controller,String label,VoidCallback onChange) {
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


  static Widget voucherTextField(TextEditingController controller,VoidCallback onChange, bool isFill){
    return Expanded(
        child: SizedBox(
          height:40,
          child: TextFormField(
            controller: controller,
            style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color:AppColors.mainColor ),
            onChanged: (value) {
              onChange();
            },
            decoration: InputDecoration(
              hintText: "Enter Voucher Code",
              hintStyle: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color:AppColors.black3 ),
              contentPadding: const EdgeInsets.only(right: 5),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(width: 1, color: AppColors.mainColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(23),
                borderSide: BorderSide(width: 1, color: isFill ? AppColors.mainColor : Colors.black.withOpacity(0.25)),
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(7),
                child: ImageIcon(const AssetImage('assets/images/offer-icon.png'), size: 18, color: isFill ? AppColors.mainColor : AppColors.black3),
              ),
            ),
          ),
        ));
  }

  static Widget toggleButton(bool value,String icon,String text1,String text2,VoidCallback onTap){
    return InkWell(
      onTap:onTap,
      child: Container(
        width: mq.width/2-36,
        height: 66,
        decoration: BoxDecoration(
            color:value?AppColors.mainColor: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(
                color: Colors.black.withOpacity(0.1),offset: const Offset(0, 4),blurRadius:11.199999809265137

            )]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageIcon( AssetImage(icon),size: 29,color: value?Colors.white:AppColors.mainColor ,),
            Text(text1,style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w500,color:value?Colors.white:Colors.black)),
            Text(text2,style: GoogleFonts.poppins(fontSize:8,fontWeight:FontWeight.w400,color:value?Colors.white:AppColors.black6)),
          ],
        ),
      ),
    );
  }

  static Widget voucherBanner(String image,int percentage){
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 118,
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:  DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 16,
                  width: 8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8))
                  ),
                ),
                Container(
                  height: 16,
                  width: 8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8))
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 44,
          width: 44,
          margin: const EdgeInsets.only(left: 11,top:6 ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12,),
                child: Text("Upto",style: GoogleFonts.poppins(fontSize:6,fontWeight:FontWeight.w400,color:AppColors.mainColor)),
              ),
              Text("$percentage%",style: GoogleFonts.poppins(fontSize:15,fontWeight:FontWeight.w600,color:AppColors.mainColor,height:1,)),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text("Off",style: GoogleFonts.poppins(fontSize:6,fontWeight:FontWeight.w400,color:AppColors.mainColor)),
              ),
            ],
          ),
        ),
      ],
    );
  }
  static Widget aboutIconButton(String icon,VoidCallback onTap){
    return  InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: ImageIcon( AssetImage(icon),color: AppColors.mainColor,size: 24,),
        ));
  }


  static Widget heading1(String text){
    return SizedBox(
        width: double.infinity,
        child: Text(text,style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w600,color:AppColors.mainColor),textAlign: TextAlign.left,),);
  }

  static Widget detailsText(String text,bool about){
    return Padding(
      padding: about? const EdgeInsets.symmetric(vertical: 8):const EdgeInsets.only(bottom: 10),
      child: Text(text,style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color:AppColors.black6),textAlign: TextAlign.justify,),
    );
  }
  static Widget heading2(String text){
    return SizedBox(
      width: double.infinity,
      child: Text(text,style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:AppColors.mainColor),textAlign: TextAlign.left,),);
  }
  static Widget headingAndDetails(String heading,String details){
    return Column(
      children: [
        heading2(heading),
        detailsText(details, false)
      ],
    );
  }

  static Widget termsScreenOptionText(String text){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ Text("  \u2022  ",style: TextStyle(color: AppColors.mainColor),),
        Expanded(child: SizedBox(
          child: Text(text,
            style: GoogleFonts.poppins(fontSize: 12,fontWeight: FontWeight.w400,color:  AppColors.mainColor),textAlign: TextAlign.justify,),),),],);
  }

  static Widget currentLocationButton(VoidCallback onTap){
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: IconButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(46, 46),
          backgroundColor: Colors.white,
          elevation: 8,
          shadowColor: Colors.black,
        ),
        icon: ImageIcon(const AssetImage("assets/images/current-location.png"),color: AppColors.mainColor,size: 22,),),
    );
  }

  static Widget mainButton(String text,Color bGColor,double fontSize,Color fontColor,double padding,VoidCallback onTap){
    return Padding(
      padding: EdgeInsets.only(bottom: 15,left: padding,right: padding),
      child: InkWell(
        borderRadius: BorderRadius.circular(23),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 46,
          decoration: BoxDecoration(
            color:bGColor,
            borderRadius: BorderRadius.circular(23),
          ),
          child: Center(
            child: Text(text,style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:fontSize,
                color:fontColor),),
          ),
        ),
      ),
    );
  }

}