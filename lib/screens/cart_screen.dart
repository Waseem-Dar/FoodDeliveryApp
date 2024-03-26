import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/config/app_list.dart';
import 'package:food_app/widgets/cards/cart_similar_item_Widget.dart';
import 'package:food_app/widgets/cards/cart_widget.dart';
import 'package:food_app/widgets/text_field.dart';
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
bool isFill = false;
TextEditingController voucherController = TextEditingController();
class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.only(bottom: 15),
        //   child: InkWell(
        //     borderRadius: BorderRadius.circular(23),
        //     onTap: () {
        //       Navigator.pop(context);
        //
        //     },
        //     child: Container(
        //       width: 285,
        //       height: 46,
        //       decoration: BoxDecoration(
        //         color:AppColors.mainColor,
        //         borderRadius: BorderRadius.circular(23),
        //       ),
        //       child: Center(
        //         child: Text("Explore",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
        //             color:Colors.white),),
        //       ),
        //     ),
        //   ),
        // ),
        body: SingleChildScrollView(
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
                    Text("You have added 2 items to the cart!",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:14,
                        color:Colors.black)),
                    const SizedBox(height:20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
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
                          const SizedBox(width: 20,),
                          Text("Select All",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:11, color:Colors.black)),
                        ],
                      ),
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.only(left: 25,right: 30),
                      itemCount: 5,
                      shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: CartWidget()
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
                        return  Padding(  //padding nothing copied
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
      ),
    );
  }
}
