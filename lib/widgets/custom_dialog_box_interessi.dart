import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:mytimetrade/widgets/global.dart';

class InteressiDialogBox extends StatefulWidget {
  final String title;
  final Image img;
  final Function(Map<String, dynamic>) callback;

  const InteressiDialogBox(
      {Key? key,
      required this.title,
      required this.img,
      required this.callback})
      : super(key: key);

  @override
  _InteressiDialogBoxState createState() => _InteressiDialogBoxState();
}

class _InteressiDialogBoxState extends State<InteressiDialogBox> {
  TextEditingController interessiController = TextEditingController();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Interessi",
                ),
              ),
              SizedBox(
                height: 22,
              ),
              FlatButton(
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
                      widget.callback(interest);
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
                    var connectivityResult =
                        await Connectivity().checkConnectivity();
                    if (connectivityResult == ConnectivityResult.none) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(offlineSnackBar);
                    }
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Aggiungi",
                    style: TextStyle(fontSize: 18),
                  )),
            ],
          ),
        ),
        Positioned(
          left: Constants.padding,
          right: Constants.padding,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: Constants.avatarRadius,
            child: ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/img/handshake.png")),
          ),
        ),
      ],
    );
  }
}
