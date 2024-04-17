import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../config/app_list.dart';
import '../../main.dart';
import '../../widgets/user_widgets.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: InkWell(
          borderRadius: BorderRadius.circular(23),
          onTap: () {
            Navigator.pop(context);},
          child: Container(
            width: 285,
            height: 46,
            decoration: BoxDecoration(
              color:AppColors.mainColor,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Center(
              child: Text("Explore & order now ",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                  color:Colors.white),),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 53,),
                  UserWidgets.backButton(() {
                    Navigator.pop(context);
                  },),
                  const SizedBox(height: 6,),
                  Text("Your Addresses",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                  Divider(color: AppColors.white1,thickness: 2,),
                ],
              ),
            ),
            AppList.addressesList.isEmpty?SizedBox(
                height: mq.height * .7,
                child:Center(child: Text("No Addresses found",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),))
            ):ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
              return Container();
            },),
          ],
        ),
      ),
    );
  }
}
