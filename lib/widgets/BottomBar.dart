import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mytimetrade/widgets/global.dart';

class BottomBar extends StatelessWidget {
  int index;

  BuildContext context;

  BottomBar({Key? key, required this.index, required this.context})
      : super(key: key);

  @override
  Widget build(context2) {
    return CurvedNavigationBar(
      index: index,
      backgroundColor: Colors.transparent,
      height: 60,
      onTap: (index) async {
        if (index == 0) {
          Navigator.pushReplacementNamed(context, '/amici');
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, '/accetta');
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, '/welcome',
              arguments: loggedUser);
        } else if (index == 3) {
          Navigator.pushReplacementNamed(context, '/pers_profile');
        } else if (index == 4) {
          Navigator.pushReplacementNamed(context, '/servizi');
        }
      },
      items: const <Widget>[
        Icon(Icons.handshake, size: 30),
        Icon(Icons.check_outlined, size: 30),
        Icon(Icons.home, size: 30),
        Icon(Icons.person, size: 30),
        Icon(Icons.map, size: 30),
      ],
    );
  }
}
