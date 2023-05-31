import 'dart:html';

import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final Icon? leadingIcon;
  final String? imgPath;
  final controller;
  final bool obscure;
  MyTextField(
      {required this.title,
      required this.hintText,
      this.leadingIcon,
      required this.obscure,
      this.imgPath,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:10.0),
          child: Text(
            title,
            style: TextStyle(color: Color.fromARGB(255, 74, 9, 160)),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.all(10),
          height: 50,
          width: MediaQuery.of(context).size.width - 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
              
            ),
          ),
          child: TextField(
            decoration: InputDecoration(
              labelText: hintText
              
              //hintText: hintText,
              )),
        ),
      ],
    );
  }
}
