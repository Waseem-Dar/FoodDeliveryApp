import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/app_colors.dart';
import '../../config/app_list.dart';

class PastOrderCard extends StatefulWidget {
  final String name;
  final String image;
  final String details;
  final String address;
  final String date;
  final int price;
  final bool isSelected;
  final int index;
  final Function() onChanged;
  const PastOrderCard({super.key, required this.name, required this.image, required this.details, required this.address, required this.date, required this.price, required this.isSelected, required this.index, required this.onChanged});

  @override
  State<PastOrderCard> createState() => _PastOrderCardState();
}

class _PastOrderCardState extends State<PastOrderCard> {
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
              AppList.pastOrderList[widget.index]["isSelected"] = value;
              widget.onChanged();
            });
          },),
        Expanded(
          child: Container(
            height: 103,
            padding: const EdgeInsets.fromLTRB(16,5,11,5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(
                    color: Colors.black.withOpacity(0.1),offset: const Offset(0, 4),blurRadius: 11.199999809265137)]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.address,style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:11, color:Colors.black)),
                Text(widget.date,style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:9, color:AppColors.black6)),
                Divider(color: AppColors.white1,endIndent: 10,indent: 10,height: 7,),
                Row(
           
                  children: [
                    Image.asset(widget.image,height: 55,width: 55,),
                    const SizedBox(width: 25,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name,style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:11, color:Colors.black)),
                          Row(
                           crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(widget.details,style: GoogleFonts.poppins(
                                    fontWeight:FontWeight.w400,fontSize:8, color:AppColors.black6),maxLines: 2,overflow: TextOverflow.ellipsis,),
                              ),
                              Text("Rs. ${widget.price}",style: GoogleFonts.poppins(fontWeight:FontWeight.w500,fontSize:11, color:AppColors.mainColor)),
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
