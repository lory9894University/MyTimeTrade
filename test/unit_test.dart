import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytimetrade/screens/auth_screen/login_demo.dart';

class UserData {
  late String name, email, uid, referralCode;
  String? address, phoneNr;
  User? authObject;
  List<String>? services;
  double? lat, lng;
  double radius = 10;

  UserData(this.address, this.services, this.name, this.authObject,
      this.phoneNr, this.lat, this.lng, this.email, this.uid) {
    referralCode = uid.substring(0, 5);
  }
}

void main() {
  group('Verification', () {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    Verificator verificator = Verificator(emailController, passwordController);

    test('empty mail', () {
      expect(verificator.validateEmail(''), false);
    });

    test('empty password', () {
      expect(verificator.validatePassword(''), false);
    });

    test('valid mail', () {
      expect(verificator.validateEmail('lorenzo@gmail.com'), true);
    });

    test('valid password', () {
      expect(verificator.validatePassword('Lorenzo123'), true);
    });

    test('invalid mail', () {
      expect(verificator.validateEmail('lorenzo@gmail'), false);
    });
  });

  group('Global user data', () {
    test('global user data creation', () {
      UserData userData = UserData("address", ['service'], "name", null,
          "phone", null, null, "email", "uidUser");
      expect(userData.address, 'address');
      expect(userData.services, ['service']);
      expect(userData.name, 'name');
      expect(userData.authObject, null);
      expect(userData.phoneNr, 'phone');
      expect(userData.lat, null);
      expect(userData.lng, null);
      expect(userData.referralCode, "uidUs");
    });
  });
}
