import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import 'Profile_Passage.dart';

class InvitaAmici extends StatefulWidget {
  @override
  _InvitaAmiciState createState() => _InvitaAmiciState();
}

class _InvitaAmiciState extends State<InvitaAmici> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var index = 0;
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
                  child: Text("Invita i tuoi amici!"),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 50)),
          Container(
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DefaultTextStyle(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("AMICI RIMANENTI: 3"),
                ),
              ],
            ),
          ),
          Container(
            child: Flexible(
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  ListTile(
                    tileColor: Colors.green,
                    dense: true,
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.circular(10)),
                    title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white, fontSize: 20), child: Text('Alessandro DeMaria'))),
                  ),
                  ListTile(
                    tileColor: Colors.green,
                    dense: true,
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.circular(10)),
                    title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white, fontSize: 20), child: Text('Filippo Lamberti'))),
                  ),
                  ListTile(
                    tileColor: Colors.red,
                    dense: true,
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.circular(10)),
                    title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white, fontSize: 20), child: Text(''))),
                  ),
                  ListTile(
                    tileColor: Colors.red,
                    dense: true,
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.circular(10)),
                    title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white, fontSize: 20), child: Text(''))),
                  ),
                  ListTile(
                    tileColor: Colors.red,
                    dense: true,
                    shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black, width: 3), borderRadius: BorderRadius.circular(10)),
                    title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.white, fontSize: 20), child: Text(''))),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 60)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                  child: TextButton(
                    onPressed: () async {
                        Share.share("Questo è il tuo codice per iscriverti!");
                    },
                    child: const Text('Condividi!', style: TextStyle(color: Colors.white, fontSize: 25)),
                  ),
                ),
              ],
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
                    "",
                    "",
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