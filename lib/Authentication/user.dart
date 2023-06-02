import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String? name;
  String? uid;
  String? image;
  String? email;
  String? youtube;
  String? facebook;
  String? twitter;
  String? instagram;

  User({
    this.name,
    this.email,
    this.facebook,
    this.image,
    this.instagram,
    this.twitter,
    this.uid,
    this.youtube


  });
  Map<String, dynamic>toJason()=>{
  "name": name,
  "uid":uid,
  "image":image,
  "email":email,
  "youtube":youtube,
  "facebook":facebook,
  "instagram":instagram,
  

};


static User fromSnap(DocumentSnapshot snapshot){
  var dataSnapshot =snapshot.data() as Map<String, dynamic>;

  return User(
    name: dataSnapshot["name"],
    uid: dataSnapshot["uid"],
    image: dataSnapshot["image"],
    email: dataSnapshot["email"],
    youtube: dataSnapshot["youtube"],
    facebook: dataSnapshot["facebook"],
    twitter: dataSnapshot["twitter"],
    instagram: dataSnapshot["instagram"],
  );
}
}

