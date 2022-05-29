import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../firebase/auth_operations.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 60)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Icon(Icons.person, size: 35),
                DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 27.0,
                      color: Colors.black,
                    ),
                    child: Text("Andrea D'Angelo")
                )
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
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
                  child: Text("Bio"),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            child:
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 350),
                    child: const DefaultTextStyle(
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
                        "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
                        "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "),
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
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
                  child: Text("Interessi"),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView(
              //TODO: Impostare il ListView.builder(), https://www.javatpoint.com/flutter-lists, dopo aver collegato DB
              shrinkWrap: true,
              children: const <Widget>[
                ListTile(
                  dense: true,
                  title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 20), child: Text('Inglese'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 20), child: Text('Spagnolo'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 20), child: Text('Dolci freddi'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 20), child: Text('Elettronica'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 20), child: Text('Make-up Artist'))),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Container(
                  height: 50,
                  width: 130,
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
                    child: const Text(
                      'Contatta',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 160,
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
                    child: const Text(
                      'Richiedi ore',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
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
