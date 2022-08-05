import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/BottomBar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, String> args = Map<String, String>.from(
      {"name": "", "phone": "", "address": "", "interest": "", "uid": ""});

  void didChangeDependencies() {
    args = ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    super.didChangeDependencies();
  }

  void launchWhatsapp({required number, required message}) async {
    String url = "whatsapp://send?phone=$number&text=$message";
    await canLaunchUrlString(url)
        ? launchUrlString(url)
        : print("Errore: fallimento totale");
  }

  @override
  Widget build(BuildContext context) {
    var index = 3;
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
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 60)),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Icon(Icons.person, size: 35),
                    DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 27.0,
                          color: Colors.black,
                        ),
                        child: Text('${args['name']}'))
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 100)),
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
              const Padding(padding: EdgeInsets.only(top: 15)),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      constraints:
                          const BoxConstraints(minWidth: 100, maxWidth: 350),
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        child: Text('${args['address']}'),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
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
                      child: Text("Telefono"),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 15)),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      constraints:
                          const BoxConstraints(minWidth: 100, maxWidth: 350),
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        child: Text('${args['phone']}'),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
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
                      child: Text("lavoro richiesto"),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 15)),
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      //constraints: BoxConstraints(minWidth: 100, maxWidth: 350),
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 15.0,
                          color: Colors.black,
                        ),
                        child: Text("${args['interest']}"),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 100)),
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
                          launchWhatsapp(
                              number: 3425934167, message: "hahahahahah");
                          /*User? user = await AuthOperation.registerUserAndSignIn(
                          emailController.text, passwordController.text);
                      if (user != null) {
                        Navigator.pushReplacementNamed(context, '/', arguments: user);
                      }
                        var lavoro = "lavoro da insegnante di liceo";
                        Share.share(
                            "Ciao! Ti contatto dall'applicazione MyTimeTrade per quel " +
                                lavoro); */
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
                          //TODO: mi piacerebbe aggiungere una nuova casella di testo per inserire informazioni aggiuntive
                          Navigator.pushNamed(context, '/ore', arguments: args);
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
              Padding(padding: EdgeInsets.only(top: 80))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(index: index, context: context),
    );
  }
}
