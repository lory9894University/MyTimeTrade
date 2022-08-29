import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:mytimetrade/widgets/global.dart';

import '../widgets/BottomBar.dart';

class Accetta extends StatefulWidget {
  const Accetta({Key? key}) : super(key: key);

  @override
  _AccettaState createState() => _AccettaState();
}

class _AccettaState extends State<Accetta> {
  List<dynamic> transactionsPending = List.empty(growable: true);
  List<dynamic> transactionsAccepted = List.empty(growable: true);
  List<dynamic> transactionsToPay = List.empty(growable: true);

  @override
  didChangeDependencies() {
    List<Map<String, String>> args =
        ModalRoute.of(context)?.settings.arguments as List<Map<String, String>>;
    transactionsPending.add(args[0]);
    transactionsAccepted.add(args[1]);
    transactionsToPay.add(args[2]);

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
                Tab(key: Key("accept"), text: "to accept".i18n()),
                Tab(key: Key("accepted"), text: "accepted".i18n()),
                Tab(key: Key("to_pay"), text: "to pay".i18n())
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
              physics: const NeverScrollableScrollPhysics(),
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
                                              style: const TextStyle(
                                                  fontSize: 18.0),
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
                                              style: const TextStyle(
                                                  fontSize: 18.0),
                                              textAlign: TextAlign.center,
                                            ),
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            onPressed: () async {
                                              await Navigator.pushNamed(
                                                  context, '/swipe',
                                                  arguments:
                                                      Map<String, String>.from(
                                                          transactionsToPay[
                                                              index]));
                                              didChangeDependencies();
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
