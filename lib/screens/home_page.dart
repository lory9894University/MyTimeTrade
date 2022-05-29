import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mytimetrade/screens/invita_amici.dart';
import 'package:mytimetrade/screens/servizi_elenco.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  late User user;
  late Map<dynamic, dynamic> userData;

@override
  void didChangeDependencies() {
    user = ModalRoute.of(context)?.settings.arguments as User;
    super.didChangeDependencies();

    DatabaseReference userRef =
        FirebaseDatabase.instance.ref('users/${user.uid}');
    userRef.onValue.listen((DatabaseEvent event) {
      userData = event.snapshot.value as Map<dynamic, dynamic>;
      setState(() => {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 60)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 27.0,
                    color: Colors.black,
                  ),
                  child: Text("Ciao, ${userData["name"]}!")
                  ), //todo: torna indietro a "Ciao, ${userData["name"]}!"
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    icon: const Icon(Icons.person, size: 35))
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 60)),
          Container(
            child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                      child: Text("Il tuo saldo corrente è: "),
                    ),
                ],
              ),
          ),
          Padding(padding: EdgeInsets.only(top: 15)),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 40.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      ),
                    child: Text(
                      "${userData["dummyBalance"]} ore", //todo: torna indietro a "${userData["dummyBalance"]} euro",
                    ),
                ),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 30)),
          Flexible(
            //per le liste usare questo https://pub.dev/documentation/firebase_database/latest/ui_firebase_animated_list/FirebaseAnimatedList-class.html
            //TODO: Cambiare in lista lunga
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 20), child: Text('Alessandro DeMaria'))),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 20), child: Text('Filippo Lamberti'))),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 20), child: Text('Ichi Sakinawa'))),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 20), child: Text('Jade LaForlì'))),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Center(child: DefaultTextStyle(style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black, fontSize: 20), child: Text('Andrea Simonei'))),
                ),
              ],
            ),
          ),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar( //TODO: Fare navigazione con bottoni
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
