import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase/auth_operations.dart';

class Ore extends StatefulWidget {
  @override
  _OreState createState() => _OreState();
}

class _OreState extends State<Ore> {
  int _selectedIndex = 0;
  String ore = '';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var index = 1;
    final items = <Widget>[
      const Icon(Icons.handshake, size: 30),
      const Icon(Icons.home, size: 30),
      const Icon(Icons.map, size: 30),
    ];
    return Scaffold(
        extendBody: true,
        body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent,
                    Colors.blueAccent,
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                )
            ),
            child: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 60)),
          Container(
            child:
            Row(
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
          Padding(padding: EdgeInsets.only(top: 60)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
          Padding(padding: EdgeInsets.only(top: 60)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
          Padding(padding: EdgeInsets.only(top: 60)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
          Padding(padding: EdgeInsets.only(top: 60)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
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
          Padding(padding: EdgeInsets.only(top: 35)),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("$ore"))),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () async {
                        User? user = await AuthOperation.registerUserAndSignIn(
                            emailController.text, passwordController.text);
                        if (user != null) {
                          Navigator.pushReplacementNamed(context, '/', arguments: user);
                        }
                      },
                      child: const Text('Richiedi!', style: TextStyle(color: Colors.white, fontSize: 25)),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: index,
          backgroundColor: Colors.transparent,
          height: 60,
          items: items,
        )
    );
  }
}