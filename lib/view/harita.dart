import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<Marker> _markers = [];
  late GoogleMapController mapController;
  final LatLng _center = LatLng(40.3359984, 27.9357329);  // Default location

  void _showCalendar(BuildContext context) {
    showModalBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      barrierColor: Colors.grey,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return
          ListView(
            scrollDirection: Axis.vertical,

            children:[
              Text(
                "Konferans Saatleri",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Card(
                  color: Colors.blueGrey,
                  margin: EdgeInsets.all(5),
                  elevation: 1,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20, right: 100),
                      child: Text("Konferans Konusu"),
                    ),
                    Text("28 Ocak 12.30"),
                  ],),

                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Card(
                  color: Colors.blueGrey,
                  margin: EdgeInsets.all(5),
                  elevation: 1,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20, right: 100),
                      child: Text("Konferans Konusu"),
                    ),
                    Text("28 Ocak 12.30"),
                  ],),

                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Card(
                  color: Colors.blueGrey,
                  margin: EdgeInsets.all(5),
                  elevation: 1,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20, right: 100),
                      child: Text("Konferans Konusu"),
                    ),
                    Text("28 Ocak 12.30"),
                  ],),

                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                child: Card(
                  color: Colors.blueGrey,
                  margin: EdgeInsets.all(5),
                  elevation: 1,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20, right: 100),
                      child: Text("Konferans Konusu"),
                    ),
                    Text("28 Ocak 12.30"),
                  ],),

                ),
              ),

            ],
          );
      },
    );
  }


  _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.addAll([
        Marker(
          markerId: MarkerId("coffy"),
          position: LatLng(40.3356675, 27.93547077),
          infoWindow: InfoWindow(
            title: "coffy",
            snippet: "coffy",

            onTap: () {
              print("coffy");
            },
          ),
        ),
        Marker(
          markerId: MarkerId("merkezyerleske"),
          position: LatLng(40.3374232, 27.9356059),  // Second marker location
          infoWindow: InfoWindow(
            title: "BANÜ",
            snippet: "Merkez Yerleşke",
          ),
        ),
        Marker(
          markerId: MarkerId("saglik"),
          position: LatLng(40.3354898, 27.9367713),  // Second marker location
          infoWindow: InfoWindow(
            title: "Sağlık Bilimleri Fakültesi ",

          ),
        ),
        Marker(
          markerId: MarkerId("spor"),
          position: LatLng(40.3327912, 27.9401170),  // Second marker location
          infoWindow: InfoWindow(
            title: "Spor Bilimleri Fakültesi ",

          ),
        ),
        Marker(
          markerId: MarkerId("muhendislik"),
          position: LatLng(40.3366026, 27.9344364),  // Second marker location
          infoWindow: InfoWindow(
            title: "Mühendislik ve Doğa Bilimleri Fakültesi ",

          ),
        ),
        Marker(
          markerId: MarkerId("konferans1"),
          position: LatLng(40.3367472, 27.9360471),
          infoWindow: InfoWindow(
            title: "Fuat Sezgin Konferans Salonu",
          ),
          onTap: () {
            mapController.showMarkerInfoWindow(MarkerId("konferans1")); // InfoWindow'u aç
            Future.delayed(Duration(milliseconds: 500), () {
              _showCalendar(context); // Kısa bir gecikmeden sonra açılır
            });
          },
        ),
        Marker(
          markerId: MarkerId("denizcilik"),
          position: LatLng(40.3367810, 27.9364186),
          infoWindow: InfoWindow(
            title: "Denizcilik Fakültesi",
          ),
        ),

        Marker(
          markerId: MarkerId("ogryemekhane"),
          position: LatLng(40.3354737, 27.9354537),  // Second marker location
          infoWindow: InfoWindow(
            title: "Öğrenci Yemekhanesi",
          ),
        ),
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onTap: (latLng) {

          print(latLng);
        },
        onLongPress: (latLng) {

          print(latLng);
        },

        markers: Set<Marker>.of(_markers),
        liteModeEnabled: false,
        mapType: MapType.normal,
        buildingsEnabled: true,
        minMaxZoomPreference: MinMaxZoomPreference(16, 19),
        initialCameraPosition: CameraPosition(target: _center, zoom: 14, bearing: 180),
        onMapCreated: _onMapCreated,
      ),
    );
  }
}

