import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:localization/localization.dart';
import 'package:mytimetrade/widgets/custom_dialog_box_interessi.dart';
import 'package:mytimetrade/widgets/global.dart';

import '../widgets/BottomBar.dart';
import '../widgets/custom_dialog_box.dart';

class PersonalProfile extends StatefulWidget {
  const PersonalProfile({Key? key}) : super(key: key);

  @override
  _PersonalProfileState createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
  TextEditingController phoneController = TextEditingController();

  List<dynamic> interests = List<dynamic>.empty(growable: true);
  var db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    phoneController.text =
        globalUserData!.phoneNr == null ? "" : globalUserData!.phoneNr!;
  }

  @override
  void didChangeDependencies() {
    interests.clear();
    db
        .collection("interests")
        .where("user_id", isEqualTo: globalUserData!.uid)
        .get()
        .then((event) {
      for (var doc in event.docs) {
        interests.add(<String, dynamic>{"id": doc.id, "data": doc.data()});
      }
      setState(() {});
    });

    super.didChangeDependencies();
  }

  callback(Map<String, dynamic> interest) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      interests.add(interest["interest"]);
      setState(() {});
    }
    didChangeDependencies();
  }

  callback2() {
    didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var index = 3;
    return Scaffold(
      extendBody: true,
      body: Container(
        height: 1000,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.greenAccent,
            Colors.blueAccent,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        )),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 60)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  const Icon(Icons.person, size: 35),
                  DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 27.0,
                        color: Colors.black,
                      ),
                      child: Text(globalUserData!.name))
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              ExpansionTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Icon(FontAwesomeIcons.locationArrow),
                    const Padding(padding: EdgeInsets.only(left: 0)),
                    Center(
                        child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text("address".i18n()),
                    )),
                    const Padding(padding: EdgeInsets.only(left: 45)),
                  ],
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
                        child: Text(globalUserData!.address == null
                            ? "insert address".i18n()
                            : globalUserData!.address!),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.pen, size: 20),
                        onPressed: () async {
                          var connectivityResult =
                              await Connectivity().checkConnectivity();
                          if (connectivityResult == ConnectivityResult.none) {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('error'.i18n()),
                                content: Text('address offline'.i18n()),
                                actions: <Widget>[
                                  FlatButton(
                                    child: const Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                            return;
                          }
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialogBox(
                                  title: "edit address".i18n(),
                                  descriptions: "edit address".i18n(),
                                  img: Image.asset("assets/img/handshake.png"),
                                  callback: callback2,
                                );
                              });
                        },
                        tooltip: "edit address".i18n(),
                      ),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Icon(FontAwesomeIcons.phone),
                    const Padding(padding: EdgeInsets.only(left: 0)),
                    Center(
                        child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text("phoneNr".i18n()),
                    )),
                    const Padding(padding: EdgeInsets.only(left: 45)),
                  ],
                ),
                children: [
                  Column(
                    children: [
                      TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'phoneNr'.i18n(),
                          hintText: '##########',
                          prefixText: '+ 39',
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 5)),
                      IconButton(
                        icon: const Icon(FontAwesomeIcons.check, size: 20),
                        onPressed: () async {
                          var connectivityResult =
                              await Connectivity().checkConnectivity();
                          if (connectivityResult == ConnectivityResult.none) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(offlineSnackBar);
                          }
                          FirebaseDatabase.instance
                              .ref()
                              .child("users")
                              .child(loggedUser!.uid)
                              .update({
                            "phoneNr": phoneController.text,
                          });
                          globalUserData!.phoneNr = phoneController.text;
                          setState(() {});
                        },
                        tooltip: "edit phoneNr".i18n(),
                      ),
                    ],
                  ),
                ],
              ),
              ExpansionTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Icon(FontAwesomeIcons.briefcase),
                    const Padding(padding: EdgeInsets.only(left: 0)),
                    Center(
                        child: DefaultTextStyle(
                      style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text("interests".i18n()),
                    )),
                    const Padding(padding: EdgeInsets.only(left: 45)),
                  ],
                ),
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                            itemCount: interests.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                dense: true,
                                leading:
                                    const Icon(FontAwesomeIcons.ban, size: 20),
                                onTap: () {
                                  db
                                      .collection("interests")
                                      .doc(interests[index]["id"])
                                      .delete();
                                  interests.removeAt(index);
                                  setState(() {});
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
                                  title: "insert new interest".i18n(),
                                  img: Image.asset("assets/img/handshake.png"),
                                  callback: callback,
                                );
                              });
                        },
                        tooltip: "interest".i18n(),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 20)),
              Row(
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
                        loggedUser = null;
                        globalUserData = null;
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
              const Padding(padding: EdgeInsets.only(top: 80)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(index: index, context: context),
    );
  }
}
