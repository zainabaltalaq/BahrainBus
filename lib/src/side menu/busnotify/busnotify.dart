import 'package:flutter/material.dart';
void main() => runApp(busNotify());

class busNotify extends StatefulWidget {
  @override
  State<busNotify> createState() => busNotifyState();
}

class busNotifyState extends State<busNotify> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: const Color.fromARGB(255, 161, 13, 13),
      body: SafeArea(
        child: ListView(scrollDirection: Axis.vertical, children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const  Text(
                          "Bus Notification",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
              Container(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
                
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 254, 254),
                ),
                child: ListTile(
                  title: const Text("Bahrain Bus"),
                  subtitle: const Text("Dont forget to come back!"),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color.fromARGB(255, 135, 35, 35),
                    child: Image.asset(
                      "images/notification.png",
                      height: 50,
                      width: 30,
                    ),
                  ),
                  enabled: true,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 254, 254),
                ),
                child: ListTile(
                  title: const Text("Bahrain Bus"),
                  subtitle: const Text("We open new route check it fast!!"),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color.fromARGB(255, 135, 35, 35),
                    child: Image.asset(
                      "images/notification.png",
                      height: 50,
                      width: 30,
                    ),
                  ),
                  enabled: true,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 254, 254),
                ),
                child: ListTile(
                  title: const Text("Bahrain Bus"),
                  subtitle: const Text("We have amazing offers to you!!!"),
                 leading: CircleAvatar(
                    radius: 25,
                 backgroundColor: Color.fromARGB(255, 135, 35, 35),
                    child: Image.asset(
                      "images/notification.png",
                      height: 50,
                      width: 30,
                    ),
                  ),
                  enabled: true,
                ),
                ),
              
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 254, 254),
                ),
                child: ListTile(
                  title: const Text("Bahrain Bus"),
                  subtitle: const Text("Dont miss whats new in landmarks"),
                   leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color.fromARGB(255, 135, 35, 35),
                    child: Image.asset(
                      "images/notification.png",
                      height: 50,
                      width: 30,
                    ),
                  ),
                  enabled: true,
                
                ),
              ),
              
                  
                
              
            ],
          ),
        ]),
      ),
    );
  }
}