import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../main.dart';
import '../../widgets/user_widgets.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}
bool cash = false;
bool online = false;
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
                        padding: const EdgeInsets.only(top: 15,right: 14,left: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap:(){
                                setState(() {
                                  cash = !cash;
                                });
                              },
                              child: Container(
                                width: mq.width/2-36,
                                height: 66,
                                decoration: BoxDecoration(
                                  color:cash?AppColors.mainColor: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                        color: Colors.black.withOpacity(0.1),offset: const Offset(0, 4),blurRadius:11.199999809265137

                                    )]
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const ImageIcon(AssetImage("assets/images/cash-on-icon.png"),size: 29,),
                                    Text("Cash on delivery",style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w500,color:Colors.black)),
                                    Text("Pay when you receive order",style: GoogleFonts.poppins(fontSize:8,fontWeight:FontWeight.w400,color:AppColors.black6)),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap:(){},
                              child: Container(
                                width: mq.width/2-36,
                                height: 66,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                        color: Colors.black.withOpacity(0.1),offset: const Offset(0, 4),blurRadius:11.199999809265137

                                    )]
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const ImageIcon(AssetImage("assets/images/online-pay-icon.png"),size: 29,),
                                    Text("Online Payment",style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w500,color:Colors.black)),
                                    Text("Select Options",style: GoogleFonts.poppins(fontSize:8,fontWeight:FontWeight.w400,color:AppColors.black6)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )


              ],
            ),
          ),
          Align(
            alignment:Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 104,
              color: Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
