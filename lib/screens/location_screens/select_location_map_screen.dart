import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/config/app_colors.dart';
import 'package:food_app/screens/location_screens/new_address_screen.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../main.dart';

class AddLocationMap extends StatefulWidget {
  final void Function(LatLng)? onLocationSelected;
  const AddLocationMap({super.key,this.onLocationSelected});

  @override
  State<AddLocationMap> createState() => AddLocationMapState();
}
int _value = 0;
class AddLocationMapState extends State<AddLocationMap> {
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};
  late LatLng _initialCameraPosition;
  static late LatLng _selectedLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _initialCameraPosition = const LatLng(37.42796133580664, -122.085749655962);
    _selectedLocation = _initialCameraPosition;

  }

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
              onTap: (LatLng location) {
                setState(() {
                  // _selectedLocation = location;
                  _markers = {
                    Marker(
                      markerId: const MarkerId('selectedLocation'),
                      position: location,
                    ),
                  };

                });
                if (widget.onLocationSelected != null) {
                  widget.onLocationSelected!(_selectedLocation);
                }
              },
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
                            itemCount: 2,
                            physics:  const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return  Column(
                                children: [
                                  ListTile(
                                    horizontalTitleGap: 0,
                                    contentPadding: EdgeInsets.zero,
                                    dense: true,
                                    leading:  Radio(
                                      activeColor: AppColors.mainColor,
                                      fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
                                        if (states.contains(MaterialState.selected)) {
                                          return AppColors.mainColor;
                                        } else {
                                          return AppColors.mainColor;
                                        }
                                      }),
                                      value: index,
                                      groupValue: _value,
                                      onChanged: (value) {
                                      setState(() {
                                        _value = value!;
                                      });
                                    },),
                                    title: Text("Bahria Town Ph 04",style: GoogleFonts.poppins(fontSize:13,fontWeight:FontWeight.w600,color:AppColors.mainColor,)),
                                    subtitle: Text("Rawalpindi, Pakistan",style: GoogleFonts.poppins(fontSize:11,fontWeight:FontWeight.w400,color:AppColors.black6,)),
                                    trailing: IconButton(onPressed: (){}, icon: ImageIcon(const AssetImage("assets/images/edit-icon.png"),size: 25,color: AppColors.mainColor,),),
                                  ),
                                  Divider(height: 0,thickness: 1,color: AppColors.white2,indent: 30,endIndent: 40,),
                                ],
                              );
                            },),
                          ListTile(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const NewAddressScreen(),));
                            },
                            dense: true,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            leading:  Icon(Icons.add,size: 26,color: AppColors.mainColor,),
                            title: Text("Add a new Location",style: GoogleFonts.poppins(
                              fontSize:15,fontWeight:FontWeight.w500,color:AppColors.mainColor,),),
                          ),
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
                                  color:AppColors.mainColor,
                                  borderRadius: BorderRadius.circular(23),
                                ),
                                child: Center(
                                  child: Text("Continue",style: GoogleFonts.poppins(fontWeight:FontWeight.w400,fontSize:16,
                                      color:Colors.white),),
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
          )
        ],
      ),
    );
  }
}