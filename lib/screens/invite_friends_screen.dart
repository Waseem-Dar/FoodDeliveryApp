import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../config/app_colors.dart';
import '../widgets/user_widgets.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({super.key});

  @override
  State<InviteFriendsScreen> createState() => _InviteFriendsScreenState();
}
TextEditingController referralCodeController = TextEditingController(text: "V102MVU3F3901X");
TextEditingController referralLinkController = TextEditingController(text: "https://www.Loremipsum/sumptu018.referral-link-invitation...");

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 53,),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: UserWidgets.backButton(() {
                Navigator.pop(context);
              },),
            ),
            const SizedBox(height: 6,),
            Text("Invite Friends ",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
            Divider(color: AppColors.white1,thickness: 2,indent: 25,endIndent: 25,),
            const SizedBox(height:30),
            Container(
              height: 166,
                width: double.infinity,
              margin:const EdgeInsets.symmetric(horizontal: 18),
              padding: const EdgeInsets.only(left: 17),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text("Invite your friends and get rewarded!",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.white),),
                            Text("Enjoy your rewards by sharing  with your friends and get some discounts.",style: GoogleFonts.poppins(fontSize:12,fontWeight:FontWeight.w400,color:Colors.white),),
                          ],
                        ),
                      ),
                      Image.asset("assets/images/gift-image.png",width: 110,height: 150,),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 6,bottom: 4),
                    child: Text("Terms & Conditions apply*",style: GoogleFonts.poppins(fontSize:10,fontWeight:FontWeight.w400,color:Colors.white),),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 38,),
            Text("Your Referral  Code",style: GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w600,color:Colors.black),),
            UserWidgets.inviteTextField(referralCodeController, ()async {
              await Clipboard.setData(ClipboardData(text: referralCodeController.text));
            }),
            Text("Your QR CODE",style: GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w600,color:Colors.black),),
            Container(
              height: 130,
              width: 130,
              margin: const EdgeInsets.only(top: 28,bottom: 38),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.17),offset: const Offset(0, 0),blurRadius: 9.199999809265137)]
              ),
              child: Center(child: QrImageView(
                data: 'This is a simple QR code',
                version: QrVersions.auto,
                size: 110,
              ),),
            ),
            Text("Your Referral  LINK",style: GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w600,color:Colors.black),),
            UserWidgets.inviteTextField(referralLinkController, ()async {
              await Clipboard.setData(ClipboardData(text: referralLinkController.text));
            }),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextButton.icon(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      minimumSize: const Size(160, 46),
                      padding: const EdgeInsets.only(right:25 )
                  ),
                  onPressed: (){},
                  icon: const Padding(
                    padding: EdgeInsets.only(right: 30),
                    child: ImageIcon(AssetImage("assets/images/share-icon.png"),color: Colors.white,size: 18,),
                  ),
                  label: Text("Share",style: GoogleFonts.poppins(fontSize:16,fontWeight:FontWeight.w400,color:Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}

