import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:first_app/src/Homepage/imgs.dart';
import 'package:first_app/src/Homepage/timeTable.dart';
import 'package:first_app/src/Homepage/track/search.dart';
import 'package:first_app/src/register/login_screen.dart';
import 'package:flutter/material.dart';
import '../fees/fares.dart';
import '../side menu/naviigation_drawer.dart';
import '../Homepage/track/trackingStation.dart';
import 'gocard/CreditCardWidget.dart';
import 'landmark/landBuild.dart';
import 'transaction_buttton.dart';

class homepage extends StatelessWidget {
  final fcmToken = FirebaseMessaging.instance.getToken();
  var fbm = FirebaseMessaging.instance;

  @override
  Widget build(BuildContext context) {
    final screens = [homepage(), LoginScreen()];
    // ignore: unnecessary_new
    Widget imageCarousel = new SizedBox(
      height: 350,
    );

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 151, 20, 20),
        extendBodyBehindAppBar: true,
        drawer: navi(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(children: <Widget>[
          //image carousel begins here
          imageCarousel,

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(top: 375, right: 5, left: 5),
            child: Row(children: [
              const Padding(padding: EdgeInsets.only(right: 20)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color.fromARGB(255, 205, 192, 192),
                  foregroundColor: Colors.black, // foreground (text) color
                ),
                // ignore: avoid_print
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => paymentpage(
                          title: '',
                        ),
                      ));
                },
                child: const Icon(
                  Icons.payment,
                  size: 30,
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color.fromARGB(255, 205, 192, 192),
                  foregroundColor: Colors.black, // foreground (text) color
                ),
                // ignore: avoid_print
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const fares(),
                      ));
                },
                child: const Icon(
                  Icons.money,
                  size: 30,
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color.fromARGB(255, 205, 192, 192),
                  foregroundColor: Colors.black, // foreground (text) color
                ),
                // ignore: avoid_print
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => search(),
                      ));
                },
                child: const Icon(
                  Icons.route,
                  size: 30,
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  backgroundColor: const Color.fromARGB(255, 205, 192, 192),
                  foregroundColor: Colors.black, // foreground (text) color
                ),
                // ignore: avoid_print
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Map(),
                      ));
                },
                child: const Icon(
                  Icons.location_pin,
                  size: 30,
                ),
              ),
            ]),
          ),
          Container(
            padding: const EdgeInsets.only(
                top: 480, bottom: 40, right: 10, left: 10),
            child: MyHorizontalSample1(),
          )
        ]),
      ),
    );
  }
}
