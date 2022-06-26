import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Profile_Passage.dart';

class ServiziElenco extends StatefulWidget {
  @override
  _ServiziElencoState createState() => _ServiziElencoState();
}

class _ServiziElencoState extends State<ServiziElenco> {
  String dropdownvalue = 'Informatica';
  var items = [
    'Informatica',
    'Cucina',
    'Lavori in casa',
    'Lingue straniere',
    'Allenamento',
  ];

  void _goToProfilo(String nome, String cognome) {
    Navigator.pushNamed(
      context,
      '/profile',
      arguments: Profile_Passage(
        nome,
        cognome,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var index = 4;
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
                  children: const <Widget>[
                    Center(
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 40),
                          hintText: 'Inserisci la specifica categoria che ti interessa',
                        ),
                      ),
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
                children: <Widget>[
                  ListTile(
                    onTap: () => _goToProfilo("Andrea", "D'Angelo"),
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Andrea D'Angelo"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('C++'))),
                  ),
                  ListTile(
                    onTap: () => _goToProfilo("Lorenzo", "Dentis"),
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Lorenzo Dentis"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('Unity, JavaScript'))),
                  ),
                  ListTile(
                    onTap: () => _goToProfilo("Francesca", "Rinaldi"),
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Francesca Rinaldi"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('Java'))),
                  ),
                  ListTile(
                    onTap: () => _goToProfilo("Marta", "Meroni"),
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Marta Meroni"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('HTML/CSS'))),
                  ),
                  ListTile(
                    onTap: () => _goToProfilo("Matteo", "Filisti"),
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Matteo Filisti"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('Flutter'))),
                  ),
                  ListTile(
                    onTap: () => _goToProfilo("Sandra", "Keyhole"),
                    dense: true,
                    leading: Icon(Icons.person, size: 35),
                    title: Center(child: DefaultTextStyle(style: TextStyle(color: Colors.black, fontSize: 20), child: Text("Sandra Keyhole"))),
                    subtitle: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 15), child: Text('React, UnReal Engine'))),
                  ),
                  ListTile(
                    onTap: () => _goToProfilo("Marco", "Demasi"),
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
    );
  }
}