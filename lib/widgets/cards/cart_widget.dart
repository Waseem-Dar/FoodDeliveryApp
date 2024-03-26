import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../screens/cart_screen.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
            padding: const EdgeInsets.fromLTRB(8,8,20,8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.1),offset: const Offset(0, 4),blurRadius: 11.199999809265137)]
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/burger-2.png"),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Mc Crispy Burger",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:11, color:Colors.black)),
                      Text("Ground beef, tomato sauce, cheddar cheese, chili powder.",style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w400,fontSize:8, color:AppColors.black6),maxLines: 2,overflow: TextOverflow.ellipsis,),
                      Row(
                        children: [
                          Text("Rs. 570",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:11, color:AppColors.mainColor)),
                          const Spacer(),
                          Row(
                            children: [
                              SizedBox(
                                height: 22,
                                width: 22,
                                child: IconButton(
                                    onPressed: (){},
                                    visualDensity: const VisualDensity(vertical: -1),
                                    padding: EdgeInsets.zero,
                                    icon: const Padding(
                                      padding: EdgeInsets.only(bottom: 6),
                                      child: Icon(Icons.minimize,size: 10,),
                                    )),
                              ),
                              Container(
                                height: 19,
                                width: 17,
                                color:AppColors.whiteGrey,
                                child:const Center(child: Text("1")),
                              ),
                              SizedBox(
                                height: 22,
                                width: 22,
                                // color:AppColors.red,
                                child: IconButton(
                                    onPressed: (){},

                                    padding: EdgeInsets.zero,
                                    icon: const Icon(Icons.add,size: 10,)),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
