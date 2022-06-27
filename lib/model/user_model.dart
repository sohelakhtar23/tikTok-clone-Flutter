import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String username, email, photoUrl, uid;

  User({
    required this.username,
    required this.email,
    required this.photoUrl,
    required this.uid,
  });

  Map<String, String> toJson()=> {
    'uid': uid,
    'username': username,
    'email': email,
    'photoUrl': photoUrl,
  };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
      uid: snapshot['uid'],
      username: snapshot['username'],
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl'],
    );
  }
}
