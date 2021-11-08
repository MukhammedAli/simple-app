import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const LatLng sduPos = LatLng(43.2075941, 76.6681012);
  static const LatLng homePos = LatLng(43.2016319, 76.658986);

  static const _initialCameraPosition = CameraPosition(
    target: sduPos,
    zoom: 12.5,
  );

  late GoogleMapController _googleMapController;

  Marker _sdu = Marker (
    markerId: const MarkerId("sdu"),
    position: sduPos,
    infoWindow: const InfoWindow(title: "SDU University") ,
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  );

  Marker _home = const Marker (
    markerId: MarkerId("home"),
    position: homePos,
    infoWindow: InfoWindow(title: "HOME") ,
    icon: BitmapDescriptor.defaultMarker,
  );

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Google Maps'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: true,
            zoomControlsEnabled: true,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            markers: {
              _sdu,
              _home,
            },

          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () => _googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );

  }
}
