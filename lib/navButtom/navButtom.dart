import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:first_app/src/Homepage/homepage.dart';
import 'package:first_app/src/Homepage/landmark/landBuild.dart';
import 'package:first_app/src/side%20menu/profile/profile.dart';
import 'package:flutter/material.dart';

import '../src/side menu/Location/locationControl.dart';

void main() {
  runApp(const navbuttom());
}

class navbuttom extends StatelessWidget {
  const navbuttom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final items = const [
    Icon(
      Icons.home,
      size: 30,
    ),
    Icon(
      Icons.location_city,
      size: 30,
    ),
    Icon(
      Icons.bus_alert,
      size: 30,
    ),
    Icon(
      Icons.person,
      size: 30,
    ),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 151, 20, 20),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: CurvedNavigationBar(
          items: items,
          index: index,
          onTap: (selctedIndex) {
            setState(() {
              index = selctedIndex;
            });
          },
          height: 50,
          backgroundColor: Colors.transparent,
          animationDuration: const Duration(milliseconds: 300),
          // animationCurve: ,
        ),
        body: Container(
            color: Colors.blue,
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: getSelectedWidget(index: index)),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    Widget widget;
    switch (index) {
      case 0:
        widget = homepage();
        break;
      case 1:
        widget = landmark();
        break;
      case 2:
        widget = MyApp();
        break;
      default:
        widget = profile();
        break;
    }
    return widget;
  }
}
