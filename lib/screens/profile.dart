import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/img/handshake.png')
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Marco Demasi!",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Center(
                child: Text("Bio",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Center(
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit laborum."),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Center(
                child: Text("Interessi",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Flexible(
            child: ListView( //TODO: Impostare il ListView.builder(), https://www.javatpoint.com/flutter-lists, dopo aver collegato DB
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  title: Text('Inglese'),
                ),
                ListTile(
                  title: Text('Spagnolo'),
                ),
                ListTile(
                  title: Text('Dolci freddi'),
                ),
                ListTile(
                  title: Text('Elettronica'),
                ),
                ListTile(
                  title: Text('Make-up Artist'),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () async {
                User? user = await AuthOperation.registerUserAndSignIn(
                    emailController.text, passwordController.text);
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/',
                      arguments: user);
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
            width: 250,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(20)),
            child: TextButton(
              onPressed: () async {
                User? user = await AuthOperation.registerUserAndSignIn(
                    emailController.text, passwordController.text);
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/',
                      arguments: user);
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