import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytimetrade/screens/home_page.dart';

import 'test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupFirebaseAuthMocks();
  Firebase.initializeApp();

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
