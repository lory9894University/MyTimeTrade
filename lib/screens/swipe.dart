import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
    var index = 0;
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
                    fontSize: 30.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("Conferma dello scambio ore"),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 100)),
          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("Ordine #265829"),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 50)),
          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("Numero di ore:"),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("5"),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("Da donare a:"),
                ),
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("Gioia LeDritta"),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 100)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SliderButton(
                  width: 400,
                  backgroundColor: Colors.white70,
                  highlightedColor: Colors.green,
                  action: () {
                    ///Do something here
                    Navigator.of(context).pop();
                  },
                  alignLabel: Alignment(0.1, 0),
                  label: Text("Conferma",
                    style: TextStyle(
                        color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 30),
                  ),
                  icon: Icon(Icons.handshake, size: 35),
                )
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
          items: <Widget>[
            IconButton(
              iconSize: 30,
              onPressed: () {
                Navigator.pushNamed(context, '/amici');
              },
              icon: const Icon(Icons.handshake),
              tooltip: 'Invita i tuoi amici',
            ),
            IconButton(
              iconSize: 30,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              icon: const Icon(Icons.home),
              tooltip: 'Home',
            ),
            IconButton(
              iconSize: 30,
              onPressed: () {
                Navigator.pushNamed(context, '/servizi');
              },
              icon: const Icon(Icons.map),
              tooltip: 'Servizi',
            ),
          ],
        )
    );
  }
}