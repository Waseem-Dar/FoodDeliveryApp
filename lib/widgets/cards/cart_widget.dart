import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/app_list.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../screens/cart_screens/cart_screen.dart';

class CartWidget extends StatefulWidget {
  final String name;
  final String image;
  final String details;
  final int price;
  final int count;
  final bool isSelected;
  final Function() onChanged;
  final int index;
  const CartWidget({super.key, required this.name, required this.image, required this.details, required this.price, required this.count, required this.isSelected, required this.index, required this.onChanged});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}


class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: BorderSide(color: Colors.black.withOpacity(0.25),width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          activeColor: AppColors.mainColor,
          overlayColor:MaterialStatePropertyAll(AppColors.whiteGrey),
          value: widget.isSelected,
          onChanged: (value) {
            setState(() {
              AppList.myCartList[widget.index]["isSelected"] = value;
              widget.onChanged();
            });
          },),
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

              children: [
                Image.asset(widget.image,width: 70,height: 70,),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:11, color:Colors.black)),
                      Text(widget.details,style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w400,fontSize:8, color:AppColors.black6),maxLines: 2,overflow: TextOverflow.ellipsis,),
                      Row(
                        children: [
                          Text("Rs. ${widget.price}",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:11, color:AppColors.mainColor)),
                          const Spacer(),
                          Row(
                            children: [
                              SizedBox(
                                height: 22,
                                width: 22,
                                child: IconButton(
                                    onPressed: (){
                                      if(AppList.myCartList[widget.index]["count"]>1){
                                        AppList.myCartList[widget.index]["count"]--;
                                      }
                                      widget.onChanged();
                                    },
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
                                child: Center(child: Text("${widget.count}")),
                              ),
                              SizedBox(
                                height: 22,
                                width: 22,
                                // color:AppColors.red,
                                child: IconButton(
                                    onPressed: (){
                                      AppList.myCartList[widget.index]["count"]++;
                                      widget.onChanged();
                                    },
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
