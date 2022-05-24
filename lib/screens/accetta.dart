import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase/auth_operations.dart';

class Accetta extends StatefulWidget {
  @override
  _AccettaState createState() => _AccettaState();
}

class _AccettaState extends State<Accetta> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.5,
            bottom: TabBar(
              tabs: [
                Tab(text: "Da accettare"),
                Tab(text: "Accettate")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Table(
                      border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                      children: [
                        TableRow( children: [
                          Column(children:[Text('Filippone Erik'), Text("Website builder")]),
                          Column(children:[Container(
                            margin: EdgeInsets.all(25),
                            child: FlatButton(
                              child: Text('Conferma', style: TextStyle(fontSize: 20.0),),
                              color: Colors.green,
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                          ),  ]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Filippone Erik'), Text("Tortillas fritte")]),
                          Column(children:[Container(
                            margin: EdgeInsets.all(25),
                            child: FlatButton(
                              child: Text('Conferma', style: TextStyle(fontSize: 20.0),),
                              color: Colors.green,
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                          ),  ]),
                        ]),
                        TableRow( children: [
                          Column(children:[Text('Filippone Erik'), Text("Lampadina")]),
                          Column(children:[Container(
                            margin: EdgeInsets.all(25),
                            child: FlatButton(
                              child: Text('Conferma', style: TextStyle(fontSize: 20.0),),
                              color: Colors.green,
                              textColor: Colors.white,
                              onPressed: () {},
                            ),
                          ),  ]),
                        ]),
                      ],
                    ),
                  ),
                ]
              )
            ),
            Center(
              child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Table(
                        border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                        children: [
                          TableRow( children: [
                            Column(children:[Text('Nome', style: TextStyle(fontSize: 20.0))]),
                            Column(children:[Text('Necessità', style: TextStyle(fontSize: 20.0))]),
                          ]),
                          TableRow( children: [
                            Column(children:[Text('Javatpoint')]),
                            Column(children:[Text('Flutter')]),
                          ]),
                          TableRow( children: [
                            Column(children:[Text('Javatpoint')]),
                            Column(children:[Text('MySQL')]),
                          ]),
                          TableRow( children: [
                            Column(children:[Text('Javatpoint')]),
                            Column(children:[Text('ReactJS')]),
                          ]),
                        ],
                      ),
                    ),
                  ])
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
        ),
      ),
    );
  }
}