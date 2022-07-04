library global_user;

import 'package:firebase_auth/firebase_auth.dart';

User? logged_user;
UserData? global_user_data;

class UserData {
  late String name, email, uid;
  String? address, phoneNr;
  User authObject;
  List<String>? services;

  UserData(
      this.address, this.services, this.name, this.authObject, this.phoneNr) {
    email = authObject.email!;
    uid = authObject.uid;
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
