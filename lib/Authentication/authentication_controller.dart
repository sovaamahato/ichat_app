import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ichat_app/Authentication/login_page.dart';
//import 'package:ichat_app/Authentication/sign_up_page.dart';
import '../pages/home_page.dart';
import 'user.dart' as userModel;

class AuthenticationController extends GetxController {
  static AuthenticationController instanceAuth = Get.find();
late Rx<User?>_currentUser;
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
    Get.to(LoginPage());
    }catch(error){
      Get.snackbar("Error", "Account creation unsuccessful");
      
    }




  }

//to login new user------
  void LoginNewUser(String userEmail, String password)async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: userEmail, 
      password: password);
      Get.snackbar("Congratulations!!","login Succefful");
       Get.to(HomePage());
      


    }
    catch(error){
      Get.snackbar("Error", "Login unsuccessful");
     
    }


     
    
  }

SignOutUser()async{
      return await FirebaseAuth.instance.signOut();
    }

  


  //to take the user to homescreen after successfull login
  goToScreen(User? currentUser){
    //if not login
    if(currentUser==null)
    {
      Get.to(LoginPage());

    }
    else{
      Get.to(HomePage());
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();

    _currentUser=Rx<User?>(FirebaseAuth.instance.currentUser); 
    _currentUser.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_currentUser, goToScreen);
  }
}
