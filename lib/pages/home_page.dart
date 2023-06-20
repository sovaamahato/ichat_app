import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Authentication/authentication_controller.dart';
import '../api/apis.dart';
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

      //used streambuilder coz its help in fetching data from cloud firestore database----------
      body: StreamBuilder(
        stream: APIs.firestore.collection("chatting_users").snapshots(),//chatting users is the name of my database .means the collections

        builder: (context,snapshot){
          // ignore: non_constant_identifier_names
          final List=[];


          if(snapshot.hasData){
            final data = snapshot.data?.docs;

            for(var i in data!){
              log('Data: ${i.data()}');
              List.add(i.data()['name']);
            }
          }
          return ListView.builder(
          physics:const  BouncingScrollPhysics(),
            itemCount: List.length,
            itemBuilder: (context, int) {
             // return const UserCard();
             return Text(List[int]);
            });
        },
        
      ),
    );
  }
}
