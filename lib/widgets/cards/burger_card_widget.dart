import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../config/app_colors.dart';
import '../../config/app_list.dart';

class BurgerCard extends StatefulWidget {
  final String name;
  final String info;
  final String image;
  final int price;
  final bool favorite;
  final int index;
  const BurgerCard({super.key, required this.name, required this.info, required this.image, required this.price, required this.favorite, required this.index});

  @override
  State<BurgerCard> createState() => _BurgerCardState();
}

class _BurgerCardState extends State<BurgerCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      child: Container(
        width: 189,
        height: 193,
        padding: EdgeInsets.all(12),
        margin: const EdgeInsets.only(right:6),
        decoration: BoxDecoration(
            color: AppColors.whiteGrey,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.black6,width: 0.5)
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                width:95,
                height:95,
                child: Image.asset(widget.image)),
            SizedBox(
                width: double.infinity,
                child: Text(widget.name,style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left)),
            SizedBox(
                width: double.infinity,
                child: Text(widget.info,style: GoogleFonts.poppins(fontSize:9,fontWeight:FontWeight.w400,color:AppColors.black6),textAlign: TextAlign.left,maxLines: 2,overflow: TextOverflow.ellipsis,)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  Text("Rs.${widget.price}",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:AppColors.black6),),
                  const Spacer(),
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            setState(() {
                              AppList.popularBurgersList[widget.index]["favorite"] =
                              !AppList.popularBurgersList[widget.index]["favorite"];
                              // log(AppList.popularBurgersLIst[index]["favorite"]);
                            });
                          }, icon: ImageIcon( AssetImage(AppList.popularBurgersList[widget.index]["favorite"]
                          ? "assets/images/fav-icon.png"
                          : "assets/images/fav-outline.png",),size: 19,color: AppColors.mainColor,))),
                  const SizedBox(width: 3),
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){}, icon: ImageIcon(const AssetImage("assets/images/circle-add-icon.png"),size: 19,color: AppColors.mainColor,))),
                ],
              ),
            )
      
          ],
        ),
      ),
    );;
  }
}
