import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../widgets/BottomBar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Map<String, String> args = Map<String, String>.from(
      {"name": "", "phone": "", "address": "", "interest": "", "uid": ""});

  @override
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
              Row(
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
              const Padding(padding: EdgeInsets.only(top: 100)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("address".i18n()),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 15)),
              Row(
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
              const Padding(padding: EdgeInsets.only(top: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("phoneNr".i18n()),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 15)),
              Row(
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
              const Padding(padding: EdgeInsets.only(top: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    child: Text("service requested".i18n()),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 15)),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15.0,
                      color: Colors.black,
                    ),
                    child: Text("${args['interest']}"),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 100)),
              Row(
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
                            number: args['phone']?.replaceAll(" ", ""),
                            message: "hi".i18n() +
                                args['name']! +
                                "whatsapp message".i18n() +
                                args['interest']!);
                      },
                      child: Text(
                        'contact'.i18n(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
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
                        Navigator.pushNamed(context, '/ore', arguments: args);
                      },
                      child: Text(
                        'request service'.i18n(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 80))
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(index: index, context: context),
    );
  }
}
