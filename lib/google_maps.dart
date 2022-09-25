import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({super.key});
  static String path = "/googleMaps";

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  Set<Marker> myMarkers = {};

  setMarker(LatLng coords) {
    myMarkers.add(
      Marker(
        markerId: MarkerId(DateTime.now().toString()),
        position: coords,
      ),
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps"),
      ),
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: const CameraPosition(
          target: LatLng(
            28.21863304334698,
            83.98951241531432,
          ),
          zoom: 17,
        ),
        onMapCreated: (mapController) {},
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        markers: myMarkers,
        onTap: (latlng) {
          setMarker(latlng);
        },
        circles: {
          Circle(
            circleId: const CircleId('corona'),
            radius: 50,
            strokeColor: Colors.orange,
            strokeWidth: 5,
            fillColor: Colors.orange.withOpacity(0.5),
            center: const LatLng(28.218101132781868, 83.99026580559115),
          ),
        },
        // polygons: ,

        polylines: {
          Polyline(
            polylineId: const PolylineId("aarambha"),
            color: Colors.blue.shade700,
            points: const [
              LatLng(28.218211373712222, 83.98885060624046),
              LatLng(28.21871474994037, 83.9894744080721),
              LatLng(28.21882757532203, 83.9896237922174),
              LatLng(28.218704624581417, 83.98991927729331),
              LatLng(28.218548404612623, 83.99050368111006),
            ],
          ),
        },
      ),
    );
  }
}
