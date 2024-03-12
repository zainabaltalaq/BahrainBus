import 'package:flutter/material.dart';

void main() {
  runApp(const fares());
}

class fares extends StatelessWidget {
  const fares({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // Hide the debug banner
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                          "Bus Fares",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
              
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                 color: Color.fromARGB(255, 255, 254, 254),
                ),
                child: ListTile(
                  title: const Text("SINGLE TRIP"),
                  subtitle: const Text("BY PAPER TICKETS"),
                  trailing: const Text("300FILS"),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 255, 141, 141),
                    child: Image.asset(
                      "images/icons/money.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  enabled: true,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 1, bottom: 1),
                margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
                decoration: const BoxDecoration(
                  //borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(212, 212, 203, 203),
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
                  title: const Text("SINGLE TRIP"),
                  subtitle: const Text("BY GOCARD"),
                  trailing: const Text("275FILS"),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 255, 141, 141),
                    child: Image.asset(
                      "images/icons/money.png",
                      height: 30,
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
                  title: const Text("DAILY CAP"),
                  subtitle: const Text(" BY GOCARD"),
                  trailing: const Text("700FILS"),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 255, 141, 141),
                    child: Image.asset(
                      "images/icons/money.png",
                      height: 30,
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
                  title: const Text("GO WEEKLY"),
                  subtitle: const Text(" BY GOCARD"),
                  trailing: const Text("3 BHD"),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 255, 141, 141),
                    child: Image.asset(
                      "images/icons/money.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
                  enabled: true,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                margin: const EdgeInsets.only(top: 20, left: 15, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 255, 254, 254),
                ),
                child: ListTile(
                  title: const Text("GO MONTHLY"),
                  subtitle: const Text(" BY GOCARD"),
                  trailing: const Text("12 BHD"),
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: const Color.fromARGB(255, 255, 141, 141),
                    child: Image.asset(
                      "images/icons/money.png",
                      height: 30,
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
