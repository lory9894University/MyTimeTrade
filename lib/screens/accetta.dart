import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../firebase/auth_operations.dart';
import 'Profile_Passage.dart';

class Accetta extends StatefulWidget {
  @override
  _AccettaState createState() => _AccettaState();
}

class _AccettaState extends State<Accetta> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    var index = 1;
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          extendBody: true,
          appBar: AppBar(
            toolbarHeight: 0.5,

            bottom: TabBar(
              tabs: [
                Tab(text: "Da accettare"),
                Tab(text: "Accettate")
              ],
            ),
          ),
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
          child:TabBarView(
            children: [
              Center(
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(20),
                    child: Table(
                      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                      border: TableBorder.all(
                        color: Colors.black,
                        style: BorderStyle.solid,
                        width: 2),
                      children: [
                        TableRow( children: [
                          Column(
                            children: <Widget>[
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
                                      child: Text("Filippone Erik"),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text("Website builder"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children:[Container(
                            margin: EdgeInsets.all(25),
                            child: FlatButton(
                              child: Text('Conferma', style: TextStyle(fontSize: 20.0),),
                              color: Colors.green,
                              textColor: Colors.white,
                              onPressed: () {Navigator.pushNamed(context, '/ore');},
                            ),
                          ),  ]),
                        ]),
                        TableRow( children: [
                          Column(
                            children: <Widget>[
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
                                      child: Text("Filippone Erik"),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text("Tortillas fritte"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children:[Container(
                            margin: EdgeInsets.all(25),
                            child: FlatButton(
                              child: Text('Conferma', style: TextStyle(fontSize: 20.0),),
                              color: Colors.green,
                              textColor: Colors.white,
                              onPressed: () {Navigator.pushNamed(context, '/ore');},
                            ),
                          ),  ]),
                        ]),
                        TableRow( children: [
                          Column(
                            children: <Widget>[
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
                                      child: Text("Filippone Erik"),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text("Lampadina"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children:[Container(
                            margin: EdgeInsets.all(25),
                            child: FlatButton(
                              child: Text('Conferma', style: TextStyle(fontSize: 20.0),),
                              color: Colors.green,
                              textColor: Colors.white,
                              onPressed: () {Navigator.pushNamed(context, '/ore');},
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
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                          color: Colors.black,
                          style: BorderStyle.solid,
                          width: 2),
                        children: [
                          TableRow( children: [
                          Column(
                            children: <Widget>[
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
                                      child: Text("Filippone Erik"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children:[
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  DefaultTextStyle(
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    child: Text("Website builder"),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ]),
                          TableRow( children: [
                            Column(
                              children: <Widget>[
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
                                        child: Text("Filippone Erik"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(children:[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text("Tortillas fritte"),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ]),
                          TableRow( children: [
                            Column(
                              children: <Widget>[
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
                                        child: Text("Filippone Erik"),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(children:[
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text("Lampadina"),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ]),
                        ],
                      ),
                    ),
                  ])
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
                    Navigator.pushNamed(context, '/accetta');
                  },
                  icon: const Icon(Icons.check_outlined),
                  tooltip: 'Accetta',
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
                    Navigator.pushNamed(
                      context,
                      '/profile',
                      arguments: Profile_Passage(
                        "Andrea",
                        "Developer",
                      ),
                    );
                  },
                  icon: const Icon(Icons.person),
                  tooltip: 'Profilo',
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
        ),
      ),
    );
  }
}