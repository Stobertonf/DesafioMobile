import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
/*import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController mapController;

  Set<Marker> markers = new Set<Marker>();
  double lat = 53.4782477;
  double long = -3.19953739;

  void _onMapController(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onSubmitted: (val) {
            lat = 53.4782477;
            long = -3.19953739;

            LatLng position = LatLng(lat, long);
            mapController.moveCamera(CameraUpdate.newLatLng(position));

            //Marcador
            final Marker marcador = Marker(
              markerId: new MarkerId("123456789"),
              position: position,
              infoWindow: InfoWindow(
                title: "Cidade de Liverpool",
                snippet: 'Liverpool/ENG',
              ),
            );
            //Add marcador na localização
            setState(() {
              markers.add(marcador);
            });
          },
        ),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapController,
          onCameraMove: (data) {
            print(data);
          },
          onTap: (position) {
            print(position);
          },
          initialCameraPosition: CameraPosition(
            target: LatLng(lat, long),
            zoom: 11.0,
          ),
          markers: markers,
        ),
      ),
    );
  }
}
*/
