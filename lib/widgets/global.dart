library global_user;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

User? logged_user;
UserData? global_user_data;

final offlineSnackBar = SnackBar(
  duration: const Duration(seconds: 5),
  content: Text('no connection'.i18n(), textAlign: TextAlign.left),
  action: SnackBarAction(
    label: 'OK',
    onPressed: () {},
  ),
);

class UserData {
  late String name, email, uid;
  String? address, phoneNr;
  User authObject;
  List<String>? services;
  double? lat, lng;
  double radius = 10;

  UserData(this.address, this.services, this.name, this.authObject,
      this.phoneNr, this.lat, this.lng) {
    email = authObject.email!;
    uid = authObject.uid;
  }
}

class Constants {
  Constants._();
  static const double padding = 20;
  static const double avatarRadius = 45;
}
