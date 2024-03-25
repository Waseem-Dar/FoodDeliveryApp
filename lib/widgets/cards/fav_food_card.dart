import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';

class FavoriteFoodCard extends StatelessWidget {
  final String name;
  final String details;
  final String image;
  final int price;
  final double rating;
  final VoidCallback onTap;
  final VoidCallback onAdd;
  final VoidCallback onTapFav;

  const FavoriteFoodCard({super.key, required this.name, required this.details, required this.image, required this.price, required this.rating, required this.onTap, required this.onAdd, required this.onTapFav});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1),offset: const Offset(0, 4),blurRadius:  11.199999809265137)
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // color: Colors.red,
              height: 90,
              width: double.infinity,

              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      child: Image.asset(image,height: 70,),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      onTap: onTapFav,
                      child: Container(
                        height: 26,
                        width: 26,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.11), offset: const Offset(-2, 2), blurRadius:6.900000095367432,)
                            ]
                        ),
                        child: ImageIcon(const AssetImage("assets/images/fav-icon.png"),size: 8,color: AppColors.mainColor,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(name,style: GoogleFonts.poppins(fontSize:11,fontWeight:FontWeight.w500,color:Colors.black),maxLines: 1,overflow: TextOverflow.ellipsis,),
            Text(details,style: GoogleFonts.poppins(fontSize:8,fontWeight:FontWeight.w400,color:AppColors.black6),maxLines: 2,overflow: TextOverflow.ellipsis,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      RatingBar.builder(
                        itemSize: 8,
                        initialRating: rating,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:  EdgeInsets.zero,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star, color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Text("$rating Rating",style: GoogleFonts.poppins(fontSize:8,fontWeight:FontWeight.w400,color:AppColors.black6,),)
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("$price",style: GoogleFonts.poppins(fontSize:8,fontWeight:FontWeight.w400,color:Colors.black,),),
                      InkWell(
                        onTap: onAdd,
                        child: SizedBox(
                            height: 15,
                            child: Center(child: Text("ADD TO CART",style: GoogleFonts.poppins(fontSize:8,fontWeight:FontWeight.w600,color:AppColors.mainColor,),))),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );;
  }
}
