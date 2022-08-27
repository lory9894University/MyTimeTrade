// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytimetrade/screens/auth_screen/login_demo.dart';

import 'test_helper.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupFirebaseAuthMocks();
  Firebase.initializeApp();

  final user = MockUser(
    isAnonymous: false,
    uid: 'Bm2KN9LjlPUvWnClvzIYQLjjUqj2',
    email: 'lorenzo@developer.com',
    displayName: 'Lorenzo',
  );

  testWidgets('Login', (WidgetTester tester) async {
    FlutterError.onError = ignoreOverflowErrors;

    final user = MockUser(
      isAnonymous: false,
      uid: 'Bm2KN9LjlPUvWnClvzIYQLjjUqj2',
      email: 'lorenzo@developer.com',
      displayName: 'Lorenzo',
    );

    final email = find.byKey(const Key('LoginEmail'));
    final password = find.byKey(const ValueKey('LoginPassword'));
    final login = find.byKey(const ValueKey('LoginButton'));

    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(email, findsOneWidget);
    expect(password, findsOneWidget);
    expect(login, findsOneWidget);

    await tester.enterText(email, 'lorenzo@developer.com');
    await tester.enterText(password, 'Lorenzo.98');

    final auth = MockFirebaseAuth(mockUser: user);
    final result = await auth.signInWithEmailAndPassword(
        email: 'lorenzo@developer.com', password: 'Lorenzo.98');
    await tester.tap(login);

    final userLogged = await result.user;
    print(userLogged?.displayName);
    expect(userLogged?.displayName, 'Lorenzo');
    await tester.pump();
  });
}
