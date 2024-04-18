import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../main.dart';
import '../widgets/user_widgets.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
              child: Text("Explore & order now",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                  color:Colors.white),),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              const SizedBox(
                height: 53,),
              UserWidgets.backButton(() {
                Navigator.pop(context);
              },),
              const SizedBox(height: 6,),
              Text("Notifications",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
              Divider(color: AppColors.white1,thickness: 2,),
              SizedBox(
                  height: mq.height * .7,
                  child:Center(child: Text("No past orders",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),))
              )
            ],
          ),
        ),
      ),
    );
  }
}
