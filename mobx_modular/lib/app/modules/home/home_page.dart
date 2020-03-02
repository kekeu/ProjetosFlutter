import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx_modular/app/shared/utils/constants.dart';
import 'package:permission_handler/permission_handler.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  Completer<GoogleMapController> _completer = Completer();

  @override
  void initState() {
    super.initState();
    PermissionHandler().checkPermissionStatus(
        PermissionGroup.locationWhenInUse).then(_updateStatus);
  }

  void _updateStatus(PermissionStatus status) {
    if (status != PermissionStatus.granted) {
      PermissionHandler().requestPermissions(
          [PermissionGroup.locationWhenInUse]).then(_onStatusRequested);
    }
  }

  void _onStatusRequested(Map<PermissionGroup, PermissionStatus> statuses) {
    final status = statuses[PermissionGroup.locationWhenInUse];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicial'),
        actions: <Widget>[
          // botoes de acções
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {
              controller.navigateToUser();
            },
          ),
        ],
      ),
      body: Container(
        decoration: MyBoxDecoration(),
        child: Stack(
          children: <Widget>[
            _buildGoogleMap(context),
            _buildContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(
            target: LatLng(-10.926103, -37.055920), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _completer.complete(controller);
        },
        markers: {
          sescSiqueiraMarker,
          sescEscolaMarker,
          sescManicureMarker,
          sescComercioMarker,
          sescCentroMarker
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat,double long) async {
    final GoogleMapController controller = await _completer.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }

  Widget myDetailsContainer1(String restaurantName) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
                style: TextStyle(
                    color: Color(0xff6200ee),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      "4.1",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStar,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    FontAwesomeIcons.solidStarHalf,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                    child: Text(
                      "(946)",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
              ],
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "American \u00B7 \u0024\u0024 \u00B7 1.6 mi",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "Closed \u00B7 Opens 17:00 Thu",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh6.googleusercontent.com/proxy/SfL3V2oa2A1H2JY8C1ZCq4goA1waOMDP198-hotaRa2lf3aI5q0mVZBLo7R2wRQ05uC1F3JzVva7KzBTHdpdkTA28PhGIbLHRobU3zEUoRKTPdURiZBQe5j6lqJlLQYw7HC5mY2YgpLGTfozjTWCLQQ_Q-A=w408-h306-k-no",
                  -10.914048, -37.070410, "Sesc Siqueira Campos"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://geo2.ggpht.com/cbk?panoid=2SkPQp3shnnoUPs3hrNSSw&output=thumbnail&cb_client=search.gws-prod.gps&thumb=2&w=408&h=240&yaw=254.04567&pitch=0&thumbfov=100",
                  -10.889904, -37.097160,"Sesc Escola"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://geo1.ggpht.com/cbk?panoid=IYv15oU87aAk50YrQodnjw&output=thumbnail&cb_client=search.gws-prod.gps&thumb=2&w=408&h=240&yaw=229.58324&pitch=0&thumbfov=100",
                  -10.934929, -37.081682,"Sesc Manicure"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipMx1EY46H9WweDwcqCIwOgZJ1mPa0yvBCEG2D-l=w408-h544-k-no",
                  -10.906827, -37.048373, "Sesc Comércio"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://lh5.googleusercontent.com/p/AF1QipOu0J2sRptvGn7YCG2Hcm_Tk8NWs1S1Uwdbp8lC=w408-h306-k-no",
                  -10.9202827, -37.0508537, "Sesc Centro"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
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
