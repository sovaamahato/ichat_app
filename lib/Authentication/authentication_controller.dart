import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ichat_app/Authentication/login_page.dart';
import 'user.dart' as userModel;

class AuthenticationController extends GetxController {
  static AuthenticationController instanceAuth = Get.find();

  //---------------------method to create new account

  void createAccountForNewUser(
      String userName, String userEmail, String password) async {
    try{
      //1.create user in the firebase authentication

    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: userEmail, password: password);

    //2.save the userprofile image to storage
      //aile image rakhekai xaina so no needd yo part


    //3.save user data to the firestore dtabase
    userModel.User user= userModel.User(
      name: userName,
      email: userEmail,
      uid: credential.user!.uid,

    );
    await FirebaseFirestore.instance.collection("users").
    doc(credential.user!.uid).set(user.toJason());

    Get.snackbar("Congratulations!!1","Account created Succefful");
    }catch(error){
      Get.snackbar("Error", "Account creation unsuccessful");
      Get.to(LoginPage());
    }

  }
}
