import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  late User user;
  Map<dynamic, dynamic> userData = Map.from({"name": "", "dummyBalance": "0"});
  List<dynamic> transactions = List.empty(growable: true);
  @override
  void didChangeDependencies() {
    user = ModalRoute.of(context)?.settings.arguments as User;
    super.didChangeDependencies();

    DatabaseReference userRef =
        FirebaseDatabase.instance.ref('users/${user.uid}');
    userRef.onValue.listen((DatabaseEvent event) {
      userData = event.snapshot.value as Map<dynamic, dynamic>;

      List<Object?> trans_id = userData["transactions"] as List<Object?>;
      transactions.clear();
      trans_id.forEach((value) {
        DatabaseReference transaction_ref =
            FirebaseDatabase.instance.ref('transaction/${value}');
        transaction_ref.onValue.listen((DatabaseEvent event) {
          print(event.snapshot.value);
          transactions.add(event.snapshot.value);
          setState(() => {});
        });
      });

      setState(() => {});
    });

    //Query transactions_query = ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
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
                  child: Text(
                      "Ciao, ${userData["name"]}!")), //todo: torna indietro a "Ciao, ${userData["name"]}!"
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
          child: Row(
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
          child: ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset('assets/img/handshake.png'),
                title: Center(
                    child: DefaultTextStyle(
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontSize: 20),
                        child: Text(
                            'data: ${transactions[index]["date"]}, importo: ${transactions[index]["amount"]}  '))),
              );
            },
            shrinkWrap: true,
          ),
        ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        //TODO: Fare navigazione con bottoni
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
