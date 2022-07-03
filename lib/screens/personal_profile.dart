import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart';
import 'package:mytimetrade/widgets/userSingleton.dart';

import '../widgets/BottomBar.dart';
import '../widgets/custom_dialog_box.dart';

class PersonalProfile extends StatefulWidget {
  @override
  _PersonalProfileState createState() => _PersonalProfileState();
}

class _PersonalProfileState extends State<PersonalProfile> {
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
            Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("Indirizzo"),
                  ),
                  Padding(padding: EdgeInsets.only(left: 10)),
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.pen, size: 10),
                    //onPressed: modifyAddress,
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return CustomDialogBox(
                              title: "Modifica indirizzo",
                              descriptions: "Hii all this is a custom dialog in flutter and you will be use in your flutter applications",
                              img: Image.asset("assets/img/handshake.png"),
                            );
                          }
                      );
                    },
                    tooltip: "Modifica indirizzo",
                  ),
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
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      child: Text(
                          global_user_data!.address == null ? "inserisci indirizzo" : global_user_data!.address!),
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

  modifyAddress() {

  }

  /*modifyAddress() {
    TextEditingController addressController = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Modifica indirizzo"),
            content: TextField(
              //TODO: trasformalo in testo modificabile
              controller: addressController,
              decoration: InputDecoration(
                labelText: "Indirizzo",
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("usa posizione corrente"),
                onPressed: () async {
                  String address = await currentLocation();
                  addressController.text = address;
                  setState(() {});
                },
              ),
              TextButton(
                child: Text("Conferma"),
                onPressed: () {
                  FirebaseDatabase.instance
                      .ref()
                      .child("users")
                      .child(logged_user!.uid)
                      .update({
                    "address": addressController.text,
                  });
                  global_user_data!.address = addressController.text;
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  Future<String> currentLocation() async {
    Location location = new Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
    }

    _locationData = await location.getLocation();

    List<geocoding.Placemark> placemarks =
        await geocoding.placemarkFromCoordinates(
            _locationData.latitude!, _locationData.longitude!);
    return "${placemarks[0].thoroughfare}, ${placemarks[0].subThoroughfare}, ${placemarks[0].locality}, ${placemarks[0].postalCode}, ${placemarks[0].country}";
  }*/
}
