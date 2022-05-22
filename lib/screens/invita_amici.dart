import 'package:flutter/material.dart';

class InvitaAmici extends StatefulWidget {
  @override
  _InvitaAmiciState createState() => _InvitaAmiciState();
}

class _InvitaAmiciState extends State<InvitaAmici> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Invita i tuoi amici!",
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 0.5),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("AMICI"),
                ],
              ),
              VerticalDivider( //todo: capire il funzionamento
                width: 20,
                thickness: 1,
                indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),
              Column(
                children: <Widget>[
                  Text("Rimanenti: XXX"),
                ],
              ),
            ],
          ),
          Flexible(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Text('Map'),
                ),
              ],
            ),
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
    );
  }
}