
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final Icon? leadingIcon;
  final String? imgPath;
  final textController;
  final bool obscure;
  MyTextField(
      {required this.hintText,
      this.leadingIcon,
      required this.obscure,
      this.imgPath,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    return

        // child:
        Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        obscureText: obscure,
        controller: textController,
        decoration: InputDecoration(
            labelText: hintText,
            prefixIcon: leadingIcon != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: leadingIcon,
                  )
                : Image.asset(
                    imgPath!,
                    width: 60,
                  ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
                borderSide: BorderSide(color: Colors.grey))

            //hintText: hintText,
            ),
      ),
    );
  }
}
