import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:pharmacy_store/utils/colors.dart';

import '../utils/text.dart';

class DeliverySreen extends StatefulWidget {
  const DeliverySreen({Key? key}) : super(key: key);
  static const GOOGLE_API_KEY = "AIzaSyC1o0VfZq4qsu4VgX8QnuMa89soNsphuDk";

  @override
  State<DeliverySreen> createState() => _DeliverySreenState();
}

class _DeliverySreenState extends State<DeliverySreen> {
  late GoogleMapController mapController;
  Map<String, Marker> _markers = {};
  static const LatLng currentLocation = LatLng(17.9962, -76.8019);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Paints.primaryColor,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          title: TextLG(
            text: "Delivery",
            color: Colors.white,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                height: 300,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: currentLocation,
                    zoom: 12,
                  ),
                  onMapCreated: (controller) {
                    mapController = controller;
                    addMarker("test", currentLocation);
                  },
                  markers: _markers.values.toSet(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
                child: Material(
                  elevation: 0,
                  child: Form(
                      child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
                              child: Text(
                                "Delivery Address",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: "5 NoStreet, AnyCity"),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
                              child: Text(
                                "Contact Person",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: "John Doe"),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 0, 5),
                              child: Text(
                                "Contact Number",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  filled: true,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: "000 - 000 - 0000"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            vertical: 12,
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Paints.secondaryColor),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(999),
                          ))),
                      child: TextLG(
                        text: "Complete Order",
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  addMarker(String id, LatLng location) {
    var marker = Marker(
      markerId: MarkerId(id),
      position: location,
    );
    _markers[id] = marker;
    setState(() {});
  }

  late LatLng location;

  void findLocation(String query) async {
    var addresses = await Geocoder.local.findAddressesFromQuery(query);
    var first = addresses.first;
    location = LatLng(first.coordinates.latitude as double,
        first.coordinates.longitude as double);
    mapController.animateCamera(CameraUpdate.newLatLng(location));
  }
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
