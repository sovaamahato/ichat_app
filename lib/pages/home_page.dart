import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Authentication/authentication_controller.dart';
import '../components/user_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var authenticationController = AuthenticationController.instanceAuth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const Icon(
          CupertinoIcons.home,
          color: Colors.black,
        ),
        title: const Text(
          "iChat App",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              //return authenticationController.SignOutUser();
            },
            child:const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.logout,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (context, int) {
              return const UserCard();
            }),
      ),
    );
  }
}
