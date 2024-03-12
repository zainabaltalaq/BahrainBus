
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel2 {
   String? uid;
  String? email;
  String? firstName;
  String? secondName;
  String? cpr;
  String? mobileNumber;

  UserModel2({this.uid, this.email, this.firstName, this.secondName,this.cpr, this.mobileNumber});

  factory UserModel2.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserModel2(
      uid: snapshot['uid'],
      email: snapshot['email'],
      firstName: snapshot['firstNsame'],
      secondName: snapshot['secondName'],
      mobileNumber: snapshot['mobileNumber'],
      cpr: snapshot['cpr'],

    );
  }

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "email": email,
    "firstName": firstName,
    "secondName": secondName,
    "mobileNumber": mobileNumber,
     "cpr": cpr,
  };
}