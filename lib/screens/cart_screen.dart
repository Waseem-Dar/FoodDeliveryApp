import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/app_list.dart';
import 'package:google_fonts/google_fonts.dart';

import '../config/app_colors.dart';
import '../main.dart';
import '../widgets/user_widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}
bool selectAll = false;

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: InkWell(
          borderRadius: BorderRadius.circular(23),
          onTap: () {
            Navigator.pop(context);

          },
          child: Container(
            width: 285,
            height: 46,
            decoration: BoxDecoration(
              color:AppColors.mainColor,
              borderRadius: BorderRadius.circular(23),
            ),
            child: Center(
              child: Text("Explore",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                  color:Colors.white),),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 53,),
              UserWidgets.backButton(() {
                Navigator.pop(context);
              },),
              const SizedBox(height: 6,),
              Text("My Cart",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
              Divider(color: AppColors.white1,thickness: 2,),
              AppList.myCartList.isEmpty?SizedBox(
                height: mq.height * .7,
                child: Center(
                  child: Text("Your Cart is empty!",style: GoogleFonts.poppins(
                      fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),),
                ),
              ):Padding(
                padding: const EdgeInsets.only(left: 1,right: 4),
                child: Column(
                  children: [
                    const SizedBox(height:20),
                    Text("You have added 2 items to the cart!",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:14,
                        color:Colors.black)),
                    const SizedBox(height:20),
                    Row(
                      children: [
                        SizedBox(
                          height: 17,
                          width: 17,
                          child: Checkbox(
                            side: BorderSide(color: Colors.black.withOpacity(0.25),width: 1),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            activeColor: AppColors.mainColor,
                            value: selectAll,
                            onChanged: (value) {
                              setState(() {
                                selectAll = !selectAll;
                              });
                          },),
                        ),
                        const SizedBox(width: 20,),
                        Text("Select All",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:11, color:Colors.black)),
                      ],
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.only(bottom: 60),
                      itemCount: 15,
                      shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            SizedBox(
                              height: 17,
                              width: 17,
                              child: Checkbox(
                                side: BorderSide(color: Colors.black.withOpacity(0.25),width: 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                activeColor: AppColors.mainColor,
                                value: selectAll,
                                onChanged: (value) {
                                  setState(() {
                                    selectAll = !selectAll;
                                  });
                                },),
                            ),
                            const SizedBox(width: 13,),
                            Expanded(
                              child: Container(

                                height: 82,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [BoxShadow(
                                    color: Colors.black.withOpacity(0.1),offset: const Offset(0, 4),blurRadius: 11.199999809265137)]
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },)
                  ],
                ),
              )
            ],
          ),
        ),) ,
      ),
    );
  }
}
