import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_app/screens/addresses_screens/add_new_address_screen.dart';
import 'package:food_app/widgets/user_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import '../../config/app_colors.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

TextEditingController searchLocationController = TextEditingController();

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  final String token = const Uuid().v4();
  List<dynamic> placesList = [];

  @override
  void initState() {
    super.initState();
    searchLocationController.addListener(onChange);
  }

  @override
  void dispose() {
    searchLocationController.removeListener(onChange);
    searchLocationController.dispose();
    super.dispose();
  }

  void onChange() {
    log('Search input changed: ${searchLocationController.text}');
    if (searchLocationController.text.isNotEmpty) {
      placeSuggestion(searchLocationController.text);
    } else {
      setState(() {
        placesList = [];
      });
    }
  }

  Future<void> placeSuggestion(String input) async {
    const String apiKey = "AIzaSyDzCtPjkcr3P7FYY4aIeK8PUtJmzngteMY";
    try {
      String baseUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json";
      String request = "$baseUrl?input=$input&key=$apiKey&sessiontoken=$token";
      log('Request URL: $request');
      var response = await http.get(Uri.parse(request));
      log('Response status: ${response.statusCode}');
      log('Response body: ${response.body}');
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        log('Parsed response: $data');
        setState(() {
          placesList = data["predictions"];
        });
      } else {
        throw Exception("Failed to load place suggestions");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  final LatLng _initialCameraPosition = const LatLng(33.6687964, 73.0742062);
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const ImageIcon(
              AssetImage("assets/images/left-arrow.png"),
              color: Colors.white,
              size: 15,
            ),
          ),
          title: Text(
            "Select your Location on Map",
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 60),
            child: Center(
              child: UserWidgets.homeSearchTextField(
                searchLocationController,
                "Search location",
                    () {},
                    () {
                  setState(() {});
                },
              ),
            ),
          ),
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
            if (placesList.isNotEmpty)
              Container(
                color: Colors.white,
                height: 220,
                child: ListView.builder(
                  itemCount: placesList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      dense: true,
                      onTap: () async {
                        final String placeId = placesList[index]["place_id"];
                        final details = await getPlaceDetails(placeId);
                        final lat = details["geometry"]["location"]["lat"];
                        final lng = details["geometry"]["location"]["lng"];
                        final GoogleMapController controller = await _controller.future;
                        controller.animateCamera(CameraUpdate.newLatLng(LatLng(lat, lng)));
                        setState(() {
                          _markers = {
                            Marker(
                              markerId: MarkerId(placeId),
                              position: LatLng(lat, lng),
                            ),
                          };
                          placesList = [];
                          searchLocationController.clear();
                        });
                      },
                      title: Text(
                        placesList[index]["description"],
                        style: GoogleFonts.poppins(fontSize: 15),
                      ),
                    );
                  },
                ),
              ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UserWidgets.currentLocationButton(() {
                    _getCurrentLocation();
                  }),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 165,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListTile(
                            onTap: () {},
                            dense: true,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            leading: ImageIcon(
                              const AssetImage("assets/images/direction-icon.png"),
                              size: 26,
                              color: AppColors.mainColor,
                            ),
                            title: Text(
                              "Use my Current Location",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainColor,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: AppColors.white2,
                            indent: 30,
                            endIndent: 30,
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const AddNewAddressScreen(),
                                ),
                              );
                            },
                            dense: true,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            leading: Icon(
                              Icons.add,
                              size: 26,
                              color: AppColors.mainColor,
                            ),
                            title: Text(
                              "Add a new Location",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainColor,
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
          ],
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getPlaceDetails(String placeId) async {
    const String apiKey = "AIzaSyDzCtPjkcr3P7FYY4aIeK8PUtJmzngteMY";
    try {
      String baseUrl = "https://maps.googleapis.com/maps/api/place/details/json";
      String request = "$baseUrl?place_id=$placeId&key=$apiKey";
      log('Requesting place details: $request');
      var response = await http.get(Uri.parse(request));
      log('Place details response status: ${response.statusCode}');
      log('Place details response body: ${response.body}');
      if (response.statusCode == 200) {
        return json.decode(response.body)["result"];
      } else {
        throw Exception("Failed to load place details");
      }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
