import 'package:flutter/material.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_app/widgets/cards/near_restaurant_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import '../config/app_colors.dart';
import '../config/app_list.dart';
import '../widgets/user_widgets.dart';

class NearbyScreen extends StatefulWidget {
  const NearbyScreen({super.key});

  @override
  State<NearbyScreen> createState() => _NearbyScreenState();
}

class _NearbyScreenState extends State<NearbyScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  final LatLng _initialCameraPosition =  const LatLng(33.6687964,73.0742062);
  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);


  }
  late BitmapDescriptor pinLocationIcon;
  @override
  void initState() {
    super.initState();
    setCustomMapPin();
    Timer(const Duration(seconds: 1), () {
      setState(() {
        _customInfoWindowController.addInfoWindow!(
          Container(
            width: 80,
            height: 35,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/images/union.png"))
            ),

            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text("You're Here",style: GoogleFonts.poppins(fontSize:9,fontWeight:FontWeight.w600,color:AppColors.mainColor),),
              ),
            ),
          ),
          _initialCameraPosition,
        );
      });
    });
  }
  void setCustomMapPin() async {
    pinLocationIcon = BitmapDescriptor.defaultMarker;
    BitmapDescriptor customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size:Size.fromHeight(19),),
      'assets/images/marker-icon.png',);
    setState(() {
      pinLocationIcon = customIcon;
    });
  }

  // new code
  final CustomInfoWindowController _customInfoWindowController =
  CustomInfoWindowController();
  final Set<Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    _markers.add(
      Marker(
        markerId: const MarkerId("marker_id"),
        position: _initialCameraPosition,
        icon: pinLocationIcon,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 53,),
                  UserWidgets.backButton(() {
                    Navigator.pop(context);
                  },),
                  const SizedBox(height: 6,),
                  Text("Nearby Restaurants",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w500,color:Colors.black),),
                  Divider(color: AppColors.white1,thickness: 2,),
                  const SizedBox(height:20),
                  SizedBox(
                      width: double.infinity,
                      child: Text("Your Location:",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                  const SizedBox(height: 5,)
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 160,
              child:  Stack(
                children: [
                  GoogleMap(
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: _initialCameraPosition,
                      zoom: 14.0,
                    ),


                      onMapCreated: (GoogleMapController controller) async {
                        _customInfoWindowController.googleMapController = controller;
                      },
                      markers: _markers,



                    // onMapCreated: _onMapCreated,
                    // markers:{
                    //   Marker(
                    //     markerId: const MarkerId('selectedLocation'),
                    //     position: _initialCameraPosition,
                    //     icon: pinLocationIcon,
                    //   ),
                    // },
                    // onTap: _handleTap,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                  ),
                  CustomInfoWindow(
                    controller: _customInfoWindowController,
                    height: 35,
                    width: 80,
                    offset: 37,
                  ),
                  // Button for get current location
                  // Positioned(
                  //     bottom: 10,
                  //     right: 0,
                  //     child: UserWidgets.currentLocationButton(() { })),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(height: 25,),
                  SizedBox(
                      width: double.infinity,
                      child: Text("Nearby Restaurants:",style: GoogleFonts.poppins(fontSize:14,fontWeight:FontWeight.w500,color:Colors.black),textAlign: TextAlign.left,)),
                  ListView.builder(
                    itemCount: AppList.nearRestaurantsList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.only(top: 10),
                    physics:const  NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      String name = AppList.nearRestaurantsList[index]["name"];
                      String address = AppList.nearRestaurantsList[index]["address"];
                      String details = AppList.nearRestaurantsList[index]["details"];
                      String image = AppList.nearRestaurantsList[index]["image"];
                      double rating = AppList.nearRestaurantsList[index]["rating"];
                      bool isOpen = AppList.nearRestaurantsList[index]["isOpen"];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: NearRestaurantCard(name: name, image: image, details: details, address: address, rating: rating, isOpen: isOpen, onTap: (){}),
                    );
                  },)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
