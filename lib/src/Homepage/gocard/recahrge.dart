import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ReCharge extends StatefulWidget {
  ReCharge({Key? key}) : super(key: key);
  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<ReCharge> {
  final _formKey = GlobalKey<FormState>();
  final fcmToken = FirebaseMessaging.instance.getToken();
  var cardExpt = "";
  var Card = "";
  var CVV = "";
  var name = "";
  var amount = "";

  final cardExptController = TextEditingController();
  final CardNumberController = TextEditingController();
  final CVVController = TextEditingController();
  final nameController = TextEditingController();
  final amountController = TextEditingController();
  @override
  void dispose() {
    cardExptController.dispose();
    CardNumberController.dispose();
    CVVController.dispose();
    nameController.dispose();
    amountController.dispose();
    super.dispose();
  }

  clearText() {
    cardExptController.clear();
    CardNumberController.clear();
    CVVController.clear();
    nameController.clear();
    amountController.clear();
  }

  CollectionReference payment =
      FirebaseFirestore.instance.collection('payment');

  Future<void> addUser() {
    return payment
        .add({
          'cardNumber': Card,
          'cardExp': cardExpt,
          'CVV': CVV,
          'name': name,
          'amount': amount,
        })
        .then((value) => print('User Added'))
        .catchError((error) => print('Failed to Add user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 151, 20, 20),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.only(top: 90),
          //margin: const EdgeInsets.only( left:15, right:15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListView(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: 'CardNumber: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    controller: CardNumberController,
                  ),
                ),
                //end

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: 'CardExp: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    controller: cardExptController,
                  ),
                ),
                //end

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: 'Name: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    controller: nameController,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                      autofocus: false,
                      decoration: const InputDecoration(
                        labelText: 'CVV: ',
                        labelStyle: TextStyle(fontSize: 20.0),
                        border: OutlineInputBorder(),
                        errorStyle:
                            TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      controller: CVVController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please Enter CVV';
                        } else {
                          if (val.length < 3) {
                            return "Wrong Number";
                          } else {
                            if (val.length > 3) {
                              return "Wrong Number";
                            }
                          }
                          return null;
                        }
                      }),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: TextFormField(
                    autofocus: false,
                    decoration: const InputDecoration(
                      labelText: 'amount: ',
                      labelStyle: TextStyle(fontSize: 20.0),
                      border: OutlineInputBorder(),
                      errorStyle: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    controller: amountController,
                  ),
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              cardExpt = cardExptController.text;
                              CVV = CVVController.text;
                              name = nameController.text;
                              amount = amountController.text;
                              Card = CardNumberController.text;
                              addUser();
                              clearText();
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 151, 20, 20)),
                        child: const Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'hind',
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => {clearText()},
                        // ignore: sort_child_properties_last
                        child: const Text(
                          'Reset',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'hind',
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 151, 20, 20)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
