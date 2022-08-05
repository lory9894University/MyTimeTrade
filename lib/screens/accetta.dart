import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mytimetrade/widgets/global.dart';

import '../widgets/BottomBar.dart';

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
      transactionsAccepted.clear();
      transactionsToPay.clear();
      if (!event.snapshot.exists) {
        return;
      }
      var pageData = event.snapshot.value as Map<dynamic, dynamic>;

      for (var value in pageData.values) {
        DatabaseReference ref =
            FirebaseDatabase.instance.ref('transactions/${value}');
        event = await ref.once();
        var transaction = event.snapshot.value as Map<dynamic, dynamic>;
        if (transaction['status'] == 'working' &&
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
                        for (var transaction in transactionsPending)
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
                                        child: Text(transaction['client_name']),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DefaultTextStyle(
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        child: Text(transaction['description']),
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
                                  onPressed: () {
                                    DatabaseReference ref =
                                        FirebaseDatabase.instance.ref(
                                            'transactions/${transaction['timestamp']}');
                                    ref.update({'status': 'working'});
                                    didChangeDependencies();
                                  },
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
                        for (var transaction in transactionsAccepted)
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
                                        child:
                                            Text(transaction['supplier_name']),
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
                                  children: [
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text(transaction['description']),
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
                        for (var transaction in transactionsToPay)
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
                                        child:
                                            Text(transaction['supplier_name']),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      DefaultTextStyle(
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        child: Text(transaction['description']),
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
                                    Navigator.pushNamed(context, '/swipe',
                                        arguments: Map<String, String>.from(
                                            transaction));
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
