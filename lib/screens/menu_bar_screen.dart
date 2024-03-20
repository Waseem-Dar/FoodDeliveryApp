import 'package:flutter/material.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:food_app/screens/profile_screens/profile_screen.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuBarScreen extends StatefulWidget {
  const MenuBarScreen({super.key});

  @override
  State<MenuBarScreen> createState() => _MenuBarScreenState();
}

class _MenuBarScreenState extends State<MenuBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28,53,28,50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.11),blurRadius:6.900000095367432,offset: const Offset(-2, 2)
                    )]
                  ),child: Icon(Icons.clear,color: AppColors.mainColor,),
                ),
              ),
            ),
              ListTile(
                horizontalTitleGap: 8,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12,),
                leading: const CircleAvatar(backgroundImage: AssetImage("assets/images/image-icon.png"),),
                title: Text("LoremIpsum",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),),
                subtitle: Text("Islamabad, Pakistan",style: GoogleFonts.poppins(fontSize:11,fontWeight:FontWeight.w400,color:AppColors.black6),),
              ),
              UserWidgets.tileWidget("assets/images/user-icon.png", "View Profile", () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
              },17),
              UserWidgets.tileWidget("assets/images/fav-icon.png", "Favourites", () {},20),
              UserWidgets.tileWidget("assets/images/cart-icon.png", "My Cart", () {},22),
              UserWidgets.tileWidget("assets/images/current-l-icon.png", "Nearby", () {},21),
              Divider(color: AppColors.white1,height: 15,endIndent: 25,indent: 30 ,thickness: 2,),
              UserWidgets.tileWidget("assets/images/offer-icon.png", "Vouchers & Offers", () {},26),
              UserWidgets.tileWidget("assets/images/order-icon.png", "Orders & Reordering", () {},23),
              UserWidgets.tileWidget("assets/images/addresses.png", "Addresses", () {},20),
              UserWidgets.tileWidget("assets/images/user-icon.png", "Invite Friends", () {},20),  //icon missing
              UserWidgets.tileWidget("assets/images/about-icon.png", "About Us", () {},19),
              UserWidgets.tileWidget("assets/images/privacy-icon.png", "Privacy Policy", () {},23),
              UserWidgets.tileWidget("assets/images/service-icon.png", "Terms of Service", () {},23),
              Divider(color: AppColors.white1,height:15,endIndent: 25,indent: 30 ,thickness: 2,),
              UserWidgets.tileWidget("assets/images/logOut-icon.png", "Log out", () {},18),

            ],
          ),
        ),
      ),
    );
  }
}