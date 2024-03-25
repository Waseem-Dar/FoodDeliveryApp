import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';

class FavRestaurantsCard extends StatelessWidget {
  final String image;
  final String name;
  final String address;
  final String details;
  final double rating;
  final VoidCallback onTap;
  final VoidCallback onTapFav;

  const FavRestaurantsCard({super.key, required this.image, required this.name, required this.address, required this.details, required this.rating, required this.onTap, required this.onTapFav});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(22, 14, 22, 9),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1),blurRadius:  11.199999809265137,offset: const Offset(0, 0))]
        ),
        child: Column(
          children: [
            Container(
              height: 111,
              width: double.infinity,
              padding: const EdgeInsets.only(top: 5,left: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(image),fit:BoxFit.cover)
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: onTapFav,
                  child: Container(
                    height: 20,
                    width: 20,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.11), offset: const Offset(-2, 2), blurRadius:6.900000095367432,
                          )
                        ]
                    ),
                    child: ImageIcon(const AssetImage("assets/images/fav-icon.png"),size: 8,color: AppColors.mainColor,),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 9,top: 9),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(name,style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black,),),
                      Text(address,style: GoogleFonts.poppins(fontSize:8,fontWeight:FontWeight.w500,color:Colors.black,)),
                    ],
                  ),
                  const SizedBox(height: 3,),
                  Text(details,style: GoogleFonts.poppins(fontSize:9,fontWeight:FontWeight.w400,color:AppColors.black6,),textAlign: TextAlign.justify,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
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
