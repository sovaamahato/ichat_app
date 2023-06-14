import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:ichat_app/Authentication/sign_up_page.dart';
import 'package:ichat_app/components/my_textfield.dart';

import 'authentication_controller.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
    var authenticationController =AuthenticationController.instanceAuth;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 103, 144, 151),
            Color.fromARGB(255, 48, 94, 121),
            Color.fromARGB(255, 14, 45, 63)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 130,
                ),
        
                Center(
                    child: Container(
                  child:const CircleAvatar(
                    radius: 60,
                   backgroundImage: AssetImage("lib/images/login_pic.png"),
                  ),
                )),
        
                const SizedBox(
                  height: 20,
                ),
        
                Text(
                  "Hello there!",
                  style: GoogleFonts.alike(fontSize: 30),
                ),
                Text(
                  "Welcome",
                  style: GoogleFonts.alikeAngular(fontSize: 20),
                ),
        
                const SizedBox(
                  height: 40,
                ),
                //email enter------------------------
                MyTextField(
                    hintText: "Email",
                    leadingIcon: const Icon(
                      Icons.email_outlined,
                    ),
                    textController: emailController,
                    obscure: false),
        
                const SizedBox(
                  height: 15,
                ),
        
                MyTextField(
                    hintText: "Password",
                    leadingIcon: const Icon(
                      Icons.email_outlined,
                    ),
                    textController: passwordController,
                    obscure: true),
                const SizedBox(
                  height: 40,
                ),
                //login button----------------------
                GestureDetector(
                  onTap: () {
        
                    if(
                    emailController.text.isNotEmpty&&
                    passwordController.text.isNotEmpty){
        
                      authenticationController.LoginNewUser(
                        emailController.text,
                        passwordController.text
                      );
                    }
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width - 10,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(19)),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Login Now",
                        style: GoogleFonts.alike(
                          fontSize: 20,
                        ),
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Not have an account? "),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/SignUpPage');
                      },
                      child:const  Text(
                        " SignUp Now",
                        style: TextStyle(
                            fontSize: 17,
                            color: Color.fromARGB(255, 202, 182, 236)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
