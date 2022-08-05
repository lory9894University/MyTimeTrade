import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../widgets/BottomBar.dart';
import '../widgets/global.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User user;
  Map<dynamic, dynamic> pageData = Map.from({"name": "", "balance": "0"});
  List<dynamic> transactions = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  @override
  Future<void> didChangeDependencies() async {
    user = ModalRoute.of(context)?.settings.arguments as User;
    super.didChangeDependencies();

    DatabaseReference userRef =
        FirebaseDatabase.instance.ref('users/${user.uid}');
    DatabaseEvent event = await userRef.once();
    pageData = event.snapshot.value as Map<dynamic, dynamic>;

    if (pageData["transactions"] != null) {
      Map<dynamic, dynamic> trans_id =
          pageData["transactions"] as Map<dynamic, dynamic>;
      transactions.clear();
      trans_id.forEach((key, value) {
        DatabaseReference transaction_ref =
            FirebaseDatabase.instance.ref('transactions/${value}');
        transaction_ref.onValue.listen((DatabaseEvent event) {
          var transaction = event.snapshot.value as Map<dynamic, dynamic>;
          if (transaction['status'] == 'completed') {
            transactions.add(transaction);
            setState(() => {});
          }
        });
      });
    }

    setState(() => {});

    //Query transactions_query = ;
  }

  @override
  Widget build(BuildContext context) {
    var index = 2;
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
          )),
          child: Column(children: <Widget>[
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
                      child: Text("Ciao, ${pageData["name"]}!")),
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
                      "${pageData["balance"]} ore",
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
                                'data: ${transactions[index]["date"]}, importo: ${transactions[index]["ore"]} \n lavoro svolto: ${transactions[index]["description"]}'))),
                  );
                },
                shrinkWrap: true,
              ),
            ),
          ]),
        ),
        bottomNavigationBar: BottomBar(
          index: index,
          context: context,
        ));
  }

  loadUserData() async {
    if (logged_user == null) {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          logged_user = user;
          DatabaseReference userRef =
              FirebaseDatabase.instance.ref('users/${user.uid}');
          userRef.onValue.listen((DatabaseEvent event) {
            var snapshot = event.snapshot.value as Map<dynamic, dynamic>;
            global_user_data = UserData(
                snapshot["address"],
                snapshot["services"],
                snapshot["name"],
                user,
                snapshot["phoneNr"],
                snapshot["lat"],
                snapshot["lng"]);
          });
        }
      });
    } else {
      user = logged_user!;
    }
  }
}
