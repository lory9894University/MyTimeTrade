import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytimetrade/model/interest.dart';
import 'package:mytimetrade/model/transaction.dart' as trans;
import 'package:mytimetrade/screens/swipe.dart';

import 'test_helper.dart';

Future<void> main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  setupFirebaseAuthMocks();
  await Firebase.initializeApp();

  trans.Transaction transaction = trans.Transaction(
      10,
      "prova",
      "Bm2KN9LjlPUvWnClvzIYQLjjUqj2",
      "lorenzo",
      "v1PDhUyEsoMkdzi3oru7MjLNEii1",
      "Andrea2909");
  Interest interest = Interest(
      "lorenzo", "3272014546", "Via reano 24 Rivoli", "prova", "10", "prova");
  var findOne = findsNothing;

  testWidgets("swipe layout", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: RouteSettings(
              arguments: Map<String, String>.from({
            "supplier_name": interest.name,
            "phone": interest.phone,
            "address": interest.address,
            "interest": interest.interest,
            "ore": interest.ore,
            "description": interest.description
          })),
          builder: (context) {
            return Swipe();
          },
        );
      },
    ));

    await tester.pump();

    final username = find.textContaining('lorenzo');

    expect(username, findsOneWidget);
    expect(find.textContaining("prova"), findsOneWidget);
    expect(find.textContaining("10"), findsOneWidget);
  });
}
