import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../widgets/BottomBar.dart';
import '../widgets/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late User user;
  Map<dynamic, dynamic> pageData = Map.from({"name": "", "balance": "0"});
  List<dynamic> transactions = List.empty(growable: true);

  @override
  initState() {
    super.initState();
    loadUserData();
    setState(() => {});
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
      Map<dynamic, dynamic> transId =
          pageData["transactions"] as Map<dynamic, dynamic>;
      transactions.clear();
      transId.forEach((key, value) {
        DatabaseReference transactionRef =
            FirebaseDatabase.instance.ref('transactions/$value');
        transactionRef.onValue.listen((DatabaseEvent event) {
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
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.greenAccent,
              Colors.blueAccent,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
          child: Column(children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 60)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 27.0,
                      color: Colors.black,
                    ),
                    child: Text("hi".i18n() + pageData["name"] + "!")),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 60)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text("balance".i18n()),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text(
                    pageData["balance"].toString() + " " + "hours".i18n(),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            Flexible(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  String who = "", inOrOut = "";
                  if (transactions[index]["client"] == globalUserData?.uid) {
                    who = transactions[index]["supplier_name"];
                    inOrOut = "-";
                  } else {
                    who = transactions[index]["client_name"];
                    inOrOut = "+";
                  }

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Image.asset(
                        'assets/img/handshake.png',
                        scale: 3,
                      ),
                      Center(
                          child: DefaultTextStyle(
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontSize: 20),
                              child: Text(
                                  who + "\n" + transactions[index]["date"].toString()))),
                      Center(
                          child: DefaultTextStyle(
                              style: const TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.black,
                                  fontSize: 20),
                              child:
                                  Text(inOrOut + transactions[index]["ore"]))),
                    ],
                  );

                  /*ListTile(
                    leading: Image.asset('assets/img/handshake.png'),
                    title: Center(
                        child: DefaultTextStyle(
                            style: const TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontSize: 20),
                            child: Text('date'.i18n() +
                                ": " +
                                transactions[index]["date"] +
                                " , " +
                                "payment".i18n() +
                                ": " +
                                transactions[index]["ore"] +
                                "\n" +
                                "service requested".i18n() +
                                ": " +
                                transactions[index]["description"]))),
                  );*/
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
    if (loggedUser == null) {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          loggedUser = user;
          DatabaseReference userRef =
              FirebaseDatabase.instance.ref('users/${user.uid}');
          userRef.onValue.listen((DatabaseEvent event) {
            var snapshot = event.snapshot.value as Map<dynamic, dynamic>;
            globalUserData = UserData(
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
      user = loggedUser!;
    }
  }
}
