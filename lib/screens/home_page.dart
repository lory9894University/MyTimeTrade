import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)?.settings.arguments as User;
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text("Ciao, Marco!",
                    style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 0.5),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                    width: 50,
                    height: 50,
                    child: Image.asset('assets/img/handshake.png')
                ),
              ),
            ],
          ),
          Row(
            children: [
              Center(
                  child: Text(
                    "Il tuo saldo corrente è: ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
              )
            ],
          ),
          Row(
            children: [
              Center(
                child: Padding(
                  //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                  "xxx euro",
                  ),
                ),
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
