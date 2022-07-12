import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mytimetrade/screens/Profile_Passage.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/BottomBar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Profile_Passage args = Profile_Passage('', '', '', '');

  void didChangeDependencies() {
    args = ModalRoute.of(context)?.settings.arguments as Profile_Passage;
    super.didChangeDependencies();
  }

  void launchWhatsapp({required number, required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunchUrlString(url) ? launchUrlString(url) : print("Errore: fallimento totale");
  }

  @override
  Widget build(BuildContext context) {
    var index = 3;
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Icon(Icons.person, size: 35),
                  DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 27.0,
                        color: Colors.black,
                      ),
                      child: Text('${args.nome} ${args.cognome}'))
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("Indirizzo"),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 15)),
            Container(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 350),
                    child: const DefaultTextStyle(
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                      child: Text("Via Tal dei Tali, 65, 13478, Bergamo"),
                    ),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  DefaultTextStyle(
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("Interessi"),
                  ),
                ],
              ),
            ),
            ListView(
              //TODO: Impostare il ListView.builder(), https://www.javatpoint.com/flutter-lists, dopo aver collegato DB
              shrinkWrap: true,
              children: const <Widget>[
                ListTile(
                  dense: true,
                  title: Center(
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 15),
                          child: Text('Inglese'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 15),
                          child: Text('Spagnolo'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 15),
                          child: Text('Dolci freddi'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 15),
                          child: Text('Elettronica'))),
                ),
                ListTile(
                  dense: true,
                  title: Center(
                      child: DefaultTextStyle(
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 15),
                          child: Text('Make-up Artist'))),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () async {
                        launchWhatsapp(number: 3425934167, message: "hahahahahah");
                        /*User? user = await AuthOperation.registerUserAndSignIn(
                          emailController.text, passwordController.text);
                      if (user != null) {
                        Navigator.pushReplacementNamed(context, '/', arguments: user);
                      }
                        var lavoro = "lavoro da insegnante di liceo";
                        Share.share(
                            "Ciao! Ti contatto dall'applicazione MyTimeTrade per quel " +
                                lavoro);*/
                      },
                      child: const Text(
                        'Contatta',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () {
                        if (args.servizio != '') {
                          Navigator.pushNamed(
                            context,
                            '/ore',
                            arguments: Profile_Passage(
                              args.nome,
                              args.cognome,
                              "",
                              args.servizio,
                            ),
                          );
                        } else {
                          null;
                        }
                      },
                      child: const Text(
                        'Richiedi ore',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(index: index, context: context),
    );
  }
}
