
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_app/src/Homepage/user_model2.dart';
import '../../../user_model.dart';

class FirestoreHelper {
  static Stream<List<UserModel2>> read() {
    final userCollection = FirebaseFirestore.instance.collection("users");
    return userCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => UserModel2.fromSnapshot(e)).toList());

  }

  static Future create(UserModel user) async {
    final userCollection = FirebaseFirestore.instance.collection("users");

    final uid = userCollection.doc().id;
    final docRef = userCollection.doc(uid);

    final newUser = UserModel2(
     uid: user.uid,
        firstName: user.firstName,
        secondName: user.secondName,
        mobileNumber: user.mobileNumber,
        cpr:user.cpr,
        email:user.email,
    ).toJson();

    try {
      await docRef.set(newUser);
    } catch (e) {
      print("some error occured $e");
    }
  }

  static Future update(UserModel2 user) async {
    final userCollection = FirebaseFirestore.instance.collection("users");

    final docRef = userCollection.doc(user.uid);

    final newUser = UserModel2(
        uid: user.uid,
        firstName: user.firstName,
        secondName: user.secondName,
        mobileNumber: user.mobileNumber,
        email: user.email,
        cpr: user.cpr,

    ).toJson();

    try {
      await docRef.update(newUser);
    } catch (e) {
      print("some error occured $e");
    }
  }

  static Future delete(UserModel2 user) async {
    final userCollection = FirebaseFirestore.instance.collection("users");
    final docRef = userCollection.doc(user.uid).delete();

  }



}