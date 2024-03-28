import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/config/app_list.dart';
import 'package:food_app/screens/cart_screens/ckek_out_screen.dart';
import 'package:food_app/widgets/cards/cart_similar_item_Widget.dart';
import 'package:food_app/widgets/cards/cart_widget.dart';
import 'package:food_app/widgets/text_field.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../main.dart';
import '../../widgets/user_widgets.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}
bool selectAll = false;
bool isFill = false;
int subTotal = 0;
int totalCharges = 0;
int selectTotal = 0;
TextEditingController voucherController = TextEditingController();



class _CartScreenState extends State<CartScreen> {

    void getTotal(){
      subTotal = 0;
      totalCharges = 0;
      selectTotal = 0;
      for (var item in AppList.myCartList) {
        if (item["isSelected"]) {
          selectTotal += 1;
          subTotal += (item["price"] as int) * (item["count"] as int);
          totalCharges = subTotal;
        }
      }
    }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            SingleChildScrollView(
              child:Center(
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
                    Text("My Cart",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                    Divider(color: AppColors.white1,thickness: 2,indent: 25,endIndent:25,),
                    AppList.myCartList.isEmpty?SizedBox(
                      height: mq.height * .7,
                      child: Center(
                        child: Text("Your Cart is empty!",style: GoogleFonts.poppins(
                            fontSize:14,fontWeight:FontWeight.w400,color:AppColors.black6),),
                      ),
                    ):Column(
                      children: [
                        const SizedBox(height:20),
                        Text("You have added ${AppList.myCartList.length} items to the cart!",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:14,
                            color:Colors.black)),
                        const SizedBox(height:10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Checkbox(
                                side: BorderSide(color: Colors.black.withOpacity(0.25),width: 1),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                overlayColor:MaterialStatePropertyAll(AppColors.whiteGrey),
                                activeColor: AppColors.mainColor,
                                value: selectAll,
                                onChanged: (value) {
                                  setState(() {
                                    selectAll = value!;
                                    for (int i = 0; i < AppList.myCartList.length; i++) {
                                      AppList.myCartList[i]["isSelected"] = value;
                                    }
                                    getTotal();
                                  });
                              },),
                              const SizedBox(width: 10,),
                              Text("Select All",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:11, color:Colors.black)),
                            ],
                          ),
                        ),
                        ListView.builder(
                          padding: const EdgeInsets.only(left: 10,right: 30),
                          itemCount: AppList.myCartList.length,
                          shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            String name =AppList.myCartList[index]["name"];
                            String image = AppList.myCartList[index]["image"];
                            String details = AppList.myCartList[index]["details"];
                            int price = AppList.myCartList[index]["price"];
                            bool isSelected = AppList.myCartList[index]["isSelected"];
                            int count = AppList.myCartList[index]["count"];
                          return  Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: CartWidget(name: name, image: image, details: details, price: price, count: count, isSelected: isSelected, index: index,onChanged: () {
                              setState(() {
                                // log(AppList.myCartList[1]["isSelected"].toString() );
                                // AppList.myCartList[index]["isSelected"] = value;
                               getTotal();
                                // if (!AppList.myCartList.any((item) => item["isSelected"])) {
                                //   subTotal = 0;
                                // }
                                // AppList.myCartList[index]["isSelected"] = value;
                              });
                            },),
                          );
                        },),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 30),
                          width: double.infinity,
                          child: TextButton(
                            style: ElevatedButton.styleFrom(
                               foregroundColor: CupertinoColors.systemGrey3),
                              onPressed: (){}, child: Text("Add more items",style: GoogleFonts.poppins(
                              fontWeight:FontWeight.w400,fontSize:13, color:AppColors.mainColor))),
                        ),
                        Divider(color: AppColors.white1,thickness: 2,indent: 20,endIndent: 30,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30,10,20,30),
                          child: Row(
                            children: [
                              UserWidgets.voucherTextField(voucherController, () {
                                setState(() {
                                 if(voucherController.text.isEmpty){
                                   isFill = false;
                                 } else{
                                   isFill = true;
                                 }
                                });
                              }, isFill),
                              const SizedBox(width: 5,),
                              TextButton(
                                  style: ElevatedButton.styleFrom(
                                      foregroundColor: CupertinoColors.systemGrey3,
                                    backgroundColor: isFill?AppColors.mainColor:AppColors.whiteGrey,
                                    minimumSize: const Size(120, 40),
                                  ),
                                  onPressed: (){}, child: Text("Apply",style: GoogleFonts.poppins(
                                  fontWeight:FontWeight.w400,fontSize:13, color:isFill?Colors.white:AppColors.mainColor))),
                            ],
                          ),
                        ),
                        Text("Similar Items",style: GoogleFonts.poppins(
                            fontWeight:FontWeight.w500,fontSize:16, color:Colors.black)),
                        SizedBox(
                          height: 212,
                          child: ListView.builder(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            itemCount: AppList.cartSimilarItemList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              String image = AppList.cartSimilarItemList[index]["image"];
                              String details = AppList.cartSimilarItemList[index]["details"];
                              int price = AppList.cartSimilarItemList[index]["price"];
                              int oldPrice = AppList.cartSimilarItemList[index]["oldPrice"];
                              double rating = AppList.cartSimilarItemList[index]["rating"];
                            return  Padding(
                                padding: const EdgeInsets.all(5),
                              child: CartSimilarItemCard(image: image, details: details, price: price, oldPrice: oldPrice, rating: rating),
                            );
                          },),
                        )
                      ],
                    )
                  ],
                ),
              ) ,
            ),
            Visibility(
              visible: AppList.myCartList.any((item) => item["isSelected"] == true),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  height: 170,
                  padding: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                  color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.09),offset: const Offset(0, 1),
                        blurRadius: 16.200000762939453)]
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 44,left: 38),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Subtotal",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:AppColors.black6),),
                            Text("Rs. $subTotal",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:AppColors.mainColor),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB( 38,5,44, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Delivery Charges",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:AppColors.black6),),
                            Container(
                                width: 50,
                                height: 15,
                                decoration: BoxDecoration(
                                  color: AppColors.mainColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(9)
                                ),
                                child: Center(child: Text("Free",style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w500,color:AppColors.mainColor),)))
                          ],
                        ),
                      ),
                      Divider(color: AppColors.white1,thickness: 1,indent: 20,endIndent: 30,height: 0,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(38,10,44,13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Charges:",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:AppColors.black6),),
                            Text("Rs. $totalCharges",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:AppColors.mainColor),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckOutScreen(),));
                          },
                          child: Container(
                            width: 285,
                            height: 46,
                            decoration: BoxDecoration(
                              color:AppColors.mainColor,
                              borderRadius: BorderRadius.circular(23),
                            ),
                            child: Center(
                              child: Text("Check Out ( $selectTotal )",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                                  color:Colors.white),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

