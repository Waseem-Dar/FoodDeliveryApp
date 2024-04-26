import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:food_app/main.dart';
import 'package:food_app/screens/addresses_screens/save_add_location_screen.dart';
import 'package:food_app/widgets/address_textFeild.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as deviceLocation;
import 'package:location/location.dart';

import '../../config/app_colors.dart';
import '../../config/constructor.dart';


class AddNewAddressScreen extends StatefulWidget {
  const AddNewAddressScreen({super.key});

  @override
  State<AddNewAddressScreen> createState() => _AddNewAddressScreenState();
}
TextEditingController addressController = TextEditingController();
TextEditingController streetController = TextEditingController();
TextEditingController nearLocationController = TextEditingController();
class _AddNewAddressScreenState extends State<AddNewAddressScreen> {

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
    deviceLocation.Location location = deviceLocation.Location();
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
  Future<String> getPlaceName(double latitude, double longitude) async {
    try {
      List<Placemark> placeMarks = await placemarkFromCoordinates(latitude, longitude);
      if (placeMarks.isNotEmpty) {
        Placemark placeMark = placeMarks[0];

        String? street = placeMark.street;
        String? subLocality = placeMark.subLocality;
        String? city = placeMark.locality;
        String? country = placeMark.country;
        return "$street, $subLocality, $city, $country";
      }
    } catch (e) {
      log('Error: $e');
    }
    return 'Place not found';
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const ImageIcon(AssetImage("assets/images/left-arrow.png"),color: Colors.white,size: 15,)),
          title: Text("Add New Address",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w600,color:Colors.white),),
        ),
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: mq.height-520,
              // height: mq.height * .35,
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
                    _markers = {
                      Marker(
                        markerId: const MarkerId('selectedLocation'),
                        position: location,
                      ),
                    };

                  print('Selected Location: ${location.toString()}');
                  getPlaceName(location.latitude, location.longitude).then((result) {
                    log(result);
                    addressController.text = result;
                  });
                  setState(() {});
                  },
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 520,
              child:  UserWidgets.currentLocationButton(() {_getCurrentLocation();}),),
            Align(
              alignment: Alignment.bottomCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      height: 500,
                        color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children:  [
                            const SizedBox(height: 70,),
                            UserWidgets.textFieldLabel("Address*"),
                            AddressTextFieldWidget(controller: addressController,max: false,),
                            const SizedBox(height: 15,),
                            UserWidgets.textFieldLabel("Street/Apartment/Floor*"),
                            AddressTextFieldWidget(controller: streetController,max: false,),
                            const SizedBox(height: 15,),
                            UserWidgets.textFieldLabel("Near Locations (if any)"),
                            AddressTextFieldWidget(controller: nearLocationController,max: false,),
                            const SizedBox(height: 105,),

                            Padding(
                              padding: const EdgeInsets.only(bottom: 15,top: 15),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(23),
                                onTap: () {
                                  LocationDetails locationDetails = LocationDetails(
                                      latitude: _markers.isNotEmpty?_markers.first.position.latitude:_initialCameraPosition.latitude,
                                      longitude: _markers.isNotEmpty?_markers.first.position.longitude:_initialCameraPosition.longitude,
                                      address: addressController.text,
                                      street: streetController.text,
                                      instructions: nearLocationController.text);

                                  addressController.clear();
                                  streetController.clear();
                                  nearLocationController.clear();
                                  // use pushReplacement to navigate
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const  SaveAddLocationScreen(),));
                                },
                                child: Container(
                                  width: 285,
                                  height: 46,
                                  decoration: BoxDecoration(
                                    color:addressController.text.isEmpty || streetController.text.isEmpty || _markers.isEmpty?AppColors.blackGrey:AppColors.mainColor,
                                    borderRadius: BorderRadius.circular(23),
                                  ),
                                  child: Center(
                                    child: Text("Add Location",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                                        color:addressController.text.isEmpty || streetController.text.isEmpty || _markers.isEmpty?AppColors.black6:Colors.white),),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
