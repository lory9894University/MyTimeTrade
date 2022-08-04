import 'dart:ui';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:location/location.dart';
import 'package:mytimetrade/widgets/global.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions;
  final Image img;
  final Function() callback;

  const CustomDialogBox(
      {Key? key,
      required this.title,
      required this.descriptions,
      required this.img,
      required this.callback})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  TextEditingController addressController = TextEditingController();

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
          padding: EdgeInsets.only(
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
                controller: addressController,
                decoration: InputDecoration(
                  labelText: "Indirizzo",
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    child: FlatButton(
                        onPressed: () async {
                          String address = await currentLocation();
                          addressController.text = address;
                          setState(() {});
                        },
                        child: Text(
                          "Usa posizione",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                  Container(
                    child: FlatButton(
                        onPressed: () async {
                          await updateDb(addressController.text);
                        },
                        child: Text(
                          "Conferma",
                          style: TextStyle(fontSize: 18),
                        )),
                  ),
                ],
              ),
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
  }

  updateDb(String address) async {
    try {
      List<geocoding.Location> locations =
          await geocoding.locationFromAddress(address);
      geocoding.Location location = locations[0];
      FirebaseDatabase.instance
          .ref()
          .child("users")
          .child(logged_user!.uid)
          .update({
        "address": address,
        "lat": location.latitude,
        "lng": location.longitude,
      });
      global_user_data!.address = addressController.text;
      global_user_data!.lat = location.latitude;
      global_user_data!.lng = location.longitude;
      widget.callback();
      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          'l\'indirizzo non esiste',
          textAlign: TextAlign.center,
        )));
      }
    }
  }
}
