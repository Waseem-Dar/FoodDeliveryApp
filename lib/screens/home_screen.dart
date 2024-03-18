import 'dart:developer';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:food_app/config/app_list.dart';
import 'package:food_app/widgets/delicious_food_card.dart';
import 'package:food_app/widgets/desi_food_card.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
TextEditingController searchController = TextEditingController();
String _selectedChoice = '';
bool isSearch = false;
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 60,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/line.png",width: 25,),
                  Image.asset("assets/images/line-2.png",width: 21,height: 7,),
                  Image.asset("assets/images/line-1.png",width: 14,),
                ],
              ),
            ),
            centerTitle: true,
            title: Column(
              children: [
                Text("Location:",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:AppColors.white6,),),
                SizedBox(height: 5,),
                Text("Islamabad, Pakistan",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:Colors.white,),)
              ],
            ),

            bottom:isSearch?PreferredSize(preferredSize: const Size(double.infinity, 80), child: Column(
              children: [
                Text("What would you like to eat?",style: GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w600,color:Colors.white,),),
                UserWidgets.homePageTextField(searchController)
              ],
            )):null,

            actions: [
              isSearch?const SizedBox():IconButton(
                  onPressed: (){
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: ImageIcon(const AssetImage("assets/images/search-icon-2.png"),color: AppColors.whiteGrey,size: 19,)),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  splashColor: Colors.transparent,
                  onTap: () {},
                  child: SizedBox(
                    width: 25,
                    height: 25,
                    child: Stack(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/image-icon.png"),
                        ),
                        Positioned(
                          top: 1,
                          right: 1,
                          child: Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(3),
                              border: Border.all(color: Colors.white,width: 1)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

            ],
            pinned: true,
            backgroundColor: AppColors.mainColor,
            expandedHeight: 60,
          ),
          SliverFillRemaining(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                 if (notification.metrics.extentBefore > 50) {
                      setState(() {
                       isSearch = false;
                              });
                 } return true;
                 },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,25,15,15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Top Restaurants for Desi Foods",style: GoogleFonts.poppins(
                              fontSize:16,fontWeight:FontWeight.w500,color:Colors.black,),),
                          InkWell(
                              onTap: (){},
                              child: Text("View All",style: GoogleFonts.poppins(
                              fontSize:11,fontWeight:FontWeight.w500,color:AppColors.mainColor),))
                        ],
                      ),
                    ),
                                                         // Category Selection
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                       padding: const EdgeInsets.symmetric(horizontal: 26),
                       child: Wrap(
                         spacing: 8,
                         children: AppList.choiceList.map((choice){
                           return ChoiceChip(
                             backgroundColor: AppColors.whiteGrey,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                               side: BorderSide.none,
                               showCheckmark: false,
                               selectedColor: AppColors.mainColor,
                               labelStyle: GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w500,
                                   color:_selectedChoice == choice?Colors.white:Colors.black),
                               label: SizedBox(
                                   width: 65,
                                   child: Center(child: Text(choice))),
                               selected: _selectedChoice == choice,
                             onSelected: (selected) {
                               setState(() {
                                 _selectedChoice = selected ? choice : '';
                               });
                             },
                           );
                         }).toList(),
                       ),
                     ),
                                                               // Food List - 1
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ImageIcon(AssetImage("assets/images/arrow-left.png"),size: 15,),
                          Flexible(
                            child: Container(
                              height: 117,
                              child: ListView.builder(
                                itemCount:AppList.desiFoodList.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  String name = AppList.desiFoodList[index]["name"];
                                  String image = AppList.desiFoodList[index]["image"];
                                  return DesiFoodCard(name: name, image: image, onTap: (){});
                                },),
                            ),
                          ),
                          const ImageIcon(AssetImage("assets/images/arrow-right.png"),size: 15,),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 120,
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      decoration:   BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.red,
                        image: DecorationImage(image: AssetImage("assets/images/big-offer-image.png"),fit: BoxFit.fill)
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(30,25,0,0),
                      child: Text("Enjoy Delicious Food",style: GoogleFonts.poppins(
                        fontSize:16,fontWeight:FontWeight.w600,color:Colors.black,),),
                    ),
                                                          // Food List - 2
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const ImageIcon(AssetImage("assets/images/arrow-left.png"),size: 15,),
                          Flexible(
                            child: Container(
                              height: 120,
                              child: ListView.builder(
                                itemCount:AppList.deliciousFoodList.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  String name = AppList.deliciousFoodList[index]["name"];
                                  String image = AppList.deliciousFoodList[index]["image"];
                                  return DeliciousFoodCard(name: name, image: image, onTap: (){});
                                },),
                            ),
                          ),
                          const ImageIcon(AssetImage("assets/images/arrow-right.png"),size: 15,),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30,25,15,15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popular Burgers",style: GoogleFonts.poppins(
                            fontSize:16,fontWeight:FontWeight.w500,color:Colors.black,),),
                          InkWell(
                              onTap: (){},
                              child: Text("View All",style: GoogleFonts.poppins(
                                  fontSize:11,fontWeight:FontWeight.w500,color:AppColors.mainColor),))
                        ],
                      ),
                    ),
                    Container(
                      height: 193,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        itemCount:AppList.popularBurgersLIst.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          String name = AppList.popularBurgersLIst[index]["name"];
                          String info = AppList.popularBurgersLIst[index]["info"];
                          int price = AppList.popularBurgersLIst[index]["price"];
                          String image = AppList.popularBurgersLIst[index]["image"];
                          bool fav = AppList.popularBurgersLIst[index]["favorite"];
                          return Container(
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
                                    child: Image.asset(image)),
                                SizedBox(
                                    width: double.infinity,
                                    child: Text(name,style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left)),
                                SizedBox(
                                    width: double.infinity,
                                    child: Text(info,style: GoogleFonts.poppins(fontSize:9,fontWeight:FontWeight.w400,color:AppColors.black6),textAlign: TextAlign.left,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: Row(
                                    children: [
                                      Text("Rs.$price",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w500,color:AppColors.black6),),
                                      const Spacer(),
                                      SizedBox(
                                          width: 20,
                                          height: 20,
                                          child: IconButton(
                                              padding: EdgeInsets.zero,
                                              onPressed: (){
                                                setState(() {
                                                  AppList.popularBurgersLIst[index]["favorite"] =
                                                  !AppList.popularBurgersLIst[index]["favorite"];
                                                // log(AppList.popularBurgersLIst[index]["favorite"]);
                                                });
                                              }, icon: ImageIcon( AssetImage(AppList.popularBurgersLIst[index]["favorite"]
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
                          );
                        },),
                    ),






                     Container(width: double.infinity,
                      height: 100,color: Colors.yellow,
                       child: const Center(child: Text("Continue")),
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
      ),
    );
  }
}
