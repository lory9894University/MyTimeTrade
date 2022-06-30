import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      onTap: (index) {
        if(index == 0) {
          Navigator.pushNamed(context, '/amici');
        }
        else if (index == 1) {
          Navigator.pushNamed(context, '/accetta');
        }
        else if (index == 2) {
          Navigator.pushNamed(context, '/');
        }
        else if (index == 3) {
          Navigator.pushNamed(context, '/profile',
          arguments: Profile_Passage("Andrea", "D'Angelo", "", ""));
        }
        else if (index == 4) {
          Navigator.pushNamed(context, '/servizi');
        }
      },
      items: const <Widget>[
        Icon(Icons.handshake, size: 30),
        Icon(Icons.check_outlined, size: 30),
        Icon(Icons.home, size: 30),
        Icon(Icons.person, size: 30),
        Icon(Icons.map, size: 30)
      ],
    );
  }
}
