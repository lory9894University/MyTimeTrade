import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytimetrade/widgets/userSingleton.dart';

import '../screens/Profile_Passage.dart';

class BottomBar extends StatelessWidget {
  var index;

  var context;

  BottomBar({Key? key, required this.index, required this.context});

  @override
  Widget build(context) {
    return CurvedNavigationBar(
      index: index,
      backgroundColor: Colors.transparent,
      height: 60,
      items: <Widget>[
        IconButton(
          iconSize: 30,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/amici');
          },
          icon: const Icon(Icons.handshake),
          tooltip: 'Invita i tuoi amici',
        ),
        IconButton(
          iconSize: 30,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/accetta');
          },
          icon: const Icon(Icons.check_outlined),
          tooltip: 'Accetta',
        ),
        IconButton(
          iconSize: 30,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/welcome',
                arguments: logged_user!);
          },
          icon: const Icon(Icons.home),
          tooltip: 'Home',
        ),
        IconButton(
          iconSize: 30,
          onPressed: () {
            Navigator.pushReplacementNamed(
              context,
              '/profile',
              arguments: Profile_Passage(
                "Andrea",
                "Developer",
                "",
                "",
              ),
            );
          },
          icon: const Icon(Icons.person),
          tooltip: 'Profilo',
        ),
        IconButton(
          iconSize: 30,
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/servizi');
          },
          icon: const Icon(Icons.map),
          tooltip: 'Servizi',
        ),
      ],
    );
  }
}
