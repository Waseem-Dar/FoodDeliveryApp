
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';

class DeliciousFoodCard extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;
  const DeliciousFoodCard({super.key, required this.name, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3),
      width:81,
      height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          border: Border.all(color: AppColors.white1,width: 1)
      ),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: 63,
            height: 94,
            decoration: BoxDecoration(
                color: AppColors.whiteGrey,
                borderRadius: BorderRadius.circular(45)
            ),
            child: Column(
              children: [
                Container(
                  height:50,
                  padding: const EdgeInsets.symmetric(horizontal: 8,),
                  child: Image.asset(image),
                ),
                Text(name,style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:Colors.black.withOpacity(.25),),)
              ],
            ),
          ),
        ),
      ),
    );;
  }
}
