import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  Set<Marker> _markers = {};
  // for setCustomMarker function
  BitmapDescriptor? mapMarker;

  @override
  void initState() {
    // TODO: implement initState
    setCustomMarker();
    super.initState();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/marker.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent.shade200,
        centerTitle: true,
        title: Text("Google Maps "),
      ),
      body: GoogleMap(
        onMapCreated: onMapCreated,
        markers: _markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(12.9610, 77.6387),
          zoom: 15,
        ),
      ),
    );
  }

  // This function is to add the markers
  void onMapCreated(GoogleMapController controller) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-1'),
          icon: mapMarker!,
          position: LatLng(12.962938, 77.632852),
          infoWindow:
              InfoWindow(title: 'Marker 1', snippet: 'Marker 1 snippet'),
        ),
        //      Marker(markerId: MarkerId('id-2'),position: LatLng(12.968165, 77.631801),),
      );
    });
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-2'),
          icon: mapMarker!,
          position: LatLng(12.968165, 77.631801),
          infoWindow:
              InfoWindow(title: 'Marker 2', snippet: 'Marker 2 snippet'),
        ),
        //      Marker(markerId: MarkerId('id-2'),position: LatLng(12.968165, 77.631801),),
      );
    });
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-3'),
          icon: mapMarker!,
          position: LatLng(12.964897, 77.633897),
          infoWindow:
              InfoWindow(title: 'Marker 3', snippet: 'Marker 3 snippet'),
        ),
        //      Marker(markerId: MarkerId('id-2'),position: LatLng(12.968165, 77.631801),),
      );
    });
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('id-4'),
          icon: mapMarker!,
          position: LatLng(12.966897, 77.633897),
          infoWindow:
              InfoWindow(title: 'Marker 4', snippet: 'Marker 4 snippet'),
        ),
        //      Marker(markerId: MarkerId('id-2'),position: LatLng(12.968165, 77.631801),),
      );
    });
  }
}
