import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mytimetrade/screens/Profile_Passage.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/BottomBar.dart';

class PersonalProfile extends StatefulWidget {
  @override
  _PersonalProfileState createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Profile_Passage args = Profile_Passage('', '', '', '');

  void didChangeDependencies() {
    args = ModalRoute.of(context)?.settings.arguments as Profile_Passage;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var index = 3;
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.person, size: 35),
                  DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 27.0,
                        color: Colors.black,
                      ),
                      child: Text('${args.nome} ${args.cognome}'))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("Indirizzo"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Icon(FontAwesomeIcons.pen, size: 10)
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 350),
                    child: const DefaultTextStyle(
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      child: Text("Via Tal dei Tali, 65, 13478, Bergamo"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("Interessi"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  Icon(FontAwesomeIcons.plus, size: 10)
                ],
              ),
            ),
            ListView(
              //TODO: Inserire il simbolo "-" a fianco a ogni testo, per eliminarlo (e far diventare le Icon delle IconButton
              shrinkWrap: true,
              children: const <Widget>[
                ListTile(
                  dense: true,
                  title: Center(
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 15),
                          child: Text('Inglese'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 15),
                          child: Text('Spagnolo'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 15),
                          child: Text('Dolci freddi'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 15),
                          child: Text('Elettronica'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 15),
                          child: Text('Make-up Artist'))),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () async {
                        //TODO:
                      },
                      child: const Text(
                        'Logout',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(index: index, context: context),
    );
  }
  ShowDialog() {

  }
}
