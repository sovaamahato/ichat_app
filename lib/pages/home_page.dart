import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return 
        Scaffold(
          
          body:Container(
        decoration:const  BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 103, 144, 151),
              Color.fromARGB(255, 48, 94, 121),
              Color.fromARGB(255, 14, 45, 63)
            ])),child:const Center(child: Text("Welcome to the home page😊")),
        ));
  }
}
