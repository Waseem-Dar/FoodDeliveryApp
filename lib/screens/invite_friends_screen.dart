import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../widgets/user_widgets.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({super.key});

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 53,),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: UserWidgets.backButton(() {
                Navigator.pop(context);
              },),
            ),
            const SizedBox(height: 6,),
            Text("Favourites",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
            Divider(color: AppColors.white1,thickness: 2,indent: 25,endIndent: 25,),
            const SizedBox(height:20),
            Container(
              height: 166,
                width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(data)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

