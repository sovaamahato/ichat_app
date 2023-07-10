import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ichat_app/model/chat_user.dart';

class APIs {
  //for authentication
  static FirebaseAuth auth = FirebaseAuth.instance;
  //for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  //for checking if user exists or not
  static Future<bool> userExists() async {
    return (await firestore
            .collection("users")
            .doc(auth.currentUser!.uid)
            .get())
        .exists;
  }

static User get user => auth.currentUser!;
   //for creating new user
  static Future<void> createUser() async {
    final time= DateTime.now().microsecondsSinceEpoch.toString();
    final chatUser= ChatUser(name: user.displayName!.toString(), 
    email: user.email.toString(),
     lastActive: time, 
     image:user.photoURL.toString() ,
      id: user.uid, 
     createdAt: time, 
     about: "Hey! i'am using ichat app", 
     pushToken: ' ',
      isOnline: false,);
    return await firestore
            .collection("users")
            .doc(user.uid).set(chatUser.toJason());
  }
}
