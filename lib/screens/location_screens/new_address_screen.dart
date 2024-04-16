import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/main.dart';
import 'package:food_app/widgets/address_textFeild.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../config/app_colors.dart';
import '../../widgets/add_location_widget.dart';

class NewAddressScreen extends StatefulWidget {
  const NewAddressScreen({super.key});

  @override
  State<NewAddressScreen> createState() => _NewAddressScreenState();
}
TextEditingController addressController = TextEditingController();
TextEditingController streetController = TextEditingController();
TextEditingController aDIController = TextEditingController();
class _NewAddressScreenState extends State<NewAddressScreen> {
  @override
  void initState() {
    super.initState();

  }
  final LatLng _initialCameraPosition = const LatLng(37.42796133580664, -122.085749655962);
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    UserWidgets.currentLocationButton(() {_getCurrentLocation();}),
                    const SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50)),
                      ),
                      child: SingleChildScrollView(
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
                              UserWidgets.textFieldLabel("Any Delivery Instructions"),
                              AddressTextFieldWidget(controller: aDIController,max: true,),
                              const SizedBox(height: 40,),
                
                
                              Padding(
                                padding: const EdgeInsets.only(bottom: 15,top: 15),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(23),
                                  onTap: () {
                                    Navigator.pop(context);},
                                  child: Container(
                                    width: 285,
                                    height: 46,
                                    decoration: BoxDecoration(
                                      color:addressController.text.isEmpty || streetController.text.isEmpty?AppColors.blackGrey:AppColors.mainColor,
                                      borderRadius: BorderRadius.circular(23),
                                    ),
                                    child: Center(
                                      child: Text("Save & Continue",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                                          color:addressController.text.isEmpty || streetController.text.isEmpty?AppColors.black6:Colors.white),),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
