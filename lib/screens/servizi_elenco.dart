import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';
import 'package:mytimetrade/widgets/global.dart';

import '../widgets/BottomBar.dart';

class ServiziElenco extends StatefulWidget {
  @override
  _ServiziElencoState createState() => _ServiziElencoState();
}

class _ServiziElencoState extends State<ServiziElenco> {
  String servizio = '';
  List<dynamic> interests = List<dynamic>.empty(growable: true);
  TextEditingController _controller = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;

  void checkInterests() async {
    FocusManager.instance.primaryFocus?.unfocus();
    showDialog(
        barrierColor: Colors.black.withOpacity(0),
        context: context,
        builder: (BuildContext context) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child:
                      const CircularProgressIndicator(), //TODO: scegliere un bel colore
                )
              ],
            ),
          );
        });
    Geoflutterfire geo = Geoflutterfire();
    LocationData location = await currentLocation();
    GeoFirePoint center =
        geo.point(latitude: location.latitude!, longitude: location.longitude!);

    interests.clear();
    Stream<List<DocumentSnapshot>> stream = geo
        .collection(collectionRef: db.collection('interests'))
        .within(
            center: center,
            radius: global_user_data!.radius,
            field: 'position');
    stream.listen((List<DocumentSnapshot> documentList) {
      for (DocumentSnapshot document in documentList) {
        var data = document.data() as Map<dynamic, dynamic>;
        if (data['user_id'] != global_user_data!.uid) {
          String interestDescription = data['interest'];
          if (_controller.text.isEmpty ||
              interestDescription
                  .toLowerCase()
                  .contains(_controller.text.toLowerCase())) {
            interests.add(
                <String, dynamic>{"id": document.id, "data": document.data()});
          }
        }
      }
      setState(() {});
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    var index = 4;
    return Scaffold(
        extendBody: true,
        body: Container(
          decoration: const BoxDecoration(
              gradient: const LinearGradient(
            colors: [
              Colors.greenAccent,
              Colors.blueAccent,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
          child: Column(
            children: <Widget>[
              const Padding(padding: const EdgeInsets.only(top: 60)),
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
              const Padding(padding: EdgeInsets.only(top: 20)),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: TextField(
                            controller: _controller,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 40),
                              hintText:
                                  'Inserisci la specifica categoria che ti interessa, lascia vuoto per cercare ovunque',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ElevatedButton.icon(
                          onPressed: checkInterests,
                          icon: Icon(Icons.search),
                          label: Text('Cerca'))),
                ],
              ),
              Container(
                child: Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: interests.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile',
                              arguments: interests[index]["data"]);
                        },
                        dense: true,
                        leading: const Icon(Icons.person, size: 35),
                        title: Center(
                            child: DefaultTextStyle(
                                style: const TextStyle(
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
