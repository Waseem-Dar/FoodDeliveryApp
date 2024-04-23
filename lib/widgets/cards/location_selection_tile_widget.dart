import 'package:flutter/material.dart';
import 'package:food_app/screens/location_screens/edit_location_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../config/app_colors.dart';
import '../../screens/location_screens/edit_&_delete_location.dart';

class LocationSelectionTile extends StatefulWidget {
  final LatLng location;
  final String address;
  final String street;
  final String? instruction;
  final int index;
  final int selectedValue;
  final ValueChanged onChanged;
  const LocationSelectionTile({super.key, required this.location, required this.address, required this.street, required this.instruction,required this.index, required this.selectedValue, required this.onChanged});

  @override
  State<LocationSelectionTile> createState() => _LocationSelectionTileState();
}

int _value = 1;

class _LocationSelectionTileState extends State<LocationSelectionTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          horizontalTitleGap: 0,
          contentPadding: EdgeInsets.zero,
          dense: true,
          leading: Radio(
            activeColor: AppColors.mainColor,
            fillColor: MaterialStatePropertyAll(AppColors.mainColor),
            value: widget.index,
            groupValue: widget.selectedValue,
            onChanged: widget.onChanged,
            // onChanged: (value) {
            //   setState(() {
            //     _value = value as int;
            //   });
            // },
          ),
          title: Text(widget.address, style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.mainColor)),
          subtitle: Text(widget.street, style: GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w400, color: AppColors.black6)),
        ),
        Divider(height: 0, thickness: 1, color: AppColors.white2, indent: 30, endIndent: 40),
      ],
    );
  }
}
