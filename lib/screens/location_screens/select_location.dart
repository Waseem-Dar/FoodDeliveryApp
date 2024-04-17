import 'package:flutter/material.dart';
import 'package:food_app/screens/location_screens/select_location_map_screen.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Stack(
        children: [
          Container(
              height: double.infinity,
              width: double.infinity,
              child: const AddLocationMap())
        ],
      ),
    );
  }
}