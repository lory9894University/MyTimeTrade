import 'dart:ui';

import 'package:accordion/accordion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:mytimetrade/widgets/global.dart';

import '../widgets/BottomBar.dart';
import '../widgets/custom_dialog_box.dart';

class PersonalProfile extends StatefulWidget {
  @override
  _PersonalProfileState createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController _controller =
      TextEditingController(); //TODO: questo dovrà essere spostato se la dialog box è un nuovo widget

  List<dynamic> interests = List<dynamic>.empty(growable: true);
  var db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    phoneController.text =
        global_user_data!.phoneNr == null ? "" : global_user_data!.phoneNr!;
  }

  @override
  void didChangeDependencies() {
    interests.clear();
    db
        .collection("interests")
        .where("user_id", isEqualTo: global_user_data!.uid)
        .get()
        .then((event) {
      for (var doc in event.docs) {
        interests.add(<String, dynamic>{"id": doc.id, "data": doc.data()});
      }
      setState(() {});
    });
  }

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
                    )),
                    content: Column(
                      children: [
                        DefaultTextStyle(
                          style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 15.0,
                            color: Colors.black,
                          ),
                          child: Text(global_user_data!.address == null
                              ? "inserisci indirizzo"
                              : global_user_data!.address!),
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
                                    img:
                                        Image.asset("assets/img/handshake.png"),
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
                    )),
                    content: Column(
                      children: [
                        TextField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Telefono',
                            hintText: '##########',
                            prefixText: '+ 39',
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5)),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.pen, size: 20),
                          onPressed: () {
                            FirebaseDatabase.instance
                                .ref()
                                .child("users")
                                .child(logged_user!.uid)
                                .update({
                              "phoneNr": phoneController.text,
                            });
                            global_user_data!.phoneNr = phoneController.text;
                            setState(() {});
                          },
                          tooltip: "Modifica telefono",
                        ),
                      ],
                    ),
                  ),
                  AccordionSection(
                    //TODO: l'accordion collassa quando modifico un elemento.
                    leftIcon: Icon(FontAwesomeIcons.briefcase),
                    header: const Center(
                        child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text("Interessi"),
                    )),
                    content: Column(
                      children: [
                        Container(
                          height: 180,
                          child: ListView.builder(
                              itemCount: interests.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  dense: true,
                                  leading: const Icon(FontAwesomeIcons.ban,
                                      size: 20),
                                  onTap: () {
                                    db
                                        .collection("interests")
                                        .doc(interests[index]["id"])
                                        .delete()
                                        .then(
                                          (doc) => print(
                                              "Document deleted"), //TODO: modificare in una snackbar
                                          onError: (e) => print(
                                              "Error updating document $e"),
                                        );
                                    didChangeDependencies();
                                  }, //TODO: Chiedere conferma eliminazione con dialogBox
                                  title: Center(
                                    child: DefaultTextStyle(
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
                                            color: Colors.black,
                                            fontSize: 15),
                                        child: Text(interests[index]["data"]
                                            ["interest"])),
                                  ),
                                );
                              }),
                        ),
                        IconButton(
                          icon: const Icon(FontAwesomeIcons.plus, size: 20),
                          //onPressed: modifyAddress,
                          onPressed: () {},
                          tooltip: "Aggiungi nuovo interesse",
                        ),
                      ],
                    ),
                  )
                ]),
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
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'interessi',
                    hintText: 'Inserire interessi',
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  if (_controller.text.isEmpty) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'specifica interesse',
                        textAlign: TextAlign.center,
                      )));
                    }
                    return;
                  }
                  if (global_user_data!.lat != null &&
                      global_user_data!.lng != null) {
                    final _geo = Geoflutterfire();
                    final _firestore = FirebaseFirestore.instance;
                    GeoFirePoint myLocation = _geo.point(
                        latitude: global_user_data!.lat!,
                        longitude: global_user_data!.lng!);
                    final interest = <String, dynamic>{
                      'interest': _controller.text,
                      'user': global_user_data!.name,
                      'user_id': global_user_data!.uid,
                      'position': myLocation.data,
                    };
                    _firestore.collection('interests').add(interest);
                    didChangeDependencies();
                  } else {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                        'prima imposta il tuo indirizzo',
                        textAlign: TextAlign.center,
                      )));
                    }
                  }
                },
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
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
