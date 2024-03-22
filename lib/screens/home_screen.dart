import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:food_app/config/app_list.dart';
import 'package:food_app/screens/menu_bar_screen.dart';
import 'package:food_app/widgets/cards/delicious_food_card.dart';
import 'package:food_app/widgets/cards/desi_food_card.dart';
import 'package:food_app/widgets/cards/popular_card_widget.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';
import '../widgets/cards/burger_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
TextEditingController searchController = TextEditingController();
String _selectedChoice = '';
bool isSearch = false;
class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();


      @override
      void initState() {
        super.initState();
        _scrollController.addListener(_scrollListener);
      }


  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels > 100) {
      setState(() {
        isSearch = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context).size;
    return GestureDetector(

      onTap: () => FocusScope.of(context).unfocus(),
      onVerticalDragUpdate: (details) {
        if (details.primaryDelta! < 0) {

          setState(() {
            isSearch = false;
          });
        } else if (details.primaryDelta! > 0) {// Scrolling down
          setState(() {
            isSearch = true;
          });
        }
      },
      child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: 60,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MenuBarScreen(),));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/line.png",width: 25,),
                    Image.asset("assets/images/line-2.png",width: 21,height: 9,),
                    Image.asset("assets/images/line-1.png",width: 14,),
                  ],
                ),
              ),
            ),
            centerTitle: true,
            title: Column(
              children: [
                Text("Location:",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:AppColors.white6,),),
                const SizedBox(height: 5,),
                Text("Islamabad, Pakistan",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w500,color:Colors.white,),)
              ],
            ),

            bottom:isSearch?PreferredSize(preferredSize: const Size(double.infinity, 80), child: Column(
              children: [
                Text("What would you like to eat?",style: GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w600,color:Colors.white,),),
                UserWidgets.homeSearchTextField(searchController)
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
            child: SingleChildScrollView(
              // controller: _scrollController,
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
                          child: SizedBox(
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
                      // color: Colors.red,
                      image: const DecorationImage(image: AssetImage("assets/images/big-offer-image.png"),fit: BoxFit.fill)
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(30,25,0,0),
                    child: Text("Enjoy Delicious Food",style: GoogleFonts.poppins(
                      fontSize:16,fontWeight:FontWeight.w600,color:Colors.black,),),
                  ),
                  //                                       // Food List - 2
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ImageIcon(AssetImage("assets/images/arrow-left.png"),size: 15,),
                        Flexible(
                          child: SizedBox(
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
                    padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 0),
                    child: Stack(
                      children: [
                         SizedBox(
                            height: 120,
                            child: ListView.builder(
                              padding: const EdgeInsets.symmetric(horizontal: 23),
                              itemCount:AppList.deliciousFoodList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                String name = AppList.deliciousFoodList[index]["name"];
                                String image = AppList.deliciousFoodList[index]["image"];
                                return DeliciousFoodCard(name: name, image: image, onTap: (){});
                              },),
                          ),
                        SizedBox(
                          height: 120,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ImageIcon(const AssetImage("assets/images/arrow-left.png"),size: 15,color: AppColors.black6,),
                                ImageIcon(const AssetImage("assets/images/arrow-right.png"),size: 15,color: AppColors.black6,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,25,15,15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Popular Burgers",style: GoogleFonts.poppins(
                          fontSize:16,fontWeight:FontWeight.w600,color:Colors.black,),),
                        InkWell(
                            onTap: (){},
                            child: Text("View All",style: GoogleFonts.poppins(
                                fontSize:11,fontWeight:FontWeight.w500,color:AppColors.mainColor),))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 193,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left:  30,right: 10),
                      itemCount:AppList.popularBurgersList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String name = AppList.popularBurgersList[index]["name"];
                        String info = AppList.popularBurgersList[index]["info"];
                        int price = AppList.popularBurgersList[index]["price"];
                        String image = AppList.popularBurgersList[index]["image"];
                        bool fav = AppList.popularBurgersList[index]["favorite"];
                        return BurgerCard(name: name,image: image,index: index,favorite: fav,price: price,info: info,);
                      },),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,25,15,15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Deals for you",style: GoogleFonts.poppins(
                          fontSize:16,fontWeight:FontWeight.w600,color:Colors.black,),),
                        InkWell(
                            onTap: (){},
                            child: Text("View All",style: GoogleFonts.poppins(
                                fontSize:11,fontWeight:FontWeight.w500,color:AppColors.mainColor),))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 89,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left:  30,right: 10),
                      itemCount:AppList.dealList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String image = AppList.dealList[index]["image"];
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Container(
                            width: 89,
                            height: 89,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },),
                  ),
                  const SizedBox(height: 30,),
                  SizedBox(
                    height: 111,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left:  30,right: 10),
                      itemCount:AppList.dealBannerList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String image = AppList.dealBannerList[index]["image"];
                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {},
                          child: Container(
                            width: 270,
                            height: 111,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
                            ),
                          ),
                        );
                      },),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,25,15,15),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Most Popular",style: GoogleFonts.poppins(
                          fontSize:16,fontWeight:FontWeight.w600,color:Colors.black,),),
                       SizedBox(
                           height: 22,width: 22,
                           child: Image.asset("assets/images/fire-1.png"))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 78,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(left:  30,right: 10),
                      itemCount:AppList.rateList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String image = AppList.rateList[index]["image"];
                        String name = AppList.rateList[index]["name"];
                        String info = AppList.rateList[index]["info"];
                        double rating = AppList.rateList[index]["rating"];
                        return PopularCard(image: image, name: name, info: info, rating: rating, index: index);
                      },),
                  ),
                  const SizedBox(height: 20,)

                ],
              ),
            ),
          )
        ],
      ),
      ),
    );
  }
}
