import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase/auth_operations.dart';

class Ore extends StatefulWidget {
  @override
  _OreState createState() => _OreState();
}

class _OreState extends State<Ore> {
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
                child: Text("Inserimento ore",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
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
                  onPressed: () async {
                    User? user = await AuthOperation.registerUserAndSignIn(
                        emailController.text, passwordController.text);
                    if (user != null) {
                      Navigator.pushReplacementNamed(context, '/',
                          arguments: user);
                    }
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
                  onPressed: () async {
                    User? user = await AuthOperation.registerUserAndSignIn(
                        emailController.text, passwordController.text);
                    if (user != null) {
                      Navigator.pushReplacementNamed(context, '/',
                          arguments: user);
                    }
                  },
                  child: const Text(
                    '3',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
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
                  child: const Text('4', style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
              ),
              Container(
                height: 50,
                width: 50,
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
                  child: const Text('5', style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
              Container(
                height: 50,
                width: 50,
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
                  child: const Text('6', style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
              ],
            ),
          Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
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
                  child: const Text('7', style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
              Container(
                height: 50,
                width: 50,
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
                  child: const Text('8', style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
              Container(
                height: 50,
                width: 50,
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
                  child: const Text('9', style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
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
                  child: const Text('0', style: TextStyle(color: Colors.white, fontSize: 25)),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text("7"),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 50,
                  width: 200,
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