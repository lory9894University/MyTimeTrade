import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mytimetrade/widgets/global.dart';

class Ore extends StatefulWidget {
  @override
  _OreState createState() => _OreState();
}

class _OreState extends State<Ore> {
  int _selectedIndex = 0;
  String ore = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Map<String, String> args = Map<String, String>.from(
      {"name": "", "phone": "", "address": "", "interest": ""});

  void didChangeDependencies() {
    args = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var index = 0;
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
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("Inserimento ore"),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 60)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ore = '${ore}1';
                        });
                      },
                      child: const Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ore = '${ore}2';
                        });
                      },
                      child: const Text(
                        '2',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ore = '${ore}3';
                        });
                      },
                      child: const Text(
                        '3',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 60)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ore = '${ore}4';
                        });
                      },
                      child: const Text(
                        '4',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ore = '${ore}5';
                        });
                      },
                      child: const Text(
                        '5',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ore = '${ore}6';
                        });
                      },
                      child: const Text(
                        '6',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 60)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ore = '${ore}7';
                        });
                      },
                      child: const Text(
                        '7',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ore = '${ore}8';
                        });
                      },
                      child: const Text(
                        '8',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ore = '${ore}9';
                        });
                      },
                      child: const Text(
                        '9',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 60)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ore = '${ore}0';
                        });
                      },
                      child: const Text(
                        '0',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 35)),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Center(
                          child: DefaultTextStyle(
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                              child: Text("$ore"))),
                      const Divider(
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 10)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () async {
                        if (ore.length > 0) {
                          var timestamp =
                              DateTime.now().millisecondsSinceEpoch.toString();
                          final Map<String, Map> updates = {};
                          updates['/transactions/${timestamp}'] = {
                            "date": DateTime.now().toString().substring(0, 10),
                            "ore": ore,
                            "timestamp": timestamp,
                            "client": global_user_data!.uid,
                            "supplier": args['uid'],
                            "status": "pending",
                            "description": args['interest'],
                            "supplier_name": args['name'],
                            "client_name": global_user_data!.name,
                          };
                          DatabaseReference clientRef =
                              FirebaseDatabase.instance.ref().child(
                                  "users/${global_user_data!.uid}/transactions/");
                          final clientKey = clientRef.push().key;
                          DatabaseReference serverRef = FirebaseDatabase
                              .instance
                              .ref()
                              .child("users/${args['uid']}/transactions/");
                          final serverKey = serverRef.push().key;

                          FirebaseDatabase.instance.ref().update(updates);
                          clientRef.child(clientKey!).set(timestamp);
                          serverRef.child(serverKey!).set(timestamp);
                          Navigator.pop(context);
                        } else {
                          //TODO: show snackbar
                        }
                      },
                      child: const Text('Richiedi!',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          ore = '';
                        });
                      },
                      child: const Text('Cancella',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      child: const Text('Indietro',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
