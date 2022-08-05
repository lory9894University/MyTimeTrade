import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:mytimetrade/widgets/global.dart';

import '../widgets/BottomBar.dart';

//TODO: Implementare il SingleChildScrollView, altrimenti abbiamo un limite di tre transazioni per tabella

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
            bottom: TabBar(
              tabs: [
                Tab(text: "to accept".i18n()),
                Tab(text: "accepted".i18n()),
                Tab(text: "to pay".i18n())
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
              physics: NeverScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 5, right: 5, bottom: 80),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                              columnSpacing: 12,
                              horizontalMargin: 12,
                              columns: [
                                DataColumn(label: Text('name'.i18n())),
                                DataColumn(label: Text('service'.i18n())),
                                DataColumn(label: Text('hours'.i18n())),
                                DataColumn(label: Text('confirm'.i18n())),
                              ],
                              rows: List<DataRow>.generate(
                                  transactionsPending.length,
                                  (index) => DataRow(cells: [
                                        DataCell(Text(transactionsPending[index]
                                            ['client_name'])),
                                        DataCell(Text(transactionsPending[index]
                                            ['description'])),
                                        DataCell(Text(
                                            transactionsPending[index]['ore'])),
                                        DataCell(
                                          FlatButton(
                                            child: Text(
                                              'confirm'.i18n(),
                                              style: TextStyle(fontSize: 18.0),
                                              textAlign: TextAlign.center,
                                            ),
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            onPressed: () async {
                                              var connectivityResult =
                                                  await Connectivity()
                                                      .checkConnectivity();
                                              if (connectivityResult ==
                                                  ConnectivityResult.none) {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                        offlineSnackBar);
                                              }
                                              DatabaseReference ref =
                                                  FirebaseDatabase.instance.ref(
                                                      'transactions/${transactionsPending[index]['timestamp']}');
                                              ref.update({'status': 'working'});
                                              didChangeDependencies();
                                            },
                                          ),
                                        ),
                                      ]))))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 5, right: 5, bottom: 80),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                              columnSpacing: 12,
                              horizontalMargin: 12,
                              columns: [
                                DataColumn(label: Text('name'.i18n())),
                                DataColumn(label: Text('service'.i18n())),
                                DataColumn(label: Text('hours'.i18n())),
                              ],
                              rows: List<DataRow>.generate(
                                  transactionsAccepted.length,
                                  (index) => DataRow(cells: [
                                        DataCell(Text(
                                            transactionsAccepted[index]
                                                ['client_name'])),
                                        DataCell(Text(
                                            transactionsAccepted[index]
                                                ['description'])),
                                        DataCell(Text(
                                            transactionsAccepted[index]
                                                ['ore'])),
                                      ]))))),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, left: 5, right: 5, bottom: 80),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                              columnSpacing: 12,
                              horizontalMargin: 12,
                              columns: [
                                DataColumn(label: Text('name'.i18n())),
                                DataColumn(label: Text('service'.i18n())),
                                DataColumn(label: Text('hours'.i18n())),
                                DataColumn(label: Text('confirm'.i18n())),
                              ],
                              rows: List<DataRow>.generate(
                                  transactionsToPay.length,
                                  (index) => DataRow(cells: [
                                        DataCell(Text(transactionsToPay[index]
                                            ['client_name'])),
                                        DataCell(Text(transactionsToPay[index]
                                            ['description'])),
                                        DataCell(Text(
                                            transactionsToPay[index]['ore'])),
                                        DataCell(
                                          FlatButton(
                                            child: Text(
                                              'pay'.i18n(),
                                              style: TextStyle(fontSize: 18.0),
                                              textAlign: TextAlign.center,
                                            ),
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, '/swipe',
                                                  arguments:
                                                      Map<String, String>.from(
                                                          transactionsToPay[
                                                              index]));
                                            },
                                          ),
                                        ),
                                      ]))))),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomBar(index: index, context: context),
        ),
      ),
    );
  }
}
