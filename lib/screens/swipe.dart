import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:slider_button/slider_button.dart';

import '../widgets/global.dart';

class Swipe extends StatefulWidget {
  const Swipe({Key? key}) : super(key: key);

  @override
  _SwipeState createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map<String, String> args = Map<String, String>.from(
      {"name": "", "phone": "", "address": "", "interest": ""});

  @override
  void didChangeDependencies() async {
    args = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      ScaffoldMessenger.of(context).showSnackBar(offlineSnackBar);
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.greenAccent,
            Colors.blueAccent,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: Column(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 60)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("confirm hours exchange".i18n()),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 100)),
            const Padding(padding: EdgeInsets.only(top: 50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("hours requested".i18n() + ":"),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text(args['ore']!),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("service requested".i18n() + ": "),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text(args["description"]!),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("paying to".i18n() + ": "),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("${args['supplier_name']}"),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 100)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SliderButton(
                  width: 400,
                  backgroundColor: Colors.white70,
                  highlightedColor: Colors.green,
                  action: () async {
                    await updateBalance(args);
                    FirebaseDatabase.instance
                        .ref("/transactions/${args['timestamp']}")
                        .update({
                      "status": "completed",
                    });
                    Navigator.of(context).pop();
                  },
                  alignLabel: const Alignment(0.1, 0),
                  label: Text(
                    "confirm".i18n(),
                    style: const TextStyle(
                        color: Color(0xff4a4a4a),
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
                  icon: const Icon(Icons.handshake, size: 35),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updateBalance(transaction) async {
    var event = await FirebaseDatabase.instance
        .ref("/users/${transaction['client']}")
        .once();
    var snap = event.snapshot.value as Map<dynamic, dynamic>;
    var balance = snap['balance'];
    var clientBalance = balance - int.parse(transaction['ore']!);
    FirebaseDatabase.instance
        .ref("/users/${transaction['client']}")
        .update({"balance": clientBalance});

    event = await FirebaseDatabase.instance
        .ref("/users/${transaction['supplier']}")
        .once();
    snap = event.snapshot.value as Map<dynamic, dynamic>;
    balance = snap['balance'];
    clientBalance = balance + int.parse(transaction['ore']!);
    FirebaseDatabase.instance
        .ref("/users/${transaction['supplier']}")
        .update({"balance": clientBalance});
  }
}
