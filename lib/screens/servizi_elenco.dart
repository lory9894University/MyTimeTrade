import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:mytimetrade/widgets/global.dart';

import '../widgets/BottomBar.dart';
import 'Profile_Passage.dart';

class ServiziElenco extends StatefulWidget {
  @override
  _ServiziElencoState createState() => _ServiziElencoState();
}

class _ServiziElencoState extends State<ServiziElenco> {
  String servizio = '';
  TextEditingController _controller = TextEditingController();
  var items = [
    'Unity',
    'Unreal Engine',
    'C++',
    'Dart',
    'JavaScript',
  ];
  String dropdownvalue = 'Unity';

  void _goToProfilo(String nome, String cognome) {
    Navigator.pushNamed(
      context,
      '/profile',
      arguments: Profile_Passage(nome, cognome, "", "Unity"),
    );
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
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DropdownButton(
                      value: dropdownvalue,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Center(
                              child: DefaultTextStyle(
                                  style: TextStyle(
                                      fontStyle: FontStyle.italic,
                                      color: Colors.black,
                                      fontSize: 18),
                                  child: Text(items))),
                        );
                      }).toList(),
                      // After selecting the desired option,it will
                      // change button value to selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
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
                  //TODO: Cambiare in lista infinita
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ListTile(
                        onTap: () => _goToProfilo("Andrea", "D'Angelo"),
                        dense: true,
                        leading: Icon(Icons.person, size: 35),
                        title: Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                child: Text("Andrea D'Angelo"))),
                      ),
                      ListTile(
                        onTap: () => _goToProfilo("Lorenzo", "Dentis"),
                        dense: true,
                        leading: Icon(Icons.person, size: 35),
                        title: Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                child: Text("Lorenzo Dentis"))),
                      ),
                      ListTile(
                        onTap: () => _goToProfilo("Francesca", "Rinaldi"),
                        dense: true,
                        leading: Icon(Icons.person, size: 35),
                        title: Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                child: Text("Francesca Rinaldi"))),
                      ),
                      ListTile(
                        onTap: () => _goToProfilo("Marta", "Meroni"),
                        dense: true,
                        leading: Icon(Icons.person, size: 35),
                        title: Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                child: Text("Marta Meroni"))),
                      ),
                      ListTile(
                        onTap: () => _goToProfilo("Matteo", "Filisti"),
                        dense: true,
                        leading: Icon(Icons.person, size: 35),
                        title: Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                child: Text("Matteo Filisti"))),
                      ),
                      ListTile(
                        onTap: () => _goToProfilo("Sandra", "Keyhole"),
                        dense: true,
                        leading: Icon(Icons.person, size: 35),
                        title: Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                child: Text("Sandra Keyhole"))),
                      ),
                      ListTile(
                        onTap: () => _goToProfilo("Marco", "Demasi"),
                        dense: true,
                        leading: Icon(Icons.person, size: 35),
                        title: Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                                child: Text("Marco Demasi"))),
                      ),
                    ],
                  ),
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
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async {
                    if (_controller.text.isEmpty) {
                      if (mounted) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
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
                    } else {
                      if (mounted) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
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
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomBar(
          index: index,
          context: context,
        ));
  }
}
