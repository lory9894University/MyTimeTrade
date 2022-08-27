import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
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
  var findOne = findsNothing;

  final user = MockUser(
    isAnonymous: false,
    uid: 'xJwXwEA3oZSOLdNUGIC9dTiFmWp1',
    email: 'lorenzo@developer.com',
    displayName: 'Lorenzo',
  );

  testWidgets("User recognition", (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;

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

    final username = find.textContaining('Lorenzo');

    expect(username, findOne);
  });

  testWidgets('transaction rendering', (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;

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

    final transaction = find.byKey(const Key('transaction'));

    expect(transaction, findOne);
  });
}
