import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mytimetrade/widgets/global.dart';

import '../widgets/BottomBar.dart';
import 'Profile_Passage.dart';

class Accetta extends StatefulWidget {
  @override
  _AccettaState createState() => _AccettaState();
}

class _AccettaState extends State<Accetta> {
  List<dynamic> transactionsPending = List.empty(growable: true);
  List<dynamic> transactionsAccepted = List.empty(growable: true);
  List<dynamic> transactionsToPay = List.empty(growable: true);

  @override
  didChangeDependencies() async {
    DatabaseReference userRef = FirebaseDatabase.instance
        .ref('users/${global_user_data!.uid}/transactions');
    userRef.onValue.listen((DatabaseEvent event) async {
      transactionsPending.clear();
      if (!event.snapshot.exists) {
        return;
      }
      var pageData = event.snapshot.value as Map<dynamic, dynamic>;

      for (var value in pageData.values) {
        DatabaseReference ref =
            FirebaseDatabase.instance.ref('transactions/${value}');
        event = await userRef.once();
        var transaction = event.snapshot.value as Map<dynamic, dynamic>;
        if (transaction['status'] == 'waiting_payment' &&
            transaction['supplier'] != global_user_data!.uid) {
          transactionsToPay.add(transaction);
        } else if (transaction['status'] == 'pending' &&
            transaction['supplier'] == global_user_data!.uid) {
          transactionsPending.add(transaction);
        } else if (transaction['status'] == 'working' &&
            transaction['supplier'] == global_user_data!.uid) {
          transactionsAccepted.add(transaction);
        }
      }

      setState(() => {});
    });

    super.didChangeDependencies();
  }

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
            bottom: const TabBar(
              tabs: [
                const Tab(text: "Da accettare"),
                const Tab(text: "Accettate"),
                const Tab(text: "Da pagare")
              ],
            ),
          ),
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
            child: TabBarView(
              children: [
                Center(
                    child: Column(children: <Widget>[
                  Container(
                    margin: const EdgeInsets.all(20),
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
                                  children: [
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text('Fallino Fraco'),
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
                              margin: const EdgeInsets.all(25),
                              child: FlatButton(
                                child: const Text(
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
                              margin: const EdgeInsets.all(25),
                              child: FlatButton(
                                child: const Text(
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
                              margin: const EdgeInsets.all(25),
                              child: FlatButton(
                                child: const Text(
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
                    margin: const EdgeInsets.all(20),
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
                    margin: const EdgeInsets.all(20),
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
                                          Text('Fallino '),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: //TODO: Change to Text(args.servizio)
                                          const Text('Unity'),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children: [
                            Container(
                              margin: const EdgeInsets.all(25),
                              child: FlatButton(
                                child: const Text(
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
                              margin: const EdgeInsets.all(25),
                              child: FlatButton(
                                child: const Text(
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
                              margin: const EdgeInsets.all(25),
                              child: FlatButton(
                                child: const Text(
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
          bottomNavigationBar: BottomBar(index: index, context: context),
        ),
      ),
    );
  }
}
