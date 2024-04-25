import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_app/screens/location_screens/edit_location_screen.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../config/app_colors.dart';
import '../../config/app_list.dart';
import '../../main.dart';

class SaveAddLocationScreen extends StatefulWidget {
  const SaveAddLocationScreen({super.key});

  @override
  State<SaveAddLocationScreen> createState() => _SaveAddLocationScreenState();
}

class _SaveAddLocationScreenState extends State<SaveAddLocationScreen> {
  final LatLng _initialCameraPosition = const LatLng(33.6687964,73.0742062);
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  Future<void> _onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);
  }

  Future<void> _goToLocation(LocationData locationData) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(locationData.latitude!, locationData.longitude!),
          zoom: 15.0,
        ),
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData? locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await location.getLocation();
    _goToLocation(locationData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const ImageIcon(AssetImage("assets/images/left-arrow.png"),color: Colors.white,size: 15,)),
        title: Text("Select your Location on Map",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w600,color:Colors.white),),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: mq.height * .8,
            child: GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _initialCameraPosition,
                zoom: 14.0,
              ),
              onMapCreated: _onMapCreated,
              markers: _markers,
              onTap: (LatLng location) {
                setState(() {
                  _markers = {
                    Marker(
                      markerId: const MarkerId('selectedLocation'),
                      position: location,
                    ),
                  };
                });
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                UserWidgets.currentLocationButton(() {_getCurrentLocation();}),
                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      Image.asset("assets/images/bottom-line.png",width: 52,),
                      ListView.builder(
                        itemCount: 1,
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 20,bottom: 30),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          double latitude = AppList.addressesList[index]["latitude"];
                          double longitude = AppList.addressesList[index]["longitude"];
                          LatLng location = LatLng(latitude, longitude);
                          String address = AppList.addressesList[index]["address"];
                          String street = AppList.addressesList[index]["street"];
                          String instruction = AppList.addressesList[index]["instruction"];
                        return Column(
                          children: [
                            ListTile(
                              dense:true,
                              leading:  ImageIcon(const AssetImage("assets/images/location-icon.png"),size: 26,color: AppColors.mainColor,),
                              title: Text("title",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w600,color:AppColors.mainColor),),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text("subtitle",style: GoogleFonts.poppins(fontSize:11,fontWeight:FontWeight.w400,color:AppColors.mainColor),),
                              ),
                              trailing:IconButton(onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => EditLocationScreen2(
                                    location: location, address: address, street: street, instruction: instruction, index: index),));
                              },
                                  icon: ImageIcon(const AssetImage("assets/images/edit-icon.png"),size: 21,color: AppColors.mainColor,)),
                            ),
                            Divider(thickness: 1,color: AppColors.white2,indent: 40,endIndent: 50,height: 10,),
                          ],
                        );
                      },),
                      InkWell(
                        borderRadius: BorderRadius.circular(23),
                        onTap: () {
                        },
                        child: Container(
                          width: 285,
                          height: 46,
                          decoration: BoxDecoration(
                            color:AppColors.mainColor,
                            borderRadius: BorderRadius.circular(23),
                          ),
                          child: Center(
                            child: Text("Add new address",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                                color:Colors.white),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
