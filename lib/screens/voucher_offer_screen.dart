import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/app_list.dart';
import 'package:food_app/widgets/cards/voucher-card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../widgets/user_widgets.dart';

class VouchersScreen extends StatefulWidget {
  const VouchersScreen({super.key});

  @override
  State<VouchersScreen> createState() => _VouchersScreenState();
}

class _VouchersScreenState extends State<VouchersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:Column(
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
                  Text("Vouchers & Offers",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                  Divider(color: AppColors.white1,thickness: 2,),
                  const SizedBox(height:30),
                  SizedBox(
                      width: double.infinity,
                      child: Text("Claim Vouchers",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                  const SizedBox(height: 5,)
                ],
              ),
            ),
            SizedBox(
              height: 181,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: AppList.voucherList.length,
                itemBuilder: (context, index) {
                  String date = AppList.voucherList[index]["date"];
                  int percent = AppList.voucherList[index]["percent"];
                  int orderPrice = AppList.voucherList[index]["orderPrice"];
                  Color bgColor = AppList.voucherList[index]["bgColor"];
                return Padding(
                  padding:  const EdgeInsets.symmetric(horizontal: 5),
                  child: VoucherCard(date: date, percent: percent, orderPrice: orderPrice, claim: (){}, bgColor: bgColor)
                );
              },),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  Text("Indulge your taste buds with our exclusive offers!",style: GoogleFonts.poppins(
                      fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),) ,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 2),
                    child: Text("Terms and Conditions apply. Offer valid for a limited time only.",style: GoogleFonts.poppins(
                        fontSize:12,fontWeight:FontWeight.w400,color:AppColors.black6),),
                  ) ,
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: AppList.voucherBannerList.length,
                    itemBuilder: (context, index) {
                      String image = AppList.voucherBannerList[index]["image"];
                      int percentage = AppList.voucherBannerList[index]["percentage"];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 9,vertical: 10),
                      child: UserWidgets.voucherBanner(image,percentage)
                    );
                  },)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
