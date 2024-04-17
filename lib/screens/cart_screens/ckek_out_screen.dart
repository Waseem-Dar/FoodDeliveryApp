import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../main.dart';
import '../../widgets/address_textFeild.dart';
import '../../widgets/user_widgets.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}
bool cash = false;
bool online = false;
TextEditingController aDIController = TextEditingController();
class _CheckOutScreenState extends State<CheckOutScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      Text("Check Out",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                      Divider(color: AppColors.white1,thickness: 2,),
                      const SizedBox(height:20),
                      SizedBox(
                        width: double.infinity,
                          child: Text("Delivery Details:",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                      const SizedBox(height: 5,)
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 220,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 220,
                        color: Colors.teal.withOpacity(0.7),
                        child: const Center(
                          child: Text("MAP",style: TextStyle(color: Colors.white,fontSize: 20),),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 96,
                          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 7),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                          color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1),offset: const Offset(0, 4),blurRadius:11.199999809265137)],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 14,
                                    width: 14,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: AppColors.mainColor,width: 4,)
                                    ),
                                  ),
                                  const SizedBox(width: 10,),
                                  Text("LoremIpsum",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:AppColors.mainColor),),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6,top:6 ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("St 126, Building 01, Bahria Town ph 4",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color:AppColors.black6),),
                                    Text("Islambad, Pakistan",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color:AppColors.black6),),
                                    Text("+01 283 281019",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:AppColors.black6),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 15),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        width: double.infinity,
                        child: TextButton(
                            onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: CupertinoColors.systemGrey3),
                          child:  Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("Add new Address",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:AppColors.mainColor)),
                              const SizedBox(width: 6,),
                               ImageIcon(const AssetImage("assets/images/circle-add-icon.png"),size: 15,color: AppColors.mainColor,),
                            ],
                          ),
                        ),
                      ),
                      Divider(color: AppColors.white1,thickness: 2,height: 0,),
                      Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Text("Delivery Time:",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                      Row(
                        children: [
                          ImageIcon(const AssetImage("assets/images/car-icon.png"),size: 40,color: AppColors.mainColor,),
                          const SizedBox(width: 15,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Estimated Time: 20-30 mins",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color:Colors.black)),
                              const SizedBox(height: 3,),
                              Text("Your food will soon arrive at your door step",style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:AppColors.black6)),
                            ],
                          )
                        ],
                      ),
                      Divider(color: AppColors.white1,thickness: 2,),
                      SizedBox(
                          width: double.infinity,
                          child: Text("Payment Methods:",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB( 4,15, 14, 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            UserWidgets.toggleButton(cash,"assets/images/cash-on-icon.png" ,"Cash on delivery","Pay when you receive order",() {
                              setState(() {
                                cash = !cash;
                                if (cash) {
                                  online = false;
                                }
                              });
                            },),
                            const SizedBox(width: 10),
                            UserWidgets.toggleButton(online,"assets/images/online-pay-icon.png" ,"Online Payment","Select Options",() {
                                  setState(() {
                                    online = !online;
                                  if (online) {
                                    cash = false;
                                  }
                                  });
                            },)
                          ],
                        ),
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Text("Any Delivery Instructions",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5,10,15,10),
                        child: AddressTextFieldWidget(controller: aDIController,max: true,),
                      ),
                      SizedBox(
                          width: double.infinity,
                          child: Text("Order Summary:",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,20,10,5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Items",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:AppColors.black6),),
                                Text("( 2 )",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:AppColors.mainColor),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Subtotal",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:AppColors.black6),),
                                Text("Rs. 570",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:AppColors.mainColor),)
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Delivery Charges",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:AppColors.black6),),
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
                          ],
                        ),
                      ),
                      Divider(color: AppColors.white1,thickness: 1,),
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Charges:",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),),
                            Text("Rs. 570",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w600,color:AppColors.mainColor),)
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                const SizedBox(
                  height: 115,
                )

              ],
            ),
          ),
          Align(
            alignment:Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 104,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.09),offset: const Offset(0, -1),blurRadius:16.200000762939453
                )]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40,right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Charges:",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:AppColors.black6),),
                        Text("Rs. 570",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w600,color:AppColors.mainColor),)
                      ],
                    ),
                  ),InkWell(
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
                        child: Text("Place Order",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                          color:Colors.white)),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
