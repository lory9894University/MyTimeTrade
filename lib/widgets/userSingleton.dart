library global_user;

import 'package:firebase_auth/firebase_auth.dart';

User? logged_user = null;
UserData? global_user_data = null;

class UserData {
  late String name, email, uid;
  String? address;
  User authObject;
  List<String>? services;

  UserData(this.address, this.services, this.authObject) {
    name = authObject.displayName!;
    email = authObject.email!;
    uid = authObject.uid;
  }
}
