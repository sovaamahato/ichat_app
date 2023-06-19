import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 1,
      color: Colors.grey[300],
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: const CircleAvatar(
              //backgroundColor: Colors.grey[300],
              child: Icon(CupertinoIcons.person,color: Colors.black,)),
          title: const Text(
            "Demo User",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: const Text(
            "last message by demo user",
            maxLines: 1,
          ),
          trailing: Text(
            "12:01 PM",
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
      ),
    );
  }
}
