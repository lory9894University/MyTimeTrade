import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../widgets/BottomBar.dart';
import 'Profile_Passage.dart';

//TODO: Implementare il SingleChildScrollView, altrimenti abbiamo un limite di tre transazioni per tabella

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
              physics: NeverScrollableScrollPhysics(),
              children: [
                /*Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 80),
                  child: PaginatedDataTable2(
                    source: MyData(),
                    //header: const Text('My Products'),
                    columns: const [
                      DataColumn2(label: Text('ID'), size: ColumnSize.S,),
                      DataColumn2(label: Text('Name'), size: ColumnSize.L,),
                      DataColumn2(label: Text('Price'))
                    ],
                    columnSpacing: 100,
                    horizontalMargin: 10,
                    rowsPerPage: 9,
                    showCheckboxColumn: false,
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 80),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                              columnSpacing: 12,
                              horizontalMargin: 12,
                              columns: const [
                                DataColumn(label: Text('Nome')),
                                DataColumn(label: Text('Servizio')),
                                DataColumn(label: Text('Ore')),
                                DataColumn(label: Text('Conferma')),
                              ],
                              rows: List<DataRow>.generate(
                                  100,
                                      (index) => DataRow(cells: [
                                        DataCell(Text('A' * (10 - index % 10))),
                                        DataCell(Text('B' * (10 - (index + 5) % 10))),
                                        DataCell(Text('C' * (15 - (index + 5) % 10))),
                                        DataCell(FlatButton(
                                          child: const Text(
                                            'Conferma',
                                            style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,
                                          ),
                                          color: Colors.green,
                                          textColor: Colors.white,
                                          onPressed: () {},
                                        ),
                                        ),
                                      ]
                                      )
                              )
                          )
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 80),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                              columnSpacing: 12,
                              horizontalMargin: 12,
                              columns: const [
                                DataColumn(label: Text('Nome')),
                                DataColumn(label: Text('Servizio')),
                                DataColumn(label: Text('Ore')),
                              ],
                              rows: List<DataRow>.generate(
                                  100,
                                      (index) => DataRow(cells: [
                                    DataCell(Text('A' * (10 - index % 10))),
                                    DataCell(Text('B' * (10 - (index + 5) % 10))),
                                    DataCell(Text('C' * (15 - (index + 5) % 10))),
                                  ]
                                  )
                              )
                          )
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 80),
                  child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                              columnSpacing: 12,
                              horizontalMargin: 12,
                              columns: const [
                                DataColumn(label: Text('Nome')),
                                DataColumn(label: Text('Servizio')),
                                DataColumn(label: Text('Ore')),
                                DataColumn(label: Text('Paga')),
                              ],
                              rows: List<DataRow>.generate(
                                  100,
                                      (index) => DataRow(cells: [
                                    DataCell(Text('A' * (10 - index % 10))),
                                    DataCell(Text('B' * (10 - (index + 5) % 10))),
                                    DataCell(Text('C' * (15 - (index + 5) % 10))),
                                    DataCell(FlatButton(
                                      child: const Text(
                                        'Paga',
                                        style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,
                                      ),
                                      color: Colors.green,
                                      textColor: Colors.white,
                                      onPressed: () {},
                                    ),
                                    ),
                                  ]
                                  )
                              )
                          )
                      )
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 80),
                  child: PaginatedDataTable(
                    source: MyData(),
                    //header: const Text('My Products'),
                    columns: const [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Price'))
                    ],
                    columnSpacing: 100,
                    horizontalMargin: 10,
                    rowsPerPage: 9,
                    showCheckboxColumn: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 80),
                  child: PaginatedDataTable(
                    source: MyData(),
                    //header: const Text('My Products'),
                    columns: const [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Price'))
                    ],
                    columnSpacing: 100,
                    horizontalMargin: 10,
                    rowsPerPage: 9,
                    showCheckboxColumn: false,
                  ),
                ),
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
                                    Expanded(child:
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: //TODO: Change to Text('${args.cognome} ${args.nome}')
                                          Text('Fallino Francesco', textAlign: TextAlign.center),
                                      *//*Text((() {
                                          if(args.nome != ''){
                                            return '${args.cognome} ${args.nome}';
                                          }
                                          else {
                                            return "Fallino Francesco";
                                          }
                                        })()),*//*
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Expanded(child:
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: //TODO: Change to Text(args.servizio)
                                          Text('Unity', textAlign: TextAlign.center),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
                              child: Expanded(child: FlatButton(
                                child: const Text(
                                  'Conferma',
                                  style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,
                                ),
                                color: Colors.green,
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
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
                                    Expanded(child:
                                      DefaultTextStyle(
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        child: Text("Filippone Erik", textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Expanded(child:
                                      DefaultTextStyle(
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        child: Text("Tortillas fritte", textAlign: TextAlign.center),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
                              child: Expanded(child: FlatButton(
                                child: const Text(
                                  'Conferma',
                                  style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,
                                ),
                                color: Colors.green,
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
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
                                    Expanded(child:
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text("Filippone Erik", textAlign: TextAlign.center),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Expanded(child:
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text("Tortillas fritte", textAlign: TextAlign.center),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
                              child: Expanded(child: FlatButton(
                                child: const Text(
                                  'Conferma',
                                  style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,
                                ),
                                color: Colors.green,
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
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
                                    Expanded(child:
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: //TODO: Change to Text('${args.cognome} ${args.nome}')
                                      Text('Fallino Francesco', textAlign: TextAlign.center),
                                      /*Text((() {
                                          if(args.nome != ''){
                                            return '${args.cognome} ${args.nome}';
                                          }
                                          else {
                                            return "Fallino Francesco";
                                          }
                                        })()),*/
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Expanded(child:
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: //TODO: Change to Text(args.servizio)
                                      Text('Unity', textAlign: TextAlign.center),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
                              child: Expanded(child: FlatButton(
                                child: const Text(
                                  'Paga',
                                  style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,
                                ),
                                color: Colors.green,
                                textColor: Colors.white,
                                onPressed: () {},
                              ),
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
                                    Expanded(child:
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text("Filippone Erik", textAlign: TextAlign.center),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Expanded(child:
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text("Tortillas fritte", textAlign: TextAlign.center),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
                              child: Expanded(child: FlatButton(
                                child: const Text(
                                  'Paga',
                                  style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,
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
                                    Expanded(child:
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text("Filippone Erik", textAlign: TextAlign.center),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(padding: EdgeInsets.only(top: 10)),
                              Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Expanded(child:
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text("Tortillas fritte", textAlign: TextAlign.center),
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children: [
                            Container(
                              margin: const EdgeInsets.only(left: 10, right: 10, top: 25, bottom: 25),
                              child: Expanded(child: FlatButton(
                                child: const Text(
                                  'Paga',
                                  style: TextStyle(fontSize: 18.0), textAlign: TextAlign.center,
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
                            ),
                          ]),
                        ]),
                      ],
                    ),
                  ),
                ])),*/
              ],
            ),
          ),
          bottomNavigationBar: BottomBar(index: index, context: context),
        ),
      ),
    );
  }
}

class MyData extends DataTableSource {
  // Generate some made-up data
  final List<Map<String, dynamic>> __data = List.generate(
      200,
          (index) =>
      {
        "id": index,
        "title": "Item $index",
        "price": Random().nextInt(10000),
      });

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => __data.length;

  @override
  int get selectedRowCount => 0;

  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(__data[index]['id'].toString())),
      DataCell(Text(__data[index]["title"])),
      DataCell(Text(__data[index]["price"].toString())),
    ]);
  }
}
