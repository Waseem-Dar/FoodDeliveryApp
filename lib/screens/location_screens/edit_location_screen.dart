import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/config/app_list.dart';
import 'package:food_app/main.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/widgets/address_textFeild.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../config/app_colors.dart';
import '../../config/constructor.dart';

class EditLocationScreen2 extends StatefulWidget {
  final LatLng location;
  final String address;
  final String street;
  final String instruction;
  final int index;
  const EditLocationScreen2({super.key, required this.location, required this.address, required this.street, required this.instruction,required this.index});

  @override
  State<EditLocationScreen2> createState() => _EditLocationScreen2State();
}
class _EditLocationScreen2State extends State<EditLocationScreen2> {

    TextEditingController addressController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController aIController = TextEditingController();
    late Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _markers = {
      Marker(
        markerId: const MarkerId('selectedLocation'),
        position: widget.location,
      ),
    };
    addressController.text = widget.address;
    streetController.text = widget.street;
    aIController.text = widget.instruction;
  }
  final LatLng _initialCameraPosition = const LatLng(33.6687964,73.0742062);
  final Completer<GoogleMapController> _controller = Completer();

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
  void _handleTap(LatLng tappedPoint) {
    setState(() {
      _markers = {
        Marker(
          markerId: const MarkerId('selectedLocation'),
          position: tappedPoint,
        ),
      };
    });
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
              height: mq.height * .35,
              child: GoogleMap(
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: widget.location,
                  zoom: 14.0,
                ),
                onMapCreated: _onMapCreated,
                markers: _markers,
                onTap: _handleTap,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
              ),
            ),
            Positioned(
              right: 0,
              top: 115,
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
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                        child: Column(
                          children:  [
                            Image.asset("assets/images/bottom-line.png",width: 52,),
                            const SizedBox(height: 70,),
                            UserWidgets.textFieldLabel("Address*"),
                            AddressTextFieldWidget(controller: addressController,max: false,),
                            const SizedBox(height: 15,),
                            UserWidgets.textFieldLabel("Street/Apartment/Floor*"),
                            AddressTextFieldWidget(controller: streetController,max: false,),
                            const SizedBox(height: 15,),
                            UserWidgets.textFieldLabel("Any Instructions"),
                            AddressTextFieldWidget(controller: aIController,max: true,),
                            const SizedBox(height: 40,),

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
                                      instructions: aIController.text);
                                  print(AppList.addressesList[widget.index]["address"]);

                                  // Convert the LocationDetails object to a Map<String, dynamic>
                                  Map<String, dynamic> locationMap = {
                                    "latitude": locationDetails.latitude,
                                    "longitude": locationDetails.longitude,
                                    "address": locationDetails.address,
                                    "street": locationDetails.street,
                                    "instructions": locationDetails.instructions,
                                  };

                                  AppList.addressesList[widget.index]= locationMap;
                                  print(AppList.addressesList[widget.index]["address"]);

                                  addressController.clear();
                                  streetController.clear();
                                  aIController.clear();
                                  Navigator.pop(context);
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
