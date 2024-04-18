import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../config/app_colors.dart';

class AddressesCard extends StatelessWidget {
  final LatLng location;
  final String title;
  final String subtitle;

  const AddressesCard({super.key, required this.location, required this.title, required this.subtitle,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1),offset: const Offset(0, 0),blurRadius: 11.2,spreadRadius: 1)]
        ),
        child:  Center(
          child: ListTile(
            dense: true,
            contentPadding: const EdgeInsets.only(left: 20,right: 10,),
            leading:  ImageIcon(const AssetImage("assets/images/location-icon.png"),size: 26,color: AppColors.mainColor,),
            title: Text(title,style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w600,color:AppColors.mainColor),),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(subtitle,style: GoogleFonts.poppins(fontSize:11,fontWeight:FontWeight.w400,color:AppColors.mainColor),),
            ),
            trailing:IconButton(onPressed: (){},
                icon: ImageIcon(const AssetImage("assets/images/edit-icon.png"),size: 21,color: AppColors.mainColor,)),
          ),
        ),
      ),
    );;
  }
}
