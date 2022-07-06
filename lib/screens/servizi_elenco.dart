import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';

import '../widgets/BottomBar.dart';
import 'Profile_Passage.dart';

class ServiziElenco extends StatefulWidget {
  @override
  _ServiziElencoState createState() => _ServiziElencoState();
}

class _ServiziElencoState extends State<ServiziElenco> {
  String servizio = '';
  List<dynamic> interests = List<dynamic>.empty(growable: true);
  FirebaseFirestore db = FirebaseFirestore.instance;

  void _goToProfilo(String nome, String cognome) {
    Navigator.pushNamed(
      context,
      '/profile',
      arguments: Profile_Passage(nome, cognome, "", "Unity"),
    );
  }

  void checkInterests() async {
    Geoflutterfire geo = Geoflutterfire();
    LocationData location = await currentLocation();
    GeoFirePoint center =
        geo.point(latitude: location.latitude!, longitude: location.longitude!);

    interests.clear();
    db.collection("interests").get().then((event) {
      for (var doc in event.docs) {
        interests.add(<String, dynamic>{"id": doc.id, "data": doc.data()});
      }
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    checkInterests();
  }

  @override
  Widget build(BuildContext context) {
    var index = 4;
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
                      child: Text("Servizi"),
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: const <Widget>[
                        Center(
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 40),
                              hintText:
                                  'Inserisci la specifica categoria che ti interessa',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                child: Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: interests.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {},
                        dense: true,
                        leading: Icon(Icons.person, size: 35),
                        title: Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                child: Text(
                                    "${interests[index]["data"]["user"]} \n ${interests[index]["data"]["interest"]}"))),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
          index: index,
          context: context,
        ));
  }

  Future<LocationData> currentLocation() async {
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
    return _locationData;
  }
}
