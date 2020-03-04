import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {

  Completer<GoogleMapController> _completer = Completer();

  @observable
  LatLng lastMapPosition = new LatLng(0, 0);

  @observable
  Set<Marker> markers;

  @action
  setMarkers() {
    markers = {sescSiqueiraMarker,
      sescEscolaMarker,
      sescManicureMarker,
      sescComercioMarker,
      sescCentroMarker};
  }

  @action
  setLastMapPosition(LatLng position) {
    lastMapPosition = position;
  }

  onCameraMove(CameraPosition position) {
    setLastMapPosition(position.target);
  }

  @action
  getUserLocation() async {
    await Geolocator().checkGeolocationPermissionStatus(locationPermission: GeolocationPermission.location);
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setLastMapPosition(LatLng(position.latitude, position.longitude));
  }

  navigateToUser() {
    Modular.to.pushNamed("/user/");
  }

  completerGooglemap(GoogleMapController mapController) {
    _completer.complete(mapController);
  }

  Future<void> gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _completer.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
          bearing: 45.0,)));
  }

}

Marker sescSiqueiraMarker = Marker(
  markerId: MarkerId('sesc_siqueira'),
  position: LatLng(-10.914048, -37.070410),
  infoWindow: InfoWindow(title: 'Sesc Siqueira Campos'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker sescEscolaMarker = Marker(
  markerId: MarkerId('sesc_escola'),
  position: LatLng(-10.889904, -37.097160),
  infoWindow: InfoWindow(title: 'Sesc Escola'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker sescManicureMarker = Marker(
  markerId: MarkerId('sesc_manicure'),
  position: LatLng(-10.934929, -37.081682),
  infoWindow: InfoWindow(title: 'Sesc Manicure'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

//New York Marker

Marker sescComercioMarker = Marker(
  markerId: MarkerId('sesc_comercio'),
  position: LatLng(-10.906827, -37.048373),
  infoWindow: InfoWindow(title: 'Sesc Comércio'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker sescCentroMarker = Marker(
  markerId: MarkerId('sesc_centro'),
  position: LatLng(-10.9202827, -37.0508537),
  infoWindow: InfoWindow(title: 'Sesc Centro'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
