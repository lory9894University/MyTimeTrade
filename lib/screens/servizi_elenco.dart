import 'package:flutter/material.dart';

class ServiziElenco extends StatefulWidget {
  @override
  _ServiziElencoState createState() => _ServiziElencoState();
}

class _ServiziElencoState extends State<ServiziElenco> {
  int _selectedIndex = 0;
  String dropdownvalue = 'Cucina';
  var items = [
    'Informatica',
    'Cucina',
    'Lavori in casa',
    'Lingue straniere',
    'Allenamento',
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text("Servizi",
                style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: 0.5),
              ),
            ],
          ),
              Row(
                children: <Widget>[
                  DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
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
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text("Programmazione"),
                    Divider(
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Flexible( //TODO: Cambiare in lista infinita
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Text('Map'),
                ),
                ListTile(
                  leading: Image.asset('assets/img/handshake.png'),
                  title: Text('Map'),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.handshake),
            label: 'Servizi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Vicino a te',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}