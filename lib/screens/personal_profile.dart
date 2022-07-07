import 'dart:ui';

import 'package:accordion/accordion.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mytimetrade/widgets/custom_dialog_box_interessi.dart';
import 'package:mytimetrade/widgets/global.dart';

import '../widgets/BottomBar.dart';
import '../widgets/custom_dialog_box.dart';

class PersonalProfile extends StatefulWidget {
  @override
  _PersonalProfileState createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController _controller = TextEditingController(); //TODO: questo dovrà essere spostato se la dialog box è un nuovo widget

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
    didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var index = 3;
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Icon(Icons.person, size: 35),
                  DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 27.0,
                        color: Colors.black,
                      ),
                      child: Text(global_user_data!.name))
                ],
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            ExpansionTile(
                title: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Icon(FontAwesomeIcons.locationArrow),
                      Padding(padding: EdgeInsets.only(left: 0)),
                      Center(
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            child: Text("Indirizzo"),
                          )),
                      Padding(padding: EdgeInsets.only(left: 45)),
                    ],
                  ),
                ),
              children: [
                Column(
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
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.pen, size: 20),
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
              ],
            ),
            ExpansionTile(
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Icon(FontAwesomeIcons.phone),
                    Padding(padding: EdgeInsets.only(left: 0)),
                    Center(
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text("Telefono"),
                        )),
                    Padding(padding: EdgeInsets.only(left: 45)),
                  ],
                ),
              ),
              children: [
                Column(
                  children: [
                    TextField(
                    controller: phoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '##########',
                        prefixText: '+ 39',
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 5)),
                    IconButton(
                      icon: const Icon(FontAwesomeIcons.check, size: 20),
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
              ],
            ),
            ExpansionTile(
              title: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Icon(FontAwesomeIcons.briefcase),
                    Padding(padding: EdgeInsets.only(left: 0)),
                    Center(
                        child: DefaultTextStyle(
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text("Interessi"),
                        )),
                    Padding(padding: EdgeInsets.only(left: 45)),
                  ],
                ),
              ),
              children: [
                Column(
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
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return InteressiDialogBox(
                                title: "Inserisci nuovo interesse",
                                img:
                                Image.asset("assets/img/handshake.png"),
                                callback: callback,
                              );
                            });
                      },
                      tooltip: "Aggiungi nuovo interesse",
                    ),
                  ],
                ),
              ],
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
}
