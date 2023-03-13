import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'map_markers.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
void main() {
  runApp( MyHomePage());
}
class MyHomePage extends StatefulWidget {
//  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  // late BitmapDescriptor customIcon;
  // late Set<Marker> markers;
  final LatLng _location = const LatLng(30.0151010, 31.287760);
  late GoogleMapController mapController;
  // void initState() {
  //   super.initState();
  //   markers = Set.from([]);
  // }
  // createMarker(context) {
  //   if (customIcon == null) {
  //     ImageConfiguration configuration = createLocalImageConfiguration(context);
  //     BitmapDescriptor.fromAssetImage(configuration, 'assets/download.png')
  //         .then((icon) {
  //       setState(() {
  //         customIcon = icon;
  //       });
  //     });
  //   }
  // }
  void _myMaCreated (GoogleMapController controller){
    mapController = controller;
  }
  void getCurrentLocation()async{
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    final CameraPosition MyLocation = CameraPosition(target: LatLng(30.02733965973503, 31.491854443509148),
        bearing: 45.0,
        tilt: 50.0,
        zoom: 20.0);
    setState(() async {
      final GoogleMapController controller = await mapController;
      controller.animateCamera(CameraUpdate.newCameraPosition(MyLocation));
    });
  }
  void getCurrentLocation1()async{
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high
    );
    final CameraPosition MyLocation = CameraPosition(target: LatLng(position.latitude,position.longitude),
        bearing: 45.0,
        tilt: 50.0,
        zoom: 20.0);
    setState(() async {
      final GoogleMapController controller = await mapController;
      controller.animateCamera(CameraUpdate.newCameraPosition(MyLocation));
    });
  }
  @override

  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
            onPressed: ()=> Navigator.pop(context),
          ),
          backgroundColor:Color(0xff8d0000) ,
          centerTitle: true,
          title: Text ('ATM/Branch locators'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(25),
            ),
          ),
        ),
        body: GoogleMap(
          mapType: MapType.normal,
          onMapCreated:_myMaCreated ,
          initialCameraPosition: CameraPosition(
              target: _location ,bearing: 45.0,tilt: 10 , zoom: 18),
          // markers: markers,
          // onTap: (pos){
          //   print(pos);
          //   Marker m=Marker(
          //       markerId:MarkerId("ATM"),
          //       position: const LatLng(29.980088,31.132545),
          //       infoWindow: InfoWindow(title: "Main ATM"),
          //       icon: customIcon
          //
          //   );
          //       setState(() {
          //      markers.add(m);
          //       });
          //       },
          markers: {
            myHomeMarker,
            myHomeMarker1,
            myHomeMarker2,
            myHomeMarker3,
            myHomeMarker4,
            myHomeMarker5,
            myHomeMarker6,
            myHomeMarker7,
            myHomeMarker8,
            myHomeMarker9,
            myHomeMarker11,
            myHomeMarker12,
            myHomeMarker13,
            myHomeMarker14,
            myHomeMarker15,
            myHomeMarker16,
            myHomeMarker17,
            myHomeMarker18,
          },
        ),
        floatingActionButton: FloatingActionButton.extended(onPressed: getCurrentLocation, label: Icon(Icons.gps_fixed)),
      ),

    );
  }
}



