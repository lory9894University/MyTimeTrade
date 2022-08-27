import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:localization/localization.dart';
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
          padding: const EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                key: const Key("address_box"),
                controller: addressController,
                decoration: InputDecoration(
                  labelText: "address".i18n(),
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                        onPressed: () async {
                          String address = await currentLocation();
                          addressController.text = address;
                          setState(() {});
                        },
                        child: Text(
                          "use current position".i18n(),
                          style: const TextStyle(fontSize: 15),
                        )),
                  ),
                  Expanded(
                    child: FlatButton(
                        key: const Key('confirm_address'),
                        onPressed: () async {
                          await updateDb(addressController.text);
                        },
                        child: Text(
                          "confirm".i18n(),
                          style: const TextStyle(fontSize: 15),
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
                borderRadius: const BorderRadius.all(
                    Radius.circular(Constants.avatarRadius)),
                child: Image.asset("assets/img/handshake.png")),
          ),
        ),
      ],
    );
  }

  Future<String> currentLocation() async {
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
          .child(loggedUser!.uid)
          .update({
        "address": address,
        "lat": location.latitude,
        "lng": location.longitude,
      });
      globalUserData!.address = addressController.text;
      globalUserData!.lat = location.latitude;
      globalUserData!.lng = location.longitude;
      widget.callback();
      Navigator.pop(context);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          'address_not_found'.i18n(),
          textAlign: TextAlign.center,
        )));
      }
    }
  }
}
