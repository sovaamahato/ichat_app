import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class APIs {

  //for authentication 
  static FirebaseAuth auth = FirebaseAuth.instance; 
  //for accessing cloud firestore database
  static FirebaseFirestore firestore=FirebaseFirestore.instance;

  //for checking if user exists or not
  static Future<bool> userExists()async{
    return (await firestore.collection("users").doc(auth.currentUser!.uid).get()).exists;
  }
}