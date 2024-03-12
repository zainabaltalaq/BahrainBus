import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/src/Homepage/homepage.dart';
import 'package:first_app/src/register/login_screen.dart';
import 'package:first_app/src/side%20menu/Location/locationControl.dart';
import 'package:first_app/src/side%20menu/busnotify/busnotify.dart';
import 'package:first_app/src/side%20menu/faq/faq.dart';
import 'package:first_app/src/side%20menu/transiction/history.dart';
import 'package:flutter/material.dart';
import 'package:first_app/src/side menu/drawer_item.dart';
import '../../user_model.dart';
import '../Homepage/timeTable.dart';
import 'logout/logout.dart';
import 'package:url_launcher/url_launcher.dart';

class navi extends StatefulWidget {
  const navi({Key? key}) : super(key: key);

  @override
  _naviState createState() => _naviState();
}

class _naviState extends State<navi> {
   User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 151, 20, 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
          child: Column(
            children: [
              Text("Welcome back: ${loggedInUser.firstName} ${loggedInUser.secondName}",
                
                style: const TextStyle(fontStyle: FontStyle.italic, fontSize: 22, fontFamily:'hind', color:Colors.white)),
          
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 40,
              ),
              DrawerItem(
                name: 'Bus timeTable',
                icon: Icons.bus_alert,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Bus Notification',
                  icon: Icons.notifications,
                  onPressed: () => onItemPressed(context, index: 1)),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'Send Email',
                  icon: Icons.email,
                  onPressed: () {
                    launch(
                        'mailto:BahrainBus.22@gmail.com?subject=This is Subject Title&body=This is Body of Email');
                  }),
              const SizedBox(
                height: 30,
              ),
              DrawerItem(
                  name: 'FAQ',
                  icon: Icons.question_mark,
                  onPressed: () => onItemPressed(context, index: 2)),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 30,
              ),
              
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: () => logout(context)),
            ],
          ),
        ),
      ),
      
    );
    
  }
    Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }


  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);
    switch (index) {
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const timeTable()));
        break;
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => busNotify()));
        break;
      case 2:
        Navigator.push(context, MaterialPageRoute(builder: (context) => const faq()));
        break;
    
    }
  }

  Widget headerWidget() {
    return Row(
      children: [
        const Padding(padding: EdgeInsets.all(20)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Person name',
                style: TextStyle(fontSize: 14, color: Colors.white)),
            SizedBox(
              height: 10,
            ),
            Text('person@email.com',
                style: TextStyle(fontSize: 14, color: Colors.white))
          ],
        )
      ],
    );
  }
}
