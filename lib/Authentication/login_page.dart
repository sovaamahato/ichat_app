import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ichat_app/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
 

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
   TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(255, 68, 227, 255),
            Color.fromARGB(255, 62, 209, 235),
            Color.fromARGB(255, 46, 150, 211)
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),


              Center(child: Container(child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white),)),

                SizedBox(height: 10,),
                
Text("Hello there!",style:GoogleFonts.alike(),),
Text("Welcome"),
                //email enter------------------------
              MyTextField(
                  title: "Enter Email",
                  hintText: "Email",
                  leadingIcon: Icon(
                    Icons.email_outlined,
                    
                  ),
                  controller: emailController,
                  obscure:false),

                  SizedBox(height: 10,),

                  MyTextField(
                  title: "Enter Password",
                  
                  hintText: "Password",
                  leadingIcon: Icon(
                    Icons.email_outlined,
                    
                  ),
                  controller: emailController,
                  obscure:true),
            ],
          ),
        ),
      ),
    );
  }
}
