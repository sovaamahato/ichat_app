import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ichat_app/Authentication/authentication_controller.dart';
import 'package:ichat_app/components/my_textfield.dart';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
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
                  height: 140,
                ),
          
                Text(
                  "Create account Now",
                  style: GoogleFonts.alike(fontSize: 25),
                ),
                Text(
                  "to get Started",
                  style: GoogleFonts.alikeAngular(fontSize: 30),
                ),
                 const SizedBox(
                  height: 45,
                ),
                //username enter------------------------
                MyTextField(
                    hintText: "UserName",
                    leadingIcon: const Icon(
                      Icons.person_outlined,
                    ),
                    textController: userNameController,
                    obscure: false),
          
                const SizedBox(
                  height: 15,
                ),
                //email enter------------------------
                MyTextField(
                    hintText: "Email",
                    leadingIcon:const  Icon(
                      Icons.email_outlined,
                    ),
                    textController: emailController,
                    obscure: false),
          
                const SizedBox(
                  height: 15,
                ),
          //password---------------------------
                MyTextField(
                    hintText: "Password",
                    leadingIcon:const  Icon(
                      Icons.email_outlined,
                    ),
                    textController: passwordController,
                    obscure: true),
                const SizedBox(
                  height: 40,
                ),
          //signup button----------------------
                GestureDetector(
                   onTap: () {
        
                    if(userNameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty&&
                    passwordController.text.isNotEmpty){
                      authenticationController.createAccountForNewUser(
                      userNameController.text,
                      emailController.text,
                        passwordController.text);
        
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
                        "Sign Up ",
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
                  children: [Text("Aready have an account? "),
                  GestureDetector(
                    onTap: ()
                    {
                      Get.to(LoginPage());
                    },
                    child: const Text(" Login Now",style: TextStyle(fontSize: 17,
                    color: Color.fromARGB(255, 202, 182, 236)),),
                  )],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
