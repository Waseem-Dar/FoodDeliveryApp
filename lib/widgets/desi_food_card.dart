import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';

class DesiFoodCard extends StatelessWidget {
  final String name;
  final String image;
  final VoidCallback onTap;
  const DesiFoodCard({super.key, required this.name, required this.image, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.5),
      child: Container(
        width: 106,
        height: 117,
        decoration: BoxDecoration(
          color: AppColors.whiteGrey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
                width:106,
                height:86,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10) )
                ),
                child: Image.asset(image)),
            Flexible(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(name,style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:Colors.black),),
                    IconButton(
                        padding: EdgeInsets.zero,
                        style: ElevatedButton.styleFrom(
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          backgroundColor: AppColors.mainColor,
                          minimumSize: const Size(15, 15),
                          maximumSize: const Size(15, 15),
                        ),
                        onPressed: onTap, icon: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 10,)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );;
  }
}
