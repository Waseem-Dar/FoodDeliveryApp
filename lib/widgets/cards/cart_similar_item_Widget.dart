import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../config/app_colors.dart';

class CartSimilarItemCard extends StatelessWidget {
  final String image;
  final String details;
  final int price;
  final int oldPrice;
  final double rating;
  const CartSimilarItemCard({super.key, required this.image, required this.details, required this.price, required this.oldPrice, required this.rating});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 192,
        width: 140,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1),offset: const Offset(0,2),blurRadius:  6.800000190734863)
            ]
        ),
        child: Column(
          children: [
            Container(
              height: 130,
              decoration:  BoxDecoration(
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20)),
                  image: DecorationImage(image: AssetImage(image),fit: BoxFit.fill)
              ),
              // child: Image.asset("assets/images/burger-4.png"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 3),
              child: Text(details,style: GoogleFonts.poppins(
                  fontWeight:FontWeight.w400,fontSize:9, color:AppColors.black6),textAlign: TextAlign.center,),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rs.$price",style: GoogleFonts.poppins(fontSize:11,fontWeight:FontWeight.w500,color:AppColors.mainColor,)),
                  const SizedBox(width: 5,),
                  Text("Rs. $oldPrice",style: GoogleFonts.poppins(fontSize:8,fontWeight:FontWeight.w400,color:AppColors.black6,decoration:TextDecoration.lineThrough,),),
                  const Spacer(),
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
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
