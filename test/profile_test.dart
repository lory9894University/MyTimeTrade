import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytimetrade/screens/personal_profile.dart';
import 'package:mytimetrade/widgets/global.dart';

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
  var findOne = findsNothing;

  globalUserData = UserData("via reano 24, Rivoli, 10098, Italia",
      ["prova", "prova2"], "Lorenzo", user, "3272014546", 0, 0);

  test('global user data creation', () {
    expect(globalUserData?.name, 'Lorenzo');
    expect(globalUserData?.uid, 'Bm2KN9LjlPUvWnClvzIYQLjjUqj2');
  });

  testWidgets('check address', (WidgetTester tester) async {
    final address = find.byKey(const Key('address'));
    final edit_address = find.byKey(const Key('edit_address'));
    final expand_address = find.byKey(const Key('expand_address'));

    await tester.pumpWidget(const MaterialApp(home: PersonalProfile()));
    await tester.pumpAndSettle();

    expect(expand_address, findsOneWidget);
    await tester.tap(expand_address);
    await tester.pumpAndSettle();

    expect(edit_address, findsOneWidget);
    expect(address, findsOneWidget);
    expect(find.text("via reano 24, Rivoli, 10098, Italia"), findsOneWidget);
  });

  testWidgets('edit address', (WidgetTester tester) async {
    final address_box = find.byKey(const Key('address_box'));
    final edit_address = find.byKey(const Key('edit_address'));
    final expand_address = find.byKey(const Key('expand_address'));
    final confirm_address = find.byKey(const Key('confirm_address'));

    await tester.pumpWidget(const MaterialApp(home: PersonalProfile()));
    await tester.pumpAndSettle();

    await tester.tap(expand_address);
    await tester.pumpAndSettle();

    expect(edit_address, findsOneWidget);
    await tester.tap(edit_address);
    await tester.pump();
    await tester.pumpAndSettle();
  });

  testWidgets('check Phone', (WidgetTester tester) async {
    final phone = find.byKey(const Key('phoneNr'));
    final edit_phone = find.byKey(const Key('edit_phoneNr'));
    final expand_phone = find.byKey(const Key('expand_phoneNr'));

    await tester.pumpWidget(const MaterialApp(home: PersonalProfile()));
    await tester.pumpAndSettle();

    expect(expand_phone, findsOneWidget);
    await tester.tap(expand_phone);
    await tester.pumpAndSettle();

    expect(edit_phone, findsOneWidget);
    expect(phone, findsOneWidget);
    expect(find.text("3272014546"), findsOneWidget);
  });

  testWidgets('check Interest', (WidgetTester tester) async {
    final interest = find.byKey(const Key('interest'));
    final expand_interests = find.byKey(const Key('expand_interests'));

    await tester.pumpWidget(const MaterialApp(home: PersonalProfile()));
    await tester.pumpAndSettle();

    expect(expand_interests, findsOneWidget);
    await tester.tap(expand_interests);
    await tester.pumpAndSettle();

    expect(interest, findOne);
  });
}
