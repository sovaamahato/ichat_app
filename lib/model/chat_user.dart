import 'package:cloud_firestore/cloud_firestore.dart';

class ChatUser{
  String name;
  String id;
  String image;
  String email;
  String lastActive;
  String createdAt;
  String pushToken;
  String about;
  bool isOnline;

  ChatUser({
    required this.name,
    required this.email,
    required this.lastActive,
    required this.image,
    required this.id,
    required this.createdAt,
    required this.about,
    required this.pushToken,
    required this.isOnline


  });
  Map<String, dynamic>toJason()=>{
  "name": name,
  "id":id,
  "image":image,
  "email":email,
  "push_token":pushToken,
  "last_active":lastActive,
  "created_at":createdAt,
  "about":about,
  "is_online":isOnline,
  

};


static ChatUser fromSnap(DocumentSnapshot snapshot){
  var dataSnapshot =snapshot.data() as Map<String, dynamic>;

  return ChatUser(
    name: dataSnapshot["name"]?? "",
    id: dataSnapshot["id"]??"",
    image: dataSnapshot["image"]?? "",
    email: dataSnapshot["email"]?? "",
    createdAt: dataSnapshot["created_at"]?? "",
    lastActive: dataSnapshot["last_active"]?? "",
    pushToken: dataSnapshot["push_token"]?? "",
    about: dataSnapshot["about"]?? "",
    isOnline: dataSnapshot["is_online"]?? "",
  );
}
}

