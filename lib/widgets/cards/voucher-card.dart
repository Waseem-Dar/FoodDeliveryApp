import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';

class VoucherCard extends StatelessWidget {
  final String date;
  final int percent;
  final int orderPrice;
  final VoidCallback claim;
  final Color bgColor;
  const VoucherCard({super.key, required this.date, required this.percent, required this.orderPrice, required this.claim, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 145,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
              width:double.infinity,
              padding: const EdgeInsets.only(top: 9,left: 8),
              child: Text("Exp: $date",style: GoogleFonts.poppins(
                fontSize:10,fontWeight:FontWeight.w400,color:Colors.white,),textAlign: TextAlign.left,)),
          SizedBox(
              width: 90,height: 80,
              child: Stack(
                children: [
                  Center(
                    child: Text("$percent%",style: GoogleFonts.poppins(
                      fontSize:48,fontWeight:FontWeight.w500,color:Colors.white.withOpacity(0.19),),),
                  ),
                  Center(
                    child: Text("$percent%",style: GoogleFonts.poppins(fontSize:24,fontWeight:FontWeight.w500,color:Colors.white,),),
                  ),
                  Positioned(
                    bottom: 21,
                    right: 7,
                    child: Text("OFF",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.white,),),
                  ),
                ],
              )
          ),
          Text("Get on next $orderPrice rs order",style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w300,color:Colors.white,),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Container(
                  height: 16,
                  width: 8,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8),bottomRight: Radius.circular(8))
                  ),
                ),
                Expanded(child: Image.asset("assets/images/cut-line.png",color: Colors.black.withOpacity(0.4),),),
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
          SizedBox(
            height: 19,
            child: TextButton(
                onPressed: claim,
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    minimumSize: const Size(81, 19),

                    padding: EdgeInsets.zero,
                    elevation: 8,
                    shadowColor: Colors.black.withOpacity(0.25)
                ),
                child: Text("Claim",style: GoogleFonts.poppins(fontSize:9,fontWeight:FontWeight.w500,color:AppColors.mainColor,))),
          )


        ],
      ),
    );
  }
}
