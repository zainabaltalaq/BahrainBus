import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  @override
  State<Map> createState() => MapState();
}

class MapState extends State<Map> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(26.201000, 50.606998);

  final Set<Marker> _markers = {};

  LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('1'),
        position: LatLng(26.04685, 50.488583),
        infoWindow: InfoWindow(title: 'Jaza air Beach Avenue-2/Zallaq')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('2'),
        position: LatLng(26.05765, 50.505967),
        infoWindow: InfoWindow(title: 'University of Bahrain-1/Sakhir')));

    super.initState();
    // ignore: prefer_const_constructors
    _markers.add(Marker(
        markerId: const MarkerId('3'),
        position: const LatLng(26.056805, 50.509186),
        infoWindow: const InfoWindow(title: 'Bahrain University Main Gate/2')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('4'),
        position: LatLng(26.06055, 50.508417),
        infoWindow: InfoWindow(title: 'Nuzha-8/Hamad Town Gate ')));

    super.initState();
    // ignore: prefer_const_constructors
    _markers.add(Marker(
        markerId: const MarkerId('5'),
        position: const LatLng(26.075217, 50.507317),
        infoWindow: const InfoWindow(title: 'Nuzha-2/Roundabout 18')));

    super.initState();
    // ignore: prefer_const_constructors
    _markers.add(Marker(
        markerId: const MarkerId('6'),
        position: const LatLng(26.080917, 50.506767),
        infoWindow: const InfoWindow(title: 'Nuzha-4/Roundabout 20 ')));

    super.initState();
    // ignore: prefer_const_constructors
    _markers.add(Marker(
        markerId: const MarkerId('7'),
        position: const LatLng(26.084939, 50.491849),
        infoWindow: const InfoWindow(title: 'Zaid Bin Omaira HWY-8/Sadad')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('8'),
        position: LatLng(26.090717, 50.489583),
        infoWindow: InfoWindow(title: 'Reef Mall-4/Sadad')));

    super.initState();
    // ignore: prefer_const_constructors
    _markers.add(Marker(
        markerId: const MarkerId('9'),
        position: const LatLng(26.101783, 50.4842),
        infoWindow: const InfoWindow(title: 'Malkiya Club-2')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('10'),
        position: LatLng(26.109717, 50.482617),
        infoWindow: InfoWindow(
            title:
                'Kuwait Health Centre2/Karzakan Kuwait Health Centre2/Karzak')));

    super.initState();
    // ignore: prefer_const_constructors
    _markers.add(Marker(
        markerId: const MarkerId('11'),
        position: const LatLng(26.12125, 50.47765),
        infoWindow: const InfoWindow(title: 'Zaid Bin Omaira HWY12/Dumistan')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('12'),
        position: LatLng(26.131767, 50.476849),
        infoWindow: InfoWindow(title: 'Hamala Beach')));

    _markers.add(const Marker(
        markerId: MarkerId('14'),
        position: LatLng(26.124354, 50.477454),
        infoWindow: InfoWindow(title: 'Zaid Bin Omaira HWY5/Dumistan')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('15'),
        position: LatLng(26.133453, 50.481243),
        infoWindow: InfoWindow(title: 'Zaid Bin Omaira HWY-7/Hamalah')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('16'),
        position: LatLng(26.212169, 50.45084),
        infoWindow: InfoWindow(title: 'Budaiya Market')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('17'),
        position: LatLng(26.213317, 50.45215),
        infoWindow: InfoWindow(title: 'Budaiya Highway-1/Budaiya')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('18'),
        position: LatLng(26.211233, 50.456383),
        infoWindow: InfoWindow(title: 'Budaiya Post Office')));
    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('19'),
        position: LatLng(26.210626, 50.456283),
        infoWindow: InfoWindow(title: 'Janabiya Highway-1/Budaiya')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('20'),
        position: LatLng(26.205517, 50.458267),
        infoWindow: InfoWindow(title: 'Janabiya Highway-3/Bani Jamrah')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('21'),
        position: LatLng(26.202817, 50.459233),
        infoWindow: InfoWindow(title: 'Janabiya Highway-5/AlQaryah')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('22'),
        position: LatLng(26.195917, 50.461767),
        infoWindow: InfoWindow(title: 'Janabiya Highway-7')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('23'),
        position: LatLng(26.193577, 50.479993),
        infoWindow: InfoWindow(title: 'University College of Bahrain-1')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('24'),
        position: LatLng(26.183475, 50.471822),
        infoWindow: InfoWindow(title: 'Avenue 77-1')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('25'),
        position: LatLng(26.178335, 50.465789),
        infoWindow: InfoWindow(title: 'Janabiya Highway-12')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('26'),
        position: LatLng(26.177752, 50.465517),
        infoWindow: InfoWindow(title: 'Janabiya Highway-8')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('27'),
        position: LatLng(26.168636, 50.456685),
        infoWindow: InfoWindow(title: 'Mazarea Highway-3/Jasrah')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('28'),
        position: LatLng(26.1659, 50.452467),
        infoWindow: InfoWindow(title: 'Mazare a Highway-11')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('29'),
        position: LatLng(26.164233, 50.45119),
        infoWindow: InfoWindow(title: 'Mazare a Highway-12')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('30'),
        position: LatLng(26.159855, 50.451382),
        infoWindow: InfoWindow(title: 'Mazare a Highway-5/Jasrah')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('31'),
        position: LatLng(26.159855, 50.451382),
        infoWindow: InfoWindow(title: 'Mazare a Highway-5/Jasrah')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('32'),
        position: LatLng(26.143283, 50.457933),
        infoWindow: InfoWindow(title: 'Mazare a Highway-1/Hamalah')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('33'),
        position: LatLng(26.173534, 50.547817),
        infoWindow: InfoWindow(title: 'Isa Town PID Stop')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('34'),
        position: LatLng(26.16978, 50.549849),
        infoWindow: InfoWindow(title: 'AlQuds Avenue-1/Isa Town')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('35'),
        position: LatLng(26.16875, 50.55445),
        infoWindow: InfoWindow(title: 'Traditional Market-2/Isa Town')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('36'),
        position: LatLng(26.16725, 50.559633),
        infoWindow: InfoWindow(title: 'AlQuds Avenue-11/Isa Town')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('37'),
        position: LatLng(26.166867, 50.560617),
        infoWindow: InfoWindow(title: 'AlQuds Avenue-2/Isa Town')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('38'),
        position: LatLng(26.163289, 50.558337),
        infoWindow: InfoWindow(title: 'Esteglal Highway-8/Isa Town')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('39'),
        position: LatLng(26.1641, 50.551717),
        infoWindow: InfoWindow(title: 'Ministry of Education-3')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('40'),
        position: LatLng(26.159496, 50.555097),
        infoWindow: InfoWindow(title: 'Isa Town Bus Depot-1')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('41'),
        position: LatLng(26.161767, 50.553517),
        infoWindow: InfoWindow(title: 'Information Affairs Authority')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('42'),
        position: LatLng(26.161917, 50.54995),
        infoWindow: InfoWindow(title: 'Educational Area - 1')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('43'),
        position: LatLng(26.163998, 50.546377),
        infoWindow: InfoWindow(title: 'University of Bahrain - Isa Town')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('44'),
        position: LatLng(26.160684, 50.545279),
        infoWindow: InfoWindow(title: 'Sh. Abdulla School-2')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('45'),
        position: LatLng(26.133453, 50.540535),
        infoWindow: InfoWindow(title: '16 December HWY-1')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('46'),
        position: LatLng(26.156965, 50.53891),
        infoWindow: InfoWindow(title: 'Directorate of Traffic-1')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('47'),
        position: LatLng(26.15866, 50.529108),
        infoWindow: InfoWindow(title: 'Driver Training Center -2')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('48'),
        position: LatLng(26.155117, 50.525767),
        infoWindow: InfoWindow(title: 'Philippine School-1/Aali')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('49'),
        position: LatLng(26.133453, 50.481243),
        infoWindow: InfoWindow(title: 'Avenue 34-3/Aali')));

    super.initState();
    _markers.add(const Marker(
        markerId: MarkerId('50'),
        position: LatLng(26.152083, 26.152083),
        infoWindow: InfoWindow(title: 'Avenue 34-1/A ali')));
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          //title: Text('Maps Sample App'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
              mapType: _currentMapType,
              markers: _markers,
              onCameraMove: _onCameraMove,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.topRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
