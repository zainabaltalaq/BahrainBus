import 'package:flutter/material.dart';
import 'package:first_app/src/register/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/user_model.dart';

class paymentpage extends StatefulWidget {
  paymentpage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<paymentpage> {
  String? errorMessage;

  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final nameController = new TextEditingController();
  final amountController = new TextEditingController();

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

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  int selectedTab = 0;

  Widget emailField() {
    return TextFormField(
      //obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
        labelText: "Card Number",
        hintText: 'xxxx xxxx xxxx xxxx',
      ),
    );
  }

  Widget Exp_Date() {
    return TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
        labelText: "Exp Date",
        hintText: "MM/YY",
      ),
    );
  }

  Widget name() {
    return TextFormField(
      controller: nameController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
        labelText: "Name",
        hintText: "Name of the card holder",
      ),
    );
  }

  Widget CVV() {
    return TextFormField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
        labelText: "CVV",
        hintText: "XXXX",
      ),
    );
  }

  Widget amount() {
    return TextFormField(
      controller: amountController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 0, 0, 10.0),
        labelText: "Amount",
        hintText: "XXXX",
      ),
    );
  }

  final text1 = Text("");

  Widget nextButon() {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(15.0),
      color: const Color.fromARGB(255, 151, 20, 20),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text(
          "Pay",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: 240.0,
              color: const Color.fromARGB(255, 151, 20, 20),
            ),
            Column(
              children: <Widget>[
                AppBar(
                  elevation: 0,
                  centerTitle: true,
                  title: GestureDetector(
                    child: const Text('PAYMENT'),
                    onTap: () {
                      print("tapped subtitle");
                    },
                  ),
                  backgroundColor: const Color.fromARGB(255, 151, 20, 20),
                ),
                SizedBox(
                  height: 20,
                ),
                TabBar(
                  labelStyle: Theme.of(context).textTheme.bodyText1,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2, color: Colors.white),
                    insets: EdgeInsets.symmetric(
                      horizontal: 0,
                    ),
                  ),
                  onTap: (int position) {
                    setState(() {
                      selectedTab = position;
                    });
                  },
                  tabs: [
                    Tab(
                      child: new Text(
                        "Payment",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.apply(color: Colors.white),
                      ),
                    ),
                    Tab(
                      child: new Text(
                        "History",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.apply(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                selectedTab == 0 ? creditCard() : debitCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget creditCard() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 15.0),
                    emailField(),
                    SizedBox(height: 15.0),
                    Exp_Date(),
                    SizedBox(height: 15.0),
                    name(),
                    SizedBox(height: 15.0),
                    CVV(),
                    SizedBox(height: 15.0),
                    amount(),
                    SizedBox(height: 15.0),
                    nextButon(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget debitCard() {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(40),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 254, 254),
                        ),
                        child: ListTile(
                          title: const Text("Bahrain Bus"),
                          subtitle:
                              const Text("Amount: -2:00BD"),
                       
                          enabled: true,
                        ),
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                       const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
                      Container(
                        margin: EdgeInsets.only(top:30),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 255, 254, 254),
                        ),
                        child: ListTile(
                          title: const Text("Bahrain Bus"),
                          subtitle:
                              const Text("Amount: -3:00BD"),
                         
                          enabled: true,
                        ),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
