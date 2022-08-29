import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mytimetrade/model/accetta.dart';
import 'package:mytimetrade/model/transaction.dart' as trans;

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
  List<Map<String, String>> transactions = List.empty(growable: true);
  transactions.add(transaction.toMap());
  transactions.add(transaction.toMap());
  transactions.add(transaction.toMap());

  testWidgets("swipe layout", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: RouteSettings(arguments: transactions),
          builder: (context) {
            return Accetta();
          },
        );
      },
    ));

    await tester.pump();
  });
}
