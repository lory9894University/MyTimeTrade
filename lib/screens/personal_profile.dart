import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mytimetrade/widgets/global.dart';
import 'package:accordion/accordion.dart';

import '../widgets/BottomBar.dart';
import '../widgets/custom_dialog_box.dart';

class PersonalProfile extends StatefulWidget {
  @override
  _PersonalProfileState createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  callback() {
    setState(() {});
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
                      child: Text('${global_user_data!.name}'))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Accordion(
                maxOpenSections: 1,
                scaleWhenAnimating: false,
                openAndCloseAnimation: true,
                headerBackgroundColor: Colors.transparent,
                headerBackgroundColorOpened: Colors.transparent,
                children: [
                  AccordionSection(
                    leftIcon: Icon(FontAwesomeIcons.locationArrow),
                    header: const Center(
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text("Indirizzo"),
                        )
                    ),
                    content: Column(
                      children: [
                        DefaultTextStyle(
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          child: Text(global_user_data!.address == null
                              ? "inserisci indirizzo" : global_user_data!.address!),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.pen, size: 20),
                          //onPressed: modifyAddress,
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialogBox(
                                    title: "Modifica indirizzo",
                                    descriptions: "modifica indirizzo",
                                    img: Image.asset("assets/img/handshake.png"),
                                    callback: callback,
                                  );
                                });
                          },
                          tooltip: "Modifica indirizzo",
                        ),
                      ],
                    ),
                  ),
                  AccordionSection(
                    leftIcon: Icon(FontAwesomeIcons.phone),
                    header: const Center(
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text("Telefono"),
                        )
                    ),
                    content: Column(
                      children: [
                        const TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Telefono',
                              hintText: '3425934167',
                              /*errorText: validator._validEmail
                                  ? null
                                  : validator._emailError*/
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.pen, size: 20),
                          //onPressed: modifyAddress,
                          onPressed: () {
                          },
                          tooltip: "Modifica telefono",
                        ),
                      ],
                    ),
                  ),
                  AccordionSection(
                    leftIcon: Icon(FontAwesomeIcons.briefcase),
                    header: const Center(
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text("Interessi"),
                        )
                    ),
                    content: Column(children: [
                      Container(
                      height: 180,
                      child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        ListTile(
                          dense: true,
                          leading: const Icon(FontAwesomeIcons.ban, size: 20),
                          onTap: () {}, //TODO: Chiedere conferma eliminazione con dialogBox
                          title: const Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 15),
                                child: Text('Inglese')
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(FontAwesomeIcons.ban, size: 20),
                          onTap: () {}, //TODO: Chiedere conferma eliminazione con dialogBox
                          title: const Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 15),
                                child: Text('Spagnolo')
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(FontAwesomeIcons.ban, size: 20),
                          onTap: () {}, //TODO: Chiedere conferma eliminazione con dialogBox
                          title: const Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 15),
                                child: Text('Dolci freddi')
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(FontAwesomeIcons.ban, size: 20),
                          onTap: () {}, //TODO: Chiedere conferma eliminazione con dialogBox
                          title: const Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 15),
                                child: Text('Elettronica')
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(FontAwesomeIcons.ban, size: 20),
                          onTap: () {}, //TODO: Chiedere conferma eliminazione con dialogBox
                          title: const Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 15),
                                child: Text('Make-up Artist')
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(FontAwesomeIcons.ban, size: 20),
                          onTap: () {}, //TODO: Chiedere conferma eliminazione con dialogBox
                          title: const Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 15),
                                child: Text('Inglese')
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(FontAwesomeIcons.ban, size: 20),
                          onTap: () {}, //TODO: Chiedere conferma eliminazione con dialogBox
                          title: const Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 15),
                                child: Text('Spagnolo')
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(FontAwesomeIcons.ban, size: 20),
                          onTap: () {}, //TODO: Chiedere conferma eliminazione con dialogBox
                          title: const Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 15),
                                child: Text('Dolci freddi')
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(FontAwesomeIcons.ban, size: 20),
                          onTap: () {}, //TODO: Chiedere conferma eliminazione con dialogBox
                          title: const Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 15),
                                child: Text('Elettronica')
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: const Icon(FontAwesomeIcons.ban, size: 20),
                          onTap: () {}, //TODO: Chiedere conferma eliminazione con dialogBox
                          title: const Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.black,
                                    fontSize: 15),
                                child: Text('Make-up Artist')
                            ),
                          ),
                        ),
                      ],
                    ),
                    ),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.plus, size: 20),
                        //onPressed: modifyAddress,
                        onPressed: () {
                        },
                        tooltip: "Aggiungi nuovo interesse",
                      ),
                    ],
                    ),
                  )
                ]
            ),
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
                        await FirebaseAuth.instance.signOut();
                        logged_user = null;
                        global_user_data = null;
                        Navigator.pushReplacementNamed(context, '/');
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

  modifyAddress() {}
}
