import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ichat_app/model/chat_user.dart';

class UserCard extends StatefulWidget {
  final ChatUser user;
 UserCard({ required this.user});

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    var name2 = widget.user.name;
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
          title:  Text(
           widget.user.name,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            widget.user.about,
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
