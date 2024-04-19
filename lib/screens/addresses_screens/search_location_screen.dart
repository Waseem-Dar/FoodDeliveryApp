import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/screens/addresses_screens/add_new_address_screen.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../config/app_colors.dart';
import '../location_screens/select_location_map_screen.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}
TextEditingController searchLocationController = TextEditingController();

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  @override
  void initState() {
    super.initState();
  }
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


    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const ImageIcon(AssetImage("assets/images/left-arrow.png"),color: Colors.white,size: 15,)),
          title: Text("Select your Location on Map",style: GoogleFonts.poppins(fontSize:18,fontWeight:FontWeight.w600,color:Colors.white),),
          bottom: PreferredSize(preferredSize: const Size(double.infinity, 60), child: Center(
            child: UserWidgets.homeSearchTextField(searchLocationController, "Search location"),
          )),
        ),
        body: Stack(
          children: [
            GoogleMap(
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
                    height:  165,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50))
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          ListTile(
                            onTap: () {},
                            dense: true,
                            // contentPadding: ,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            leading:  ImageIcon(const AssetImage("assets/images/direction-icon.png"),size: 26,color: AppColors.mainColor, ),
                            title: Text("Use my Current Location",style: GoogleFonts.poppins(
                              fontSize:15,fontWeight:FontWeight.w500,color:AppColors.mainColor,),),
                          ),
                          Divider(thickness: 1,color: AppColors.white2,indent: 30,endIndent: 30,),
                          ListTile(
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewAddressScreen(),));
                            },
                            dense: true,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            leading:  Icon(Icons.add,size: 26,color: AppColors.mainColor,),
                            title: Text("Add a new Location",style: GoogleFonts.poppins(
                              fontSize:15,fontWeight:FontWeight.w500,color:AppColors.mainColor,),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
