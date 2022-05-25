import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:slider_button/slider_button.dart';

import '../firebase/auth_operations.dart';

class Swipe extends StatefulWidget {
  @override
  _SwipeState createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  int _selectedIndex = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Center(
                child: Text("Conferma dello scambio ore"),
              )
            ]
          ),
          Row(
              children: <Widget>[
                Center(
                  child: Text("Ordine #265829"),
                )
              ]
          ),
          Row(
              children: <Widget>[
                Text("3h "),
                Text("- "),
                Text("Gioia LeDritta")
              ]
          ),
          Row(
              children: <Widget>[
                Center(
                    child: SliderButton(
                      action: () {
                        ///Do something here
                        Navigator.of(context).pop();
                      },
                      label: Text("Conferma",
                        style: TextStyle(
                            color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      icon: Text("x",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 44,
                        ),
                      ),
                    )
                ),
              ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'Servizi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Vicino a te',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}