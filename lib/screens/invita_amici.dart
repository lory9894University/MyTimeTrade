import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:share_plus/share_plus.dart';

import '../widgets/BottomBar.dart';

class InvitaAmici extends StatefulWidget {
  @override
  _InvitaAmiciState createState() => _InvitaAmiciState();
}

class _InvitaAmiciState extends State<InvitaAmici> {
  @override
  Widget build(BuildContext context) {
    var index = 0;
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
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 60)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 30.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text("invite".i18n()),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 50)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("invited friends".i18n()),
                  ),
                ],
              ),
              Flexible(
                child: ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    ListTile(
                      tileColor: Colors.green,
                      dense: true,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(10)),
                      title: const Center(
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontSize: 20),
                              child: Text('Alessandro DeMaria'))),
                    ),
                    ListTile(
                      tileColor: Colors.green,
                      dense: true,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(10)),
                      title: const Center(
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontSize: 20),
                              child: Text('Filippo Lamberti'))),
                    ),
                    ListTile(
                      tileColor: Colors.red,
                      dense: true,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(10)),
                      title: const Center(
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontSize: 20),
                              child: Text(''))),
                    ),
                    ListTile(
                      tileColor: Colors.red,
                      dense: true,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(10)),
                      title: const Center(
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontSize: 20),
                              child: Text(''))),
                    ),
                    ListTile(
                      tileColor: Colors.red,
                      dense: true,
                      shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.circular(10)),
                      title: const Center(
                          child: DefaultTextStyle(
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white,
                                  fontSize: 20),
                              child: Text(''))),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 60)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () async {
                        Share.share("Questo è il tuo codice per iscriverti!");
                      },
                      child: Text('share'.i18n(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(index: index, context: context));
  }
}
