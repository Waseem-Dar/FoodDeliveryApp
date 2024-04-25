import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:food_app/screens/location_screens/new_address_screen.dart';
import 'package:food_app/widgets/cards/location_selection_tile_widget.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../config/app_list.dart';
import '../../main.dart';

class AddLocationMap extends StatefulWidget {
  final void Function(LatLng)? onLocationSelected;
  const AddLocationMap({super.key,this.onLocationSelected});

  @override
  State<AddLocationMap> createState() => AddLocationMapState();
}
int _value = 1;
class AddLocationMapState extends State<AddLocationMap> {
  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
   final LatLng _initialCameraPosition = const LatLng(33.6687964,73.0742062);

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
            width: double.infinity,
            height: mq.height * .7,
            child: GoogleMap(
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: _initialCameraPosition,
                zoom: 14.0,
              ),
              onMapCreated: _onMapCreated,
              markers: _markers,
              // onTap: (LatLng location) {
              //   setState(() {
              //     // _selectedLocation = location;
              //     _markers = {
              //       Marker(
              //         markerId: const MarkerId('selectedLocation'),
              //         position: location,
              //       ),
              //     };
              //
              //   });
              //   if (widget.onLocationSelected != null) {
              //     widget.onLocationSelected!(_selectedLocation);
              //   }
              // },
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                UserWidgets.currentLocationButton(() {_getCurrentLocation();}),
                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50)),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                        children:  [
                          Image.asset("assets/images/bottom-line.png",width: 52,),
                          const SizedBox(height: 8,),
                          ListView.builder(
                            itemCount: AppList.addressesList.length >= 2 ? 2 : AppList.addressesList.length,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              int lastIndex = AppList.addressesList.length - 1 - index;
                              double latitude = AppList.addressesList[lastIndex]["latitude"];
                              double longitude = AppList.addressesList[lastIndex]["longitude"];
                              LatLng location = LatLng(latitude, longitude);
                              String address = AppList.addressesList[lastIndex]["address"];
                              String street = AppList.addressesList[lastIndex]["street"];
                              String  instruction = AppList.addressesList[lastIndex]["instruction"];
                              return LocationSelectionTile(location: location, address: address, street: street,instruction: instruction.isNotEmpty?instruction:"", index: lastIndex, selectedValue: _value,onChanged: (value) {
                                setState(() {
                                  _value = value;
                                });
                              },);
                            },
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewAddressScreen(),));
                            },
                             contentPadding: const EdgeInsets.symmetric(horizontal: 13),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            leading:  Icon(Icons.add,size: 26,color: AppColors.mainColor,),
                            title: Text("Add a new Location",style: GoogleFonts.poppins(
                              fontSize:15,fontWeight:FontWeight.w500,color:AppColors.mainColor,),),
                          ),
                          const SizedBox(height: 10,),
                          UserWidgets.mainButton("Continue", AppColors.mainColor, 16, Colors.white, 30, () { }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}