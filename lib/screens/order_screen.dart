import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/app_list.dart';
import 'package:food_app/widgets/cards/past_order_card.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../main.dart';
import '../widgets/user_widgets.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
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
            const SizedBox(
              height: 53,),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: UserWidgets.backButton(() {
                Navigator.pop(context);
              },),
            ),
            const SizedBox(height: 6,),
            Text("My Orders",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
            Divider(color: AppColors.white1,thickness: 2,indent: 25,endIndent: 25,),
            AppList.pastOrderList.isEmpty?SizedBox(
                height: mq.height * .7,
                child:Center(child: Text("No past orders",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),))
            )
                :Column(
              children: [
                const SizedBox(height:30),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 38),
                    child: Text("Your Past Orders",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 38),
                    child: Text("Select items to order again",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color:AppColors.black6),textAlign: TextAlign.left,)),
                  ListView.builder(
                    itemCount: AppList.pastOrderList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(right: 25,left: 10,top: 15,bottom: 65),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                    String name =AppList.pastOrderList[index]["name"];
                    String image = AppList.pastOrderList[index]["image"];
                    String details = AppList.pastOrderList[index]["details"];
                    String address = AppList.pastOrderList[index]["address"];
                    String date = AppList.pastOrderList[index]["date"];
                    int price = AppList.pastOrderList[index]["price"];
                    bool isSelected = AppList.pastOrderList[index]["isSelected"];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                        child: PastOrderCard(name: name, image: image, details: details, address: address, date: date, price: price, isSelected: isSelected, index: index, onChanged: () {
                          setState(() {

                          });
                        },)
                   );
                 },)









              ],
            )

          ],
        ),
      ),
    );
  }
}
