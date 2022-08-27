import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytimetrade/screens/home_page.dart';

import 'test_helper.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  FirebaseFirestore.instance.settings = const Settings(
      host: 'localhost:8080', sslEnabled: false, persistenceEnabled: false);
  FirebaseDatabase database = FirebaseDatabase(
    app: Firebase.app(),
    databaseURL: "localhost:9000",
  );

  testWidgets('transaction rendering', (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;

    final user = MockUser(
      isAnonymous: false,
      uid: 'Bm2KN9LjlPUvWnClvzIYQLjjUqj2',
      email: 'lorenzo@developer.com',
      displayName: 'Lorenzo',
    );

    await tester.pumpWidget(MaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: RouteSettings(arguments: user),
          builder: (context) {
            return HomePage();
          },
        );
      },
    ));
  });
}
