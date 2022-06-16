import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class ServiziElenco extends StatefulWidget {
  @override
  _ServiziElencoState createState() => _ServiziElencoState();
}

class _ServiziElencoState extends State<ServiziElenco> {
  int _selectedIndex = 0;
  String dropdownvalue = 'Informatica';
  var items = [
    'Informatica',
    'Cucina',
    'Lavori in casa',
    'Lingue straniere',
    'Allenamento',
  ];

  @override
  Widget build(BuildContext context) {
    var index = 1;
    final items_nav = <Widget>[
      const Icon(Icons.handshake, size: 30),
      const Icon(Icons.home, size: 30),
      const Icon(Icons.map, size: 30),
    ];
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
                  child: Text("Servizi"),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                DropdownButton(
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 18), child: Text(items))),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 18), child: Text('Programmazione'))),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: Flexible( //TODO: Cambiare in lista infinita
              child: ListView(
                shrinkWrap: true,
                children: const <Widget>[
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("D'Angelo Andrea"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('C++'))),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Lorenzo Dentis"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('Unity, JavaScript'))),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Francesca Rinaldi"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('Java'))),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Marta Meroni"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('HTML/CSS'))),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Matteo Filisti"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('Flutter'))),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Sandra Keyhole"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('React, UnReal Engine'))),
                  ),
                  ListTile(
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Marco Demasi"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('Vue.js'))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: index,
          backgroundColor: Colors.transparent,
          height: 60,
          items: items_nav,
        )
    );
  }
}