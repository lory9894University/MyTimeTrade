import 'package:flutter/material.dart';
import 'package:mytimetrade/screens/Profile_Passage.dart';
import 'package:slider_button/slider_button.dart';

class Swipe extends StatefulWidget {
  @override
  _SwipeState createState() => _SwipeState();
}

class _SwipeState extends State<Swipe> {
  int _selectedIndex = 0;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Profile_Passage args = Profile_Passage('', '', '', '');

  void didChangeDependencies() {
    args = ModalRoute.of(context)?.settings.arguments as Profile_Passage;
    super.didChangeDependencies();
  }

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
        )),
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: 60)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("Conferma dello scambio ore"),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 100)),
            Padding(padding: EdgeInsets.only(top: 50)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("Numero di ore:"),
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text(args.ore),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("Servizio richiesto:"),
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text(args.servizio),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("Da donare a:"),
                  ),
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("${args.nome} ${args.cognome}"),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 100)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SliderButton(
                    width: 400,
                    backgroundColor: Colors.white70,
                    highlightedColor: Colors.green,
                    action: () {
                      ///Do something here
                      Navigator.of(context).pop();
                    },
                    alignLabel: Alignment(0.1, 0),
                    label: Text(
                      "Conferma",
                      style: TextStyle(
                          color: Color(0xff4a4a4a),
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    ),
                    icon: Icon(Icons.handshake, size: 35),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      /*bottomNavigationBar: CurvedNavigationBar(
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
                Navigator.pushNamed(context, '/profile');
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
        )*/
    );
  }
}
