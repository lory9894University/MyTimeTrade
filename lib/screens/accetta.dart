import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mytimetrade/widgets/userSingleton.dart';

import 'Profile_Passage.dart';

class Accetta extends StatefulWidget {
  @override
  _AccettaState createState() => _AccettaState();
}

class _AccettaState extends State<Accetta> {
  //Profile_Passage args = Profile_Passage('', '', '', '');

  /*void didChangeDependencies() {
    args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Profile_Passage;
    super.didChangeDependencies();
  }*/

  @override
  Widget build(BuildContext context) {
    var index = 1;
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            extendBody: true,
            appBar: AppBar(
              toolbarHeight: 0.5,
              bottom: TabBar(
                tabs: [
                  Tab(text: "Da accettare"),
                  Tab(text: "Accettate"),
                  Tab(text: "Da pagare")
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
              )),
              child: TabBarView(
                children: [
                  Center(
                      child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2),
                        children: [
                          TableRow(children: [
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
                                        child: //TODO: Change to Text('${args.cognome} ${args.nome}')
                                            Text('Fallino Francesco'),
                                        /*Text((() {
                                          if(args.nome != ''){
                                            return '${args.cognome} ${args.nome}';
                                          }
                                          else {
                                            return "Fallino Francesco";
                                          }
                                        })()),*/
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
                                        child: //TODO: Change to Text(args.servizio)
                                            Text('Unity'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(children: [
                              Container(
                                margin: EdgeInsets.all(25),
                                child: FlatButton(
                                  child: Text(
                                    'Conferma',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                          ]),
                          TableRow(children: [
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
                            Column(children: [
                              Container(
                                margin: EdgeInsets.all(25),
                                child: FlatButton(
                                  child: Text(
                                    'Conferma',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                          ]),
                          TableRow(children: [
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
                            Column(children: [
                              Container(
                                margin: EdgeInsets.all(25),
                                child: FlatButton(
                                  child: Text(
                                    'Conferma',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                          ]),
                        ],
                      ),
                    ),
                  ])),
                  Center(
                      child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2),
                        children: [
                          TableRow(children: [
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
                            Column(children: [
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
                          TableRow(children: [
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
                            Column(children: [
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
                          TableRow(children: [
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
                            Column(children: [
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
                  ])),
                  Center(
                      child: Column(children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Table(
                        defaultVerticalAlignment:
                            TableCellVerticalAlignment.middle,
                        border: TableBorder.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 2),
                        children: [
                          TableRow(children: [
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
                                        child: //TODO: Change to Text('${args.cognome} ${args.nome}')
                                            Text('Fallino Francesco'),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DefaultTextStyle(
                                        style: const TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        child: //TODO: Change to Text(args.servizio)
                                            Text('Unity'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(children: [
                              Container(
                                margin: EdgeInsets.all(25),
                                child: FlatButton(
                                  child: Text(
                                    'Paga',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  onPressed: () {},
                                ),
                              ),
                            ]),
                          ]),
                          TableRow(children: [
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
                            Column(children: [
                              Container(
                                margin: EdgeInsets.all(25),
                                child: FlatButton(
                                  child: Text(
                                    'Paga',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/swipe',
                                      arguments: Profile_Passage(
                                        "Filippone",
                                        "Erik",
                                        "50",
                                        "Tortillas fritte",
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ]),
                          ]),
                          TableRow(children: [
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
                            Column(children: [
                              Container(
                                margin: EdgeInsets.all(25),
                                child: FlatButton(
                                  child: Text(
                                    'Paga',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      '/swipe',
                                      arguments: Profile_Passage(
                                        "Filippone",
                                        "Erik",
                                        "50",
                                        "Lampadina",
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ]),
                          ]),
                        ],
                      ),
                    ),
                  ])),
                ],
              ),
            ),
            //bottomNavigationBar: BottomBar(index: index, context: context),
            bottomNavigationBar: CurvedNavigationBar(
              index: index,
              backgroundColor: Colors.transparent,
              height: 60,
              onTap: (index) {
                if (index == 0) {
                  Navigator.pushReplacementNamed(context, '/amici');
                } else if (index == 1) {
                  Navigator.pushReplacementNamed(context, '/accetta');
                } else if (index == 2) {
                  Navigator.pushReplacementNamed(context, '/welcome',
                      arguments: logged_user!);
                } else if (index == 3) {
                  Navigator.pushReplacementNamed(context, '/profile',
                      arguments: Profile_Passage("Andrea", "D'Angelo", "", ""));
                } else if (index == 4) {
                  Navigator.pushReplacementNamed(context, '/servizi');
                }
              },
              items: const <Widget>[
                Icon(Icons.handshake, size: 30),
                Icon(Icons.check_outlined, size: 30),
                Icon(Icons.home, size: 30),
                Icon(Icons.person, size: 30),
                Icon(Icons.map, size: 30)
              ],
            )),
      ),
    );
  }
}
