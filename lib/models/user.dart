import 'package:cloud_firestore/cloud_firestore.dart';


class UserData {
  String password;
  String email;
  String title;
  String username;
  String name;
  String profileImg;
  String uid;
  List followers;
  List following;

  UserData({
    required this.email,
    required this.password,
    required this.title,
    required this.username,
    required this.profileImg,
    required this.uid,
    required this.followers,
    required this.following, 
    required this.name,
  });

// To convert the UserData(Data type) to Map<String, object>
  Map<String, dynamic>  convert2Map() {
    return {
      "password": password,
      "email": email,
      "title": title,
      "username": username,
      "name": name,
      "profileImg": profileImg,
      "uid": uid,
      "followers": [],
      "following": [],
    };
  }



  // function that convert "DocumentSnapshot" to a User
// function that takes "DocumentSnapshot" and return a User
 
 static    convertSnap2Model(DocumentSnapshot snap) {
 var snapshot = snap.data() as Map<String, dynamic>;
 return UserData(
  password: snapshot["password"],
  email: snapshot["email"],
  title: snapshot["title"],
  name:snapshot["name"],
  username: snapshot["username"],
  profileImg: snapshot["profileImg"],
  uid: snapshot["uid"],
  followers: snapshot["followers"],
  following: snapshot["following"],
  
  
  );
 }


}
