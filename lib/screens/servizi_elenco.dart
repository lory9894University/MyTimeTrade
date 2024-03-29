import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:localization/localization.dart';
import 'package:location/location.dart';
import 'package:mytimetrade/widgets/global.dart';

import '../widgets/BottomBar.dart';

class ServiziElenco extends StatefulWidget {
  const ServiziElenco({Key? key}) : super(key: key);

  @override
  _ServiziElencoState createState() => _ServiziElencoState();
}

class _ServiziElencoState extends State<ServiziElenco> {
  String servizio = '';
  List<dynamic> interests = List<dynamic>.empty(growable: true);
  final TextEditingController _controller = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;

  void checkInterests() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('error'.i18n()),
          content: Text('services offline'.i18n()),
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
    FocusManager.instance.primaryFocus?.unfocus();
    showDialog(
        barrierColor: Colors.black.withOpacity(0),
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: CircularProgressIndicator(),
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
            center: center, radius: globalUserData!.radius, field: 'position');
    stream.listen((List<DocumentSnapshot> documentList) {
      for (DocumentSnapshot document in documentList) {
        var data = document.data() as Map<dynamic, dynamic>;
        if (data['user_id'] != globalUserData!.uid) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("services".i18n()),
                  ),
                ],
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
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              hintText: 'category'.i18n(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: ElevatedButton.icon(
                          onPressed: checkInterests,
                          icon: const Icon(Icons.search),
                          label: Text('search'.i18n())))
                ],
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: interests.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        var interest = await selectedInterest(
                            uid: interests[index]['data']['user_id'],
                            interestName: interests[index]['data']['interest']);
                        Navigator.pushNamed(context, '/profile',
                            arguments: interest);
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
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
          index: index,
          context: context,
        ));
  }

  Future<LocationData> currentLocation() async {
    Location location = Location();
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

  Future<Map<String, String>> selectedInterest(
      {required String uid, required String interestName}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref('users/$uid');
    DatabaseEvent event = await ref.once();
    var snapshot = event.snapshot.value as Map<dynamic, dynamic>;

    return Map<String, String>.from({
      "uid": uid,
      "name": snapshot['name'],
      "phone": snapshot['phoneNr'],
      "address": snapshot['address'],
      "interest": interestName
    });
  }
}
