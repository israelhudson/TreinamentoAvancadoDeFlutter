import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas_aula/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  CameraPosition cameraPosition = CameraPosition(
    target: LatLng(-3.764516106287028, -38.480339058953135),
    zoom: 16,
  );

  _loadMarkers() {
    Set<Marker> _markersLocal = {};

    Marker markerCentroEventos = Marker(
        markerId: const MarkerId("centro-de-eventos"),
        position: const LatLng(-3.764516106287028, -38.480339058953135),
        infoWindow: const InfoWindow(title: "Centro de Eventos do CE - SANA"),
        onTap: () {
          debugPrint("lead CEntro clicado");
        },
        consumeTapEvents: true);

    Marker markerUnifor = Marker(
        markerId: const MarkerId("unifor"),
        infoWindow: const InfoWindow(title: "Faculdade da EMA"),
        position: const LatLng(-3.768675494430822, -38.47815763311336),
        onTap: () {
          debugPrint("lead EMA clicado");
        },
        consumeTapEvents: true);

    _markersLocal.add(markerCentroEventos);
    _markersLocal.add(markerUnifor);

    setState(() {
      _markers = _markersLocal;
    });
  }

  addListenerLocation() {
    var locationsSettings = const LocationSettings(
        accuracy: LocationAccuracy.high, distanceFilter: 10);

    Geolocator.getPositionStream(locationSettings: locationsSettings)
        .listen((Position position) {
      debugPrint("lead ${position}");

      setState(() {
        cameraPosition = CameraPosition(
            zoom: 16, target: LatLng(position.longitude, position.longitude));

        //_goToTheLake();
      });
    });
  }

  getLocationUser() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      cameraPosition = CameraPosition(
          zoom: 16, target: LatLng(position.longitude, position.longitude));

      //_goToTheLake();
    });
  }

  @override
  void initState() {
    super.initState();
    if (defaultTargetPlatform == TargetPlatform.android) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    _loadMarkers();
    getLocationUser();
    addListenerLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: cameraPosition,
        markers: _markers,
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }
}
