import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/config/app_list.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';

class PopularCard extends StatefulWidget {
  final String image;
  final String name;
  final String info;
  final double rating;
  final int index;
  const PopularCard({super.key, required this.image, required this.name, required this.info, required this.rating, required this.index});

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(30),
      onTap: () {},
      child: Container(
        width: 212,
        height: 78,
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 3),
        margin: const EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
          color: AppColors.whiteGrey,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.cover)
              ) ,
            ),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(widget.name,style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:Colors.black),),
                SizedBox(
                    width:128,
                    height: 25,
                    child: Text(widget.info,style: GoogleFonts.poppins(fontSize:9,fontWeight:FontWeight.w400,color:AppColors.black6),overflow: TextOverflow.ellipsis,maxLines: 2,)),
                RatingBar.builder(
                  itemSize: 8,
                  initialRating: widget.rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.only(right: 1.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    AppList.rateList[widget.index]["rating"] = rating;
                  },
                ),
                Row(
                  children: [
                    Text("${widget.rating} Rating",style: GoogleFonts.poppins(fontSize:8,fontWeight:FontWeight.w400,color:AppColors.black6),),
                    const SizedBox(width: 40,),
                    Text("Popular",style: GoogleFonts.poppins(fontSize:8,fontWeight:FontWeight.w500,color:AppColors.black6),),
                    Container(
                        height: 15,width: 13,
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Image.asset("assets/images/fire-1.png"))
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );;
  }
}
