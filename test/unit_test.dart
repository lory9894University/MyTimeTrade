import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytimetrade/model/transaction.dart';
import 'package:mytimetrade/screens/auth_screen/login_demo.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

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

  group('Transactions', () {
    test("transaction creation", () {
      Transaction transaction = Transaction(
          10,
          "prova",
          "Bm2KN9LjlPUvWnClvzIYQLjjUqj2",
          "lorenzo",
          "v1PDhUyEsoMkdzi3oru7MjLNEii1",
          "Andrea2909");
      expect(transaction.ore, 10);
      expect(transaction.description, "prova");
      expect(transaction.supplier, "Bm2KN9LjlPUvWnClvzIYQLjjUqj2");
      expect(transaction.supplier_name, "lorenzo");
      expect(transaction.client, "v1PDhUyEsoMkdzi3oru7MjLNEii1");
      expect(transaction.client_name, "Andrea2909");
      expect(transaction.date, DateTime.now().toString().substring(0, 10));
    });
  });
}

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
