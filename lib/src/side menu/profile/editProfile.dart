import 'package:first_app/src/Homepage/user_model2.dart';
import 'package:first_app/src/register/login_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/user_model.dart';

import 'firestore_helper.dart';

class editProfile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
   final UserModel user;
  const editProfile({Key? key, required this.user}) : super(key: key);
}

class _ProfileState extends State<editProfile> {
  _ProfileState();
  TextEditingController? _firstNameController;
  TextEditingController? _mobileNumController;
  TextEditingController? _secondNameController;
   TextEditingController? _emailController;
      TextEditingController? _cprController;



  @override
  void initState() {
    _firstNameController = TextEditingController(text: widget.user.firstName);
    _mobileNumController = TextEditingController(text: widget.user.mobileNumber);
     _secondNameController = TextEditingController(text: widget.user.secondName);
      _emailController = TextEditingController(text: widget.user.email);
       _cprController = TextEditingController(text: widget.user.cpr);
    super.initState();
  }

  @override
  void dispose() {
    _firstNameController!.dispose();
    _mobileNumController!.dispose();
    _secondNameController!.dispose();
    _emailController!.dispose();
     _cprController!.dispose();
    super.dispose();
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 161, 13, 13),
      body: Column(
        children: <Widget>[
          Container(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(12),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 80,
                      ),
                      const Text(
                        "Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      TextFormField(
                        controller:_firstNameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "First name",
                          enabled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(20),
                          ),
                        ),
                      ),
                            const SizedBox(
                        height: 10,
                      ),
                 
                      TextFormField(
                        controller:_secondNameController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "last name",
                          enabled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller:_cprController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "CPR",
                          enabled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: new BorderSide(color: Colors.white),
                            borderRadius: new BorderRadius.circular(20),
                          ),
                        ),
                        onChanged: (value) {},
                        //keyboardType: TextInputType.emailAddress,
                      ),
                       const SizedBox(
                        height: 20,
                      ),
                     
                      TextFormField(
                        controller:_mobileNumController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Mobile Number',
                          enabled: true,
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 15.0),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MaterialButton(
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            elevation: 5.0,
                            height: 40,
                            onPressed: () {
                           FirestoreHelper.update(UserModel2(uid: widget.user.uid, firstName: _firstNameController!.text, secondName: _secondNameController!.text, mobileNumber: _mobileNumController!.text,cpr: _cprController!.text, email: _emailController!.text)).then((value) {
                            Navigator.pop(context);});
                            },
                            
                            // ignore: sort_child_properties_last
                            child: const Text(
                              "save",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
