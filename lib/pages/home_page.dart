//import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ichat_app/model/chat_user.dart';

import '../Authentication/authentication_controller.dart';
import '../api/apis.dart';
import '../components/user_card.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<ChatUser> list=[];
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
          "iChating App",
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
          

          switch (snapshot.connectionState) {
//if there is no data then show progress bar until data is loaded
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const Center(child: CircularProgressIndicator(),);

            //if one or all data is loaded then show it
            case ConnectionState.active:
            case ConnectionState.done:  


            //data isstored in this variable---------------------------         
            final data = snapshot.data?.docs;
            list=data?.map((e) => ChatUser.fromSnap(e)).toList() ??[]; 
          }

          if(list.isNotEmpty){
            return ListView.builder(
          physics:const  BouncingScrollPhysics(),
            itemCount: list.length,
            itemBuilder: (context, index) {
             return UserCard(user: list[index],);
             //return Text(list[index] as String);
            });

          }else{
            return const Center(child: Text("No Connection Found!"),);
          }
          
             
          }
          // ignore: non_constant_identifier_names
          
        

    ),
    );
  }
}
